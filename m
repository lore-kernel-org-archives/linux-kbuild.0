Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:35844 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727910AbfLDT1Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 14:27:16 -0500
From: "Jory A. Pratt" <anarchy@gentoo.org>
Subject: [PATCH]gen_initramfs_list.sh failure with CONFIG_SHELL
Message-ID: <73e4e767-efd3-849a-1d7e-0e2a05fe5149@gentoo.org>
Date: Wed, 4 Dec 2019 13:27:11 -0600
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------D03701D7E36836FD45BA1BA1"
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------D03701D7E36836FD45BA1BA1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

As stated in patch the script is a non posix bash script and should use
bash instead of config_shell


--------------D03701D7E36836FD45BA1BA1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-gen_initramfs_list.sh-is-a-bash-script-that-isn-t-po.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-gen_initramfs_list.sh-is-a-bash-script-that-isn-t-po.pa";
 filename*1="tch"

From 6a7ef73882393e23e966e7b53e7b03397ad18e63 Mon Sep 17 00:00:00 2001
From: Jory Pratt <anarchy@gentoo.org>
Date: Wed, 4 Dec 2019 09:30:17 -0600
Subject: [PATCH] gen_initramfs_list.sh is a bash script that isn't posix
 compliant.

This ensures we call bash instead of sh which could be dash or any other
shell that is not compatible with the script.

Signed-off-by: Jory Pratt <anarchy@gentoo.org>
---
 usr/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/Makefile b/usr/Makefile
index e6f7cb2f81db..27987f18eb20 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -27,7 +27,7 @@ $(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
 # Generate the initramfs cpio archive
 
 hostprogs-y := gen_init_cpio
-initramfs   := $(CONFIG_SHELL) $(srctree)/$(src)/gen_initramfs_list.sh
+initramfs   := $(BASH) $(srctree)/$(src)/gen_initramfs_list.sh
 ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
 			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
 ramfs-args  := \
-- 
2.24.0


--------------D03701D7E36836FD45BA1BA1--
