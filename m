Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34522 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbdFXOsP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jun 2017 10:48:15 -0400
Received: by mail-wr0-f193.google.com with SMTP id k67so19580878wrc.1
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2017 07:48:15 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Subject: [PATCH] kbuild: create deterministic initramfs directory listings
Date: Sat, 24 Jun 2017 16:48:10 +0200
Message-Id: <20170624144810.7363-1-bjorn.forsman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.com, =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>

kbuild runs "find" on each entry in CONFIG_INITRAMFS_SOURCE that is a
directory. The order of the file listing output by "find" matter for
build reproducability, hence this patch applies "sort" to get
deterministic results.

Without this patch, two different machines with identical initramfs
directory input may produce differing initramfs cpio archives (different
hash) due to the different order of the files within the archive.

Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
---
 scripts/gen_initramfs_list.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gen_initramfs_list.sh b/scripts/gen_initramfs_list.sh
index 0055b07b03b6..72f094585cca 100755
--- a/scripts/gen_initramfs_list.sh
+++ b/scripts/gen_initramfs_list.sh
@@ -174,7 +174,7 @@ dir_filelist() {
 	${dep_list}header "$1"
 
 	srcdir=$(echo "$1" | sed -e 's://*:/:g')
-	dirlist=$(find "${srcdir}" -printf "%p %m %U %G\n")
+	dirlist=$(find "${srcdir}" -printf "%p %m %U %G\n" | sort)
 
 	# If $dirlist is only one line, then the directory is empty
 	if [  "$(echo "${dirlist}" | wc -l)" -gt 1 ]; then
-- 
2.12.2

