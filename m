Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42809 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758736AbYAXWDv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:51 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 12/77] kbuild: implement modules.order
Date: Thu, 24 Jan 2008 23:02:53 +0100
Message-Id: <1201212238-4369-12-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Tejun Heo <htejun@gmail.com>, Bill Nottingham <notting@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>, Sam Ravnborg <sam@ravnborg.org>

From: Tejun Heo <htejun@gmail.com>

When multiple built-in modules (especially drivers) provide the same
capability, they're prioritized by link order specified by the order
listed in Makefile.  This implicit ordering is lost for loadable
modules.

When driver modules are loaded by udev, what comes first in
modules.alias file is selected.  However, the order in this file is
indeterministic (depends on filesystem listing order of installed
modules).  This causes confusion.

The solution is two-parted.  This patch updates kbuild such that it
generates and installs modules.order which contains the name of
modules ordered according to Makefile.  The second part is update to
depmod such that it generates output files according to this file.

Note that both obj-y and obj-m subdirs can contain modules and
ordering information between those two are lost from beginning.
Currently obj-y subdirs are put before obj-m subdirs.

Sam Ravnborg cleaned up Makefile modifications and suggested using awk
to remove duplicate lines from modules.order instead of using separate
C program.

Signed-off-by: Tejun Heo <htejun@gmail.com>
Cc: Bill Nottingham <notting@redhat.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Kay Sievers <kay.sievers@vrfy.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile               |    8 +++++++-
 scripts/Makefile.build |   17 ++++++++++++++++-
 scripts/Makefile.lib   |    6 ++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c546e05..532981a 100644
--- a/Makefile
+++ b/Makefile
@@ -1021,9 +1021,14 @@ ifdef CONFIG_MODULES
 all: modules
 
 #	Build modules
+#
+#	A module can be listed more than once in obj-m resulting in
+#	duplicate lines in modules.order files.  Those are removed
+#	using awk while concatenating to the final file.
 
 PHONY += modules
 modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux)
+	$(Q)$(AWK) '!x[$$0]++' $(vmlinux-dirs:%=$(objtree)/%/modules.order) > $(objtree)/modules.order
 	@echo '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
@@ -1051,6 +1056,7 @@ _modinst_:
 		rm -f $(MODLIB)/build ; \
 		ln -s $(objtree) $(MODLIB)/build ; \
 	fi
+	@cp -f $(objtree)/modules.order $(MODLIB)/
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
 # This depmod is only for convenience to give the initial
@@ -1110,7 +1116,7 @@ clean: archclean $(clean-dirs)
 	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
-		-o -name '*.symtypes' \) \
+		-o -name '*.symtypes' -o -name 'modules.order' \) \
 		-type f -print | xargs rm -f
 
 # mrproper - Delete all generated files, including .config
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index de9836e..db38ef4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -83,10 +83,12 @@ ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(lib-target)),)
 builtin-target := $(obj)/built-in.o
 endif
 
+modorder-target := $(obj)/modules.order
+
 # We keep a list of all modules in $(MODVERDIR)
 
 __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
-	 $(if $(KBUILD_MODULES),$(obj-m)) \
+	 $(if $(KBUILD_MODULES),$(obj-m) $(modorder-target)) \
 	 $(subdir-ym) $(always)
 	@:
 
@@ -276,6 +278,19 @@ targets += $(builtin-target)
 endif # builtin-target
 
 #
+# Rule to create modules.order file
+#
+# Create commands to either record .ko file or cat modules.order from
+# a subdirectory
+modorder-cmds =						\
+	$(foreach m, $(modorder),			\
+		$(if $(filter %/modules.order, $m),	\
+			cat $m;, echo kernel/$m;))
+
+$(modorder-target): $(subdir-ym) FORCE
+	$(Q)(cat /dev/null; $(modorder-cmds)) > $@
+
+#
 # Rule to compile a set of .o files into one .a file
 #
 ifdef lib-target
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3c5e88b..8e44023 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -25,6 +25,11 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # o if we encounter foo/ in $(obj-m), remove it from $(obj-m) 
 #   and add the directory to the list of dirs to descend into: $(subdir-m)
 
+# Determine modorder.
+# Unfortunately, we don't have information about ordering between -y
+# and -m subdirs.  Just put -y's first.
+modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
+
 __subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
 subdir-y	+= $(__subdir-y)
 __subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
@@ -64,6 +69,7 @@ real-objs-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)
 extra-y		:= $(addprefix $(obj)/,$(extra-y))
 always		:= $(addprefix $(obj)/,$(always))
 targets		:= $(addprefix $(obj)/,$(targets))
+modorder	:= $(addprefix $(obj)/,$(modorder))
 obj-y		:= $(addprefix $(obj)/,$(obj-y))
 obj-m		:= $(addprefix $(obj)/,$(obj-m))
 lib-y		:= $(addprefix $(obj)/,$(lib-y))
-- 
1.5.4.rc3.14.g44397

