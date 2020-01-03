Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:16476 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbgACSAh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 13:00:37 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 07/12] initramfs: specify $(src)/gen_initramfs.sh as a prerequisite in Makefile
Date: Sat,  4 Jan 2020 02:59:10 +0900
Message-Id: <20200103175915.26663-8-masahiroy@kernel.org>
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Specify the dependency directly in the Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/Makefile         | 7 +++----
 usr/gen_initramfs.sh | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index e44a66b8c051..7df6559f0f30 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -24,7 +24,6 @@ $(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
 # Generate the initramfs cpio archive
 
 hostprogs-y := gen_init_cpio
-initramfs   := $(CONFIG_SHELL) $(srctree)/$(src)/gen_initramfs.sh
 ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
 			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
 ramfs-args  := \
@@ -40,7 +39,7 @@ ifneq ($(wildcard $(obj)/$(datafile_d_y)),)
 endif
 
 quiet_cmd_initfs = GEN     $@
-      cmd_initfs = $(initramfs) -o $@ $(ramfs-args) $(ramfs-input)
+      cmd_initfs = $< -o $@ $(ramfs-args) $(ramfs-input)
 
 targets := $(datafile_y)
 
@@ -52,8 +51,8 @@ $(deps_initramfs): ;
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
-$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) FORCE
-	$(Q)$(initramfs) -l $(ramfs-input) > $(obj)/$(datafile_d_y)
+$(obj)/$(datafile_y): $(src)/gen_initramfs.sh $(obj)/gen_init_cpio $(deps_initramfs) FORCE
+	$(Q)$< -l $(ramfs-input) > $(obj)/$(datafile_d_y)
 	$(call if_changed,initfs)
 
 subdir-$(CONFIG_UAPI_HEADER_TEST) += include
diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 1fd93414fb37..68b6ddfd5f96 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -235,7 +235,7 @@ arg="$1"
 case "$arg" in
 	"-l")	# files included in initramfs - used by kbuild
 		dep_list="list_"
-		echo "deps_initramfs := $0 \\"
+		echo "deps_initramfs := \\"
 		shift
 		;;
 	"-o")	# generate compressed cpio image named $1
-- 
2.17.1
