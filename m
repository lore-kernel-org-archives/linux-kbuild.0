Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:55903 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750725AbdKEJoj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Nov 2017 04:44:39 -0500
Received: by mail-lf0-f68.google.com with SMTP id e143so7432351lfg.12
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Nov 2017 01:44:38 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Subject: [PATCH] kbuild: /bin/pwd -> pwd
Date: Sun,  5 Nov 2017 10:44:16 +0100
Message-Id: <20171105094416.12220-1-bjorn.forsman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>

Most places use pwd and rely on $PATH lookup. Moving the remaining
absolute path /bin/pwd users over for consistency.

Also, a reason for doing /bin/pwd -> pwd instead of the other way around
is because I believe build systems should make little assumptions on
host filesystem layout. Case in point, we do this kind of patching
already in NixOS.

Ref. commit 028568d84da3cfca49f5f846eeeef01441d70451
("kbuild: revert $(realpath ...) to $(shell cd ... && /bin/pwd)").

Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
---
 Documentation/ia64/xen.txt     | 2 +-
 Makefile                       | 2 +-
 tools/power/cpupower/Makefile  | 2 +-
 tools/scripts/Makefile.include | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

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
index 3a8868ee967e..a3eed17080b0 100644
--- a/Makefile
+++ b/Makefile
@@ -132,7 +132,7 @@ ifneq ($(KBUILD_OUTPUT),)
 # check that the output directory actually exists
 saved-output := $(KBUILD_OUTPUT)
 KBUILD_OUTPUT := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) \
-								&& /bin/pwd)
+								&& pwd)
 $(if $(KBUILD_OUTPUT),, \
      $(error failed to create output directory "$(saved-output)"))
 
diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index d6e1c02ddcfe..c76b971d0423 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -26,7 +26,7 @@ endif
 
 ifneq ($(OUTPUT),)
 # check that the output directory actually exists
-OUTDIR := $(shell cd $(OUTPUT) && /bin/pwd)
+OUTDIR := $(shell cd $(OUTPUT) && pwd)
 $(if $(OUTDIR),, $(error output directory "$(OUTPUT)" does not exist))
 endif
 
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 654efd9768fd..3fab179b1aba 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -13,7 +13,7 @@ endif
 
 # check that the output directory actually exists
 ifneq ($(OUTPUT),)
-OUTDIR := $(shell cd $(OUTPUT) && /bin/pwd)
+OUTDIR := $(shell cd $(OUTPUT) && pwd)
 $(if $(OUTDIR),, $(error output directory "$(OUTPUT)" does not exist))
 endif
 
-- 
2.15.0

