Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:46350 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751226Ab1FGUwW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jun 2011 16:52:22 -0400
Received: by iyb14 with SMTP id 14so4344748iyb.19
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jun 2011 13:52:22 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv4] Kbuild: factor parser rules
Date: Tue,  7 Jun 2011 16:52:11 -0400
Message-Id: <1307479931-10424-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <20110607152950.GA4612@sepie.suse.cz>
References: <20110607152950.GA4612@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Hi Michal,

Here is some update concerning the parser generation merge. I do not repost the
whole serie as it may be overkill. You can find the latest branch at:

git://github.com/lacombar/linux-2.6.git kbuild-implicit-parser-rule

For the record, I did full test build in the following environment:

% cat allno.config 
CONFIG_SCSI=y
CONFIG_SCSI_LOWLEVEL=y
CONFIG_SCSI_AIC7XXX=y
CONFIG_SCSI_AIC79XX=y
CONFIG_AIC7XXX_REG_PRETTY_PRINT=y
CONFIG_AIC79XX_REG_PRETTY_PRINT=y
CONFIG_NETDEVICES=y
CONFIG_NET=y
CONFIG_HDLC=y
CONFIG_EISA=y
CONFIG_PCI=y
CONFIG_VT=y
CONFIG_HW_CONSOLE=y
CONFIG_WAN=y
CONFIG_WANXL=y

% gmake CONFIG_DTC=y CONFIG_MODVERSIONS=y REGENERATE_PARSERS=1 \
    scripts allnoconfig vmlinux

finalize without error.

Then, re-started after having updated the parsers:

