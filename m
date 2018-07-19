Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34800 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727575AbeGSQXU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Jul 2018 12:23:20 -0400
From: Major Hayden <major@redhat.com>
Subject: [PATCH] buildtar: Copy bzImage for s390
Date: Thu, 19 Jul 2018 10:39:34 -0500
Message-Id: <20180719153934.5788-1-major@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Major Hayden <major@redhat.com>

Ensure the arch-specific bzImage is present in the tarball
for s390 systems.

Signed-off-by: Major Hayden <major@redhat.com>
---
 scripts/package/buildtar | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e8cc72a51b32..58937caab488 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -84,6 +84,9 @@ case "${ARCH}" in
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 		[ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
 		;;
+	s390)
+		[ -f "${objtree}/arch/s390/boot/bzImage" ] && cp -v -- "${objtree}/arch/s390/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		;;
 	vax)
 		[ -f "${objtree}/vmlinux.SYS" ] && cp -v -- "${objtree}/vmlinux.SYS" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}.SYS"
 		[ -f "${objtree}/vmlinux.dsk" ] && cp -v -- "${objtree}/vmlinux.dsk" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}.dsk"
-- 
2.17.1

