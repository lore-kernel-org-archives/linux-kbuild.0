Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt13.smtp-out.videotron.ca ([135.19.0.26]:21433 "EHLO
	alt12.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754344AbcC2UpK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Mar 2016 16:45:10 -0400
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v7 1/8] kbuild: record needed exported symbols for modules
Date: Tue, 29 Mar 2016 16:44:35 -0400
Message-Id: <1459284282-6676-2-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1459284282-6676-1-git-send-email-nicolas.pitre@linaro.org>
References: <1459284282-6676-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

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
performed only when CONFIG_TRIM_UNUSED_KSYMS is selected.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Acked-by: Rusty Russell <rusty@rustcorp.com.au>
---
 scripts/Makefile.build | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e1bc190709..74556e5e4e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -286,6 +286,13 @@ define rule_as_o_S
 	mv -f $(dot-target).tmp $(dot-target).cmd
 endef
 
+# List module undefined symbols (or empty line if not enabled)
+ifdef CONFIG_TRIM_UNUSED_KSYMS
+cmd_undef_syms = $(NM) $@ | sed -n 's/^ \+U //p' | xargs echo
+else
+cmd_undef_syms = echo
+endif
+
 # Built-in and composite module parts
 $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_obj) FORCE
 	$(call cmd,force_checksrc)
@@ -296,7 +303,8 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_obj) FORCE
 $(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_obj) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
-	@{ echo $(@:.o=.ko); echo $@; } > $(MODVERDIR)/$(@F:.o=.mod)
+	@{ echo $(@:.o=.ko); echo $@; \
+	   $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
 
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
@@ -426,7 +434,8 @@ $(call multi_depend, $(multi-used-y), .o, -objs -y)
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-	@{ echo $(@:.o=.ko); echo $(link_multi_deps); } > $(MODVERDIR)/$(@F:.o=.mod)
+	@{ echo $(@:.o=.ko); echo $(link_multi_deps); \
+	   $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
 targets += $(multi-used-y) $(multi-used-m)
-- 
2.5.5