% touch scripts/*/*.[ly]

finalized without error.

Then, various combinaison of:

% git clean -fdx scripts/

% rm -f $(find . -name *_shipped | sed 's/_shipped//')

% rm -f $(find scripts/ -name '*_shipped') scripts/dtc/dtc-parser.tab.* scripts/genksyms/parse.tab.*

All build finalized without error.

You'll find an updated diff between v3 and v4 below.

Changes since v3:
 - fix the %_shipped implicit rule
 - attempt to tweak the relation between `$(src)/%.tab.c_shipped' and
   `$(src)/%.tab.h_shipped' to make it more robust. This is _very_ delicate as
   gmake has trouble to properly generate `$(obj)/%.tab.h' from
   `$(src)/%.tab.h_shipped' if it is missing and requires
   `$(src)/%.tab.c_shipped' to be created. This now survives a full deletion of
   the %_shipped files.
 - a few spacing nits
 - removes a few useless explicit dependency
 - do not degerate extra `lex.debug' file when regenerating kconfig's parser
 - removed missed occurences of YYDEBUG

Changes since v2:
 - allow a parser to specify the prefix to be used. This will allow for multiple
  parser to use the implicit rules, which was not previously possible, as it
  was using the `yy' default.
 - drop the zconf prefix changes
 - add a `baseprereq' global to kbuild, which mimics `basetarget'
 - rebase on top of v3.0-rc1

Changes since v1:
 - include scripts/dtc/' parser in the scope of the patchset
 - do not rename any parser source
 - make lexer file name consistent, ie. name it %.lex.c, not lex.%.c
 - rebase on top of v2.6.39

Regards,
 - Arnaud

Arnaud Lacombe (13):
      kbuild: add `baseprereq'
      kbuild: add implicit rules for parser generation
      kbuild: simplify the %_shipped rule
      genksyms: pass hash and lookup functions name and target language though the input file
      genksyms: migrate parser to implicit rules
      genksym: regen parser
      kconfig: constify `kconf_id_lookup'
      kconfig: kill no longer needed reference to YYDEBUG
      kconfig/zconf.l: do not ask to generate backup
      kconfig: migrate parser to implicit rules
      kconfig: regen parser
      dtc: migrate parser to implicit rules
      dtc: regen parser

---
 scripts/Makefile.lib      |   19 +++++--------------
 scripts/dtc/Makefile      |    3 +--
 scripts/genksyms/Makefile |    5 ++++-
 scripts/kconfig/zconf.l   |    4 ++--
 scripts/kconfig/zconf.y   |    2 --
 5 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f76d9ba..ad062b7 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -161,10 +161,12 @@ modname-multi = $(sort $(foreach m,$(multi-used),\
 		$(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs)) $($(m:.o=-y))),$(m:.o=))))
 
 ifdef REGENERATE_PARSERS
+
 # GPERF
 # ---------------------------------------------------------------------------
 quiet_cmd_gperf = GPERF $@
       cmd_gperf = gperf -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<
+
 $(src)/%.hash.c_shipped: $(src)/%.gperf
 	$(call cmd,gperf)
 
@@ -180,10 +182,10 @@ $(src)/%.lex.c_shipped: $(src)/%.l
 # ---------------------------------------------------------------------------
 quiet_cmd_bison = YACC    $@
       cmd_bison = bison -o$@ -d -t -l -p $(if $(YACC_PREFIX_${baseprereq}),$(YACC_PREFIX_${baseprereq}),yy) $<
-$(src)/%.tab.c_shipped: $(src)/%.y
+
+$(src)/%.tab.c_shipped $(src)/%.tab.h_shipped: $(src)/%.y
 	$(call cmd,bison)
 
-$(src)/%.tab.h_shipped: $(src)/%.tab.c_shipped
 endif
 
 # Shipped files
@@ -192,20 +194,9 @@ endif
 quiet_cmd_shipped = SHIPPED $@
 cmd_shipped = cat $< > $@
 
-$(obj)/%.tab.c: $(src)/%.tab.c_shipped
-	$(call cmd,shipped)
-
-$(obj)/%.tab.h: $(src)/%.tab.h_shipped
+$(obj)/%: $(src)/%_shipped
 	$(call cmd,shipped)
 
-$(obj)/%.lex.c: $(src)/%.lex.c_shipped
-	$(call cmd,shipped)
-
-$(obj)/%.hash.c: $(src)/%.hash.c_shipped
-	$(call cmd,shipped)
-
-$(obj)/%:: $(src)/%_shipped
-
 # Commands useful for building a boot image
 # ===========================================================================
 # 
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 5bac1cb..a957ab4 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -26,7 +26,6 @@ HOSTCFLAGS_dtc-parser.tab.o := $(HOSTCFLAGS_DTC)
 
 # dependencies on generated files need to be listed explicitly
 $(obj)/dtc-parser.tab.o: $(obj)/dtc-parser.tab.c $(obj)/dtc-parser.tab.h
-$(obj)/dtc-lexer.lex.o:  $(obj)/dtc-lexer.lex.c $(obj)/dtc-parser.tab.h
 
-targets += dtc-parser.tab.c dtc-lexer.lex.c
+$(obj)/dtc-lexer.lex.o: $(obj)/dtc-parser.tab.c $(obj)/dtc-parser.tab.h
 
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index fdaf764..0b883e3 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -7,5 +7,8 @@ genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 # -I needed for generated C source (shipped source)
 HOSTCFLAGS_parse.tab.o := -Wno-uninitialized -I$(src)
 
-$(obj)/lex.lex.o: $(obj)/parse.tab.h $(obj)/keywords.hash.c
+$(obj)/parse.tab.o: $(obj)/parse.tab.c $(obj)/parse.tab.h
+
+$(obj)/lex.lex.o: $(obj)/keywords.hash.c
+$(obj)/lex.lex.o: $(obj)/parse.tab.c $(obj)/parse.tab.h
 
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 98aad53..ddee5fc 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -1,5 +1,5 @@
-%option backup nostdinit noyywrap never-interactive full ecs
-%option 8bit backup nodefault perf-report perf-report
+%option nostdinit noyywrap never-interactive full ecs
+%option 8bit nodefault perf-report perf-report
 %option noinput
 %x COMMAND HELP STRING PARAM
 %{
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index f661b4c..c38cc5a 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -499,10 +499,8 @@ void conf_parse(const char *name)
 	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 
-#if YYDEBUG
 	if (getenv("ZCONF_DEBUG"))
 		zconfdebug = 1;
-#endif
 	zconfparse();
 	if (zconfnerrs)
 		exit(1);

-- 
1.7.3.4.574.g608b.dirty
