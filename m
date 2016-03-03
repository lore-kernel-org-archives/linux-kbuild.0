Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:51088 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751279AbcCCIg0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Mar 2016 03:36:26 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: suppress annoying "... is up to date." message
Date: Thu,  3 Mar 2016 17:36:30 +0900
Message-Id: <1456994190-15582-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, David Howells <dhowells@redhat.com>, Michal Marek <mmarek@suse.com>, David Woodhouse <David.Woodhouse@intel.com>, linux-kernel@vger.kernel.org

Under certain conditions, Kbuild shows "... is up to date" where
if_changed or friends are used.

For example, the incremental build of ARM64 Linux shows this message
when the kernel image has not been updated.

  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
    CHK     include/config/kernel.release
    CHK     include/generated/uapi/linux/version.h
    CHK     include/generated/utsrelease.h
    CHK     include/generated/bounds.h
    CHK     include/generated/timeconst.h
    CHK     include/generated/asm-offsets.h
    CALL    scripts/checksyscalls.sh
    CHK     include/generated/compile.h
    CHK     kernel/config_data.h
  make[1]: `arch/arm64/boot/Image.gz' is up to date.
    Building modules, stage 2.
    MODPOST 0 modules

The following is the build rule in arch/arm64/boot/Makefile:

  $(obj)/Image.gz: $(obj)/Image FORCE
          $(call if_changed,gzip)

If the Image.gz is newer than the Image and the command line has not
changed (i.e., $(any-prereq) and $(arg-check) are both empty), the
build rule $(call if_changed,gzip) is evaluated to be empty, then
GNU Make reports the target is up to date.  In order to make GNU Make
quiet, we need to give it something to do, for example, "@:".  This
should be fixed in the Kbuild core part rather than in each Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 1db6d73..b2ab2a9 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -251,7 +251,7 @@ any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
 if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
 	@set -e;                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
-	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd)
+	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Execute the command and also postprocess generated .d dependencies file.
 if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
@@ -259,14 +259,14 @@ if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
 	$(echo-cmd) $(cmd_$(1));                                             \
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
 	rm -f $(depfile);                                                    \
-	mv -f $(dot-target).tmp $(dot-target).cmd)
+	mv -f $(dot-target).tmp $(dot-target).cmd, @:)
 
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
 if_changed_rule = $(if $(strip $(any-prereq) $(arg-check) ),                 \
 	@set -e;                                                             \
-	$(rule_$(1)))
+	$(rule_$(1)), @:)
 
 ###
 # why - tell why a a target got build
-- 
1.9.1

