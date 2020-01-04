Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:53557 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgADPDB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:01 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 02/13] gen_initramfs_list.sh: remove unused variable 'default_list'
Date: Sun,  5 Jan 2020 00:02:27 +0900
Message-Id: <20200104150238.19834-3-masahiroy@kernel.org>
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

This is assigned, but not referenced.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 usr/gen_initramfs_list.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/usr/gen_initramfs_list.sh b/usr/gen_initramfs_list.sh
index 2bbac73e6477..909a7b865aa7 100755
--- a/usr/gen_initramfs_list.sh
+++ b/usr/gen_initramfs_list.sh
@@ -280,7 +280,6 @@ while [ $# -gt 0 ]; do
 			shift
 			;;
 		"-d")	# display default initramfs list
-			default_list="$arg"
 			${dep_list}default_initramfs
 			;;
 		"-h")
-- 
2.17.1
