Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:64930 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgACR7y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:54 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 12/12] gen_initramfs.sh: remove intermediate cpio_list on errors
Date: Sat,  4 Jan 2020 02:59:15 +0900
Message-Id: <20200103175915.26663-13-masahiroy@kernel.org>
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

This script sets the -e option, so it exits on any error, in which
case it exits without cleaning up the intermediate cpio_list.

Make sure to delete it on exit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/gen_initramfs.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 4e6715f8ff7f..8ae831657e5d 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -193,6 +193,8 @@ dep_list=
 cpio_list=$(mktemp ${TMPDIR:-/tmp}/cpiolist.XXXXXX)
 output="/dev/stdout"
 
+trap "rm -f $cpio_list" EXIT
+
 while [ $# -gt 0 ]; do
 	arg="$1"
 	shift
@@ -243,4 +245,3 @@ if test -n "$KBUILD_BUILD_TIMESTAMP"; then
 	fi
 fi
 usr/gen_init_cpio $timestamp $cpio_list > $output
-rm $cpio_list
-- 
2.17.1
