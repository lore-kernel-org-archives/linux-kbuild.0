Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:64708 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgACR7j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:39 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/12] gen_initramfs_list.sh: fix the tool name in the comment
Date: Sat,  4 Jan 2020 02:59:05 +0900
Message-Id: <20200103175915.26663-3-masahiroy@kernel.org>
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

There is no tool named "gen_initramfs". The correct name is
"gen_init_cpio".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/gen_initramfs_list.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/gen_initramfs_list.sh b/usr/gen_initramfs_list.sh
index 909a7b865aa7..1fd93414fb37 100755
--- a/usr/gen_initramfs_list.sh
+++ b/usr/gen_initramfs_list.sh
@@ -189,7 +189,7 @@ dir_filelist() {
 
 # if only one file is specified and it is .cpio file then use it direct as fs
 # if a directory is specified then add all files in given direcotry to fs
-# if a regular file is specified assume it is in gen_initramfs format
+# if a regular file is specified assume it is in gen_init_cpio format
 input_file() {
 	source="$1"
 	if [ -f "$1" ]; then
-- 
2.17.1
