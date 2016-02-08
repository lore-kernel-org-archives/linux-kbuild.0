Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:61124 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755478AbcBHUnl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 15:43:41 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 1/6] kbuild: record needed exported symbols for modules
Date: Mon, 08 Feb 2016 15:28:30 -0500
Message-id: <1454963315-20468-2-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

Kernel modules are partially linked object files with some undefined
symbols that are expected to be matched with EXPORT_SYMBOL() entries
from elsewhere.

Each .tmp_versions/*.mod file currently contains two line of text
separated by a newline character. The first line has the actual module
file name while the second line has a list of object files constituting
that module. Those files are parsed by modpost (scripts/mod/sumversion.c),
scripts/Makefile.modpost, scripts/Makefile.modsign, etc.  Only the
modpost utility cares about the second line while the others retrieve
only the first line.

Therefore we can add a third line to record the list of undefined symbols
aka required EXPORT_SYMBOL() entries for each module into that file
without breaking anything. Like for the second line, symbols are separated
by a blank and the list is terminated with a newline character.

To avoid needless build overhead, the undefined symbols extraction is
performed only when CONFIG_TRIM_UNUSED_EXPSYMS is selected.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 scripts/Makefile.build | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2c47f9c305..1d8b07ea3e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -253,6 +253,13 @@ define rule_cc_o_c
 	mv -f $(dot-target).tmp $(dot-target).cmd
 endef
 
+# List module undefined symbols
+ifdef CONFIG_TRIM_UNUSED_EXPSYMS
+cmd_undef_syms = $(NM) $@ | sed -n 's/^ \+U \(.*\)/\1/p' | xargs echo
+else
+cmd_undef_syms = echo
+endif
+
 # Built-in and composite module parts
 $(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
 	$(call cmd,force_checksrc)
@@ -263,7 +270,8 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
 $(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
-	@{ echo $(@:.o=.ko); echo $@; } > $(MODVERDIR)/$(@F:.o=.mod)
+	@{ echo $(@:.o=.ko); echo $@; \
+	   $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
 
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
@@ -393,7 +401,8 @@ $(call multi_depend, $(multi-used-y), .o, -objs -y)
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-	@{ echo $(@:.o=.ko); echo $(link_multi_deps); } > $(MODVERDIR)/$(@F:.o=.mod)
+	@{ echo $(@:.o=.ko); echo $(link_multi_deps); \
+	   $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
 targets += $(multi-used-y) $(multi-used-m)
-- 
2.5.0

