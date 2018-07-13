Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:38098 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387849AbeGMQkj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Jul 2018 12:40:39 -0400
Received: by mail-pf0-f194.google.com with SMTP id v15-v6so2911160pff.5
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jul 2018 09:25:19 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 2/2] kbuild: buildtar: add arm64 support
Date: Fri, 13 Jul 2018 09:24:58 -0700
Message-Id: <20180713162458.22154-2-olof@lixom.net>
In-Reply-To: <20180713162458.22154-1-olof@lixom.net>
References: <20180713162458.22154-1-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

Make 'make tar-pkg' work on arm64.

Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/package/buildtar | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 55887ac84ee4..d624a07a4e77 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -105,6 +105,14 @@ case "${ARCH}" in
 			cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 		fi
 		;;
+	arm64)
+		for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo ; do
+			if [ -f "${objtree}/arch/arm64/boot/${i}" ] ; then
+				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+				break
+			fi
+		done
+		;;
 	*)
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
 		echo "" >&2
-- 
2.11.0

