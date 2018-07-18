Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55956 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731362AbeGRRyH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jul 2018 13:54:07 -0400
From: Major Hayden <major@redhat.com>
Subject: [PATCH] buildtar: Copy vmlinuz for arm64
Date: Wed, 18 Jul 2018 12:15:07 -0500
Message-Id: <20180718171507.4837-1-major@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Major Hayden <major@redhat.com>

Copy the architecture-specific compressed kernel image to the
directory used to make the tar package.

Signed-off-by: Major Hayden <major@redhat.com>
---
 scripts/package/buildtar | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e8cc72a51b32..a87c8cbc1ba3 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -80,6 +80,9 @@ case "${ARCH}" in
 	alpha)
 		[ -f "${objtree}/arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
+	arm64)
+		[ -f "${objtree}/arch/arm64/boot/Image.gz" ] && cp -v -- "${objtree}/arch/arm64/boot/Image.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		;;
 	parisc*)
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 		[ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
-- 
2.17.1

