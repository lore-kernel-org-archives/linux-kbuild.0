Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:34555 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfFQGPs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jun 2019 02:15:48 -0400
From: Cedric Hombourger <Cedric_Hombourger@mentor.com>
Subject: [PATCH] builddeb: generate multi-arch friendly linux-libc-dev package
Date: Mon, 17 Jun 2019 08:14:56 +0200
Message-ID: <1560752096-1323-1-git-send-email-Cedric_Hombourger@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: isar-users@googlegroups.com, Cedric Hombourger <Cedric_Hombourger@mentor.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Debian-based distributions place libc header files in a machine
specific directory (/usr/include/<libc-machine>) instead of
/usr/include/asm to support installation of the linux-libc-dev
package from multiple architectures. Move headers installed by
"make headers_install" accordingly.

Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
Reviewed-by: Henning Schild <henning.schild@siemens.com>
---
 scripts/package/builddeb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b03dd56a4782..8f7afb3a84e9 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -132,6 +132,11 @@ fi
 if [ "$ARCH" != "um" ]; then
 	$MAKE -f $srctree/Makefile headers_check
 	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
+	# move asm headers to /usr/include/<libc-machine>/asm to match the structure
+	# used by Debian-based distros (to support multi-arch)
+	libc_mach=$($CC -dumpmachine)
+	mkdir $libc_headers_dir/usr/include/$libc_mach
+	mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$libc_mach/
 fi
 
 # Install the maintainer scripts
-- 
2.11.0
