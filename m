Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:38178 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932079AbdGXOVR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Jul 2017 10:21:17 -0400
Received: by mail-wm0-f68.google.com with SMTP id r123so3520469wmb.5
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Jul 2017 07:21:17 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Subject: [PATCH] kbuild: /bin/pwd -> pwd
Date: Mon, 24 Jul 2017 16:20:47 +0200
Message-Id: <20170724142047.3679-1-bjorn.forsman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, jan.kiszka@siemens.com, kieran@ksquared.org.uk, =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>

Several places already use pwd and rely on $PATH lookup. Moving the
remaining /bin/pwd users over for consistency.

Also, a reason for doing /bin/pwd -> pwd instead of the other way around
is because I believe build systems should make little assumptions on host
filesystem layout. Case in point, we do this kind of patching already in
NixOS.

Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
---
 Documentation/ia64/xen.txt |  2 +-
 Makefile                   | 10 +++++-----
 scripts/gdb/linux/Makefile |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/ia64/xen.txt b/Documentation/ia64/xen.txt
index c61a99f7c8bb..a12c74ce2773 100644
--- a/Documentation/ia64/xen.txt
+++ b/Documentation/ia64/xen.txt
@@ -41,7 +41,7 @@ Getting and Building Xen and Dom0
 
  5. make initrd for Dom0/DomU
     # make -C linux-2.6.18-xen.hg ARCH=ia64 modules_install \
-      O=$(/bin/pwd)/build-linux-2.6.18-xen_ia64
+      O=$(pwd)/build-linux-2.6.18-xen_ia64
     # mkinitrd -f /boot/efi/efi/redhat/initrd-2.6.18.8-xen.img \
       2.6.18.8-xen --builtin mptspi --builtin mptbase \
       --builtin mptscsih --builtin uhci-hcd --builtin ohci-hcd \
diff --git a/Makefile b/Makefile
index b4fb9a1d1594..64e72eba5701 100644
--- a/Makefile
+++ b/Makefile
@@ -131,7 +131,7 @@ ifneq ($(KBUILD_OUTPUT),)
 # check that the output directory actually exists
 saved-output := $(KBUILD_OUTPUT)
 KBUILD_OUTPUT := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) \
-								&& /bin/pwd)
+								&& pwd)
 $(if $(KBUILD_OUTPUT),, \
      $(error failed to create output directory "$(saved-output)"))
 
@@ -978,7 +978,7 @@ ifdef CONFIG_HEADERS_CHECK
 	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
 endif
 ifdef CONFIG_GDB_SCRIPTS
-	$(Q)ln -fsn `cd $(srctree) && /bin/pwd`/scripts/gdb/vmlinux-gdb.py
+	$(Q)ln -fsn `cd $(srctree) && pwd`/scripts/gdb/vmlinux-gdb.py
 endif
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
@@ -1237,7 +1237,7 @@ _modinst_:
 	@rm -rf $(MODLIB)/kernel
 	@rm -f $(MODLIB)/source
 	@mkdir -p $(MODLIB)/kernel
-	@ln -s `cd $(srctree) && /bin/pwd` $(MODLIB)/source
+	@ln -s `cd $(srctree) && pwd` $(MODLIB)/source
 	@if [ ! $(objtree) -ef  $(MODLIB)/build ]; then \
 		rm -f $(MODLIB)/build ; \
 		ln -s $(CURDIR) $(MODLIB)/build ; \
@@ -1629,11 +1629,11 @@ image_name:
 # Clear a bunch of variables before executing the submake
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && pwd) subdir=tools -C $(src)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && pwd) subdir=tools -C $(src)/tools/ $*
 
 # Single targets
 # ---------------------------------------------------------------------------
diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
index 8b00031f5349..f1ac5db46932 100644
--- a/scripts/gdb/linux/Makefile
+++ b/scripts/gdb/linux/Makefile
@@ -1,6 +1,6 @@
 always := gdb-scripts
 
-SRCTREE := $(shell cd $(srctree) && /bin/pwd)
+SRCTREE := $(shell cd $(srctree) && pwd)
 
 $(obj)/gdb-scripts:
 ifneq ($(KBUILD_SRC),)
-- 
2.12.2

