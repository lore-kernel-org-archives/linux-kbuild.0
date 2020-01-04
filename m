Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:54706 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgADPDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:54 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 01/13] initramfs: replace klibcdirs in Makefile with FORCE
Date: Sun,  5 Jan 2020 00:02:26 +0900
Message-Id: <20200104150238.19834-2-masahiroy@kernel.org>
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

'klibcdirs' was added by commit d39a206bc35d ("kbuild: rebuild initramfs
if content of initramfs changes"). If this is just a matter of forcing
execution of the recipe line, we can replace it with FORCE.

I do not understand the purpose of

   $(deps_initramfs): klibcdirs

Remove it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - New patch (I forgot to submit this in v1 series)

 usr/Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index e6f7cb2f81db..55c942da01cd 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -3,9 +3,6 @@
 # kbuild file for usr/ - including initramfs image
 #
 
-klibcdirs:;
-PHONY += klibcdirs
-
 suffix_y = $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
 datafile_y = initramfs_data.cpio$(suffix_y)
 datafile_d_y = .$(datafile_y).d
@@ -50,13 +47,12 @@ targets := $(datafile_y)
 # do not try to update files included in initramfs
 $(deps_initramfs): ;
 
-$(deps_initramfs): klibcdirs
 # We rebuild initramfs_data.cpio if:
 # 1) Any included file is newer than initramfs_data.cpio
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
-$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) klibcdirs
+$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) FORCE
 	$(Q)$(initramfs) -l $(ramfs-input) > $(obj)/$(datafile_d_y)
 	$(call if_changed,initfs)
 
-- 
2.17.1
