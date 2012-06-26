Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Chamillionaire.breakpoint.cc ([80.244.247.6]:33178 "EHLO
	Chamillionaire.breakpoint.cc" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758783Ab2FZRlP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jun 2012 13:41:15 -0400
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: [PATCH] kbuild: add a rule to just create one file for kernel doc
Date: Tue, 26 Jun 2012 19:40:27 +0200
Message-Id: <1340732427-3747-1-git-send-email-sebastian@breakpoint.cc>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Richard Weinberger <richard@nod.at>

If you are chaning the file and you want to verify that it looks good it
is helpfull to just re-run for the single file instead of running the
complete htmldocs target.

With this patch one can run
|	make drivers/mtd/ubi/wl.html
and create the output just for this file.

Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 Makefile               |    2 ++
 scripts/Makefile.build |    6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 3fdfde2..eccf5cf 100644
--- a/Makefile
+++ b/Makefile
@@ -1338,6 +1338,8 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 %.o: %.S prepare scripts FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+%.html: %.c FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 %.symtypes: %.c prepare scripts FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ff1720d..75a1823 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -209,6 +209,12 @@ cmd_cc_i_c       = $(CPP) $(c_flags)   -o $@ $<
 $(obj)/%.i: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_i_c)
 
+quiet_cmd_doc_html_c	= HTML $@
+cmd_doc_html_c		= $(srctree)/scripts/kernel-doc -html $< > $@
+
+$(obj)/%.html: $(src)/%.c FORCE
+	$(call if_changed,doc_html_c)
+
 cmd_gensymtypes =                                                           \
     $(CPP) -D__GENKSYMS__ $(c_flags) $< |                                   \
     $(GENKSYMS) $(if $(1), -T $(2)) -a $(ARCH)                              \
-- 
1.7.10

