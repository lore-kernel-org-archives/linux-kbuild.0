Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:39724 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729735AbeGMQkd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Jul 2018 12:40:33 -0400
Received: by mail-pl0-f67.google.com with SMTP id p23-v6so1149876plo.6
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jul 2018 09:25:14 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 1/2] kbuild: buildtar: remove crufty vax pieces
Date: Fri, 13 Jul 2018 09:24:57 -0700
Message-Id: <20180713162458.22154-1-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>

ARCH=vax isn't in mainline; it can be added back if/when it shows up.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/package/buildtar | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e8cc72a51b32..55887ac84ee4 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -84,10 +84,6 @@ case "${ARCH}" in
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 		[ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
 		;;
-	vax)
-		[ -f "${objtree}/vmlinux.SYS" ] && cp -v -- "${objtree}/vmlinux.SYS" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}.SYS"
-		[ -f "${objtree}/vmlinux.dsk" ] && cp -v -- "${objtree}/vmlinux.dsk" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}.dsk"
-		;;
 	mips)
 		if [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.bin" ]; then
 			cp -v -- "${objtree}/arch/mips/boot/compressed/vmlinux.bin" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
-- 
2.11.0

