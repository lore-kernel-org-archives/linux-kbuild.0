Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bbox.sascha.silbe.org ([84.201.25.44]:51181 "EHLO
        bbox.sascha.silbe.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751725AbdEMLkG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 May 2017 07:40:06 -0400
From: Sascha Silbe <x-linux@infra-silbe.de>
Subject: [PATCH] kbuild: add ARM support for tar-pkg
Date: Sat, 13 May 2017 13:31:26 +0200
Message-Id: <20170513113126.13281-1-x-linux@infra-silbe.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The fallback code for "unknown" architectures doesn't work on ARM
because for ARM (and a couple of other architectures) KBUILD_IMAGE
contains only the file name, not the full path. Having an explicit
rule also avoids printing the warning for unknown architectures.

Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
---
 scripts/package/buildtar | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e046bff33589..cbcc4496c025 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -108,6 +108,11 @@ case "${ARCH}" in
 			cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 		fi
 		;;
+	arm)
+		if [ -f "${objtree}/arch/${ARCH}/boot/${KBUILD_IMAGE}" ]; then
+			cp -v -- "${objtree}/arch/${ARCH}/boot/${KBUILD_IMAGE}" "${tmpdir}/boot/${KBUILD_IMAGE}-${KERNELRELEASE}"
+		fi
+		;;
 	*)
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
 		echo "" >&2
-- 
2.11.0

