Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.180]:64435 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755893AbYAVAWB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Jan 2008 19:22:01 -0500
Received: by py-out-1112.google.com with SMTP id u52so3250522pyb.10
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jan 2008 16:22:00 -0800 (PST)
From: Daniel De Graaf <danieldegraaf@gmail.com>
Date: Mon, 21 Jan 2008 18:21:11 -0600
Subject: [PATCH] Support ARCH=x86 in buildtar
Message-ID: <47953726.3ce9220a.7267.2abf@mx.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kernel Build list <linux-kbuild@vger.kernel.org>, Trivial Patches <trivial@kernel.org>

Signed-off-by: Daniel De Graaf <danieldegraaf@gmail.com>
---
 scripts/package/buildtar |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index aa0ccdb..28574ae 100644
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -69,8 +69,8 @@ cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 # Install arch-specific kernel image(s)
 #
 case "${ARCH}" in
-	i386|x86_64)
-		[ -f "${objtree}/arch/$ARCH/boot/bzImage" ] && cp -v -- "${objtree}/arch/$ARCH/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+	x86|i386|x86_64)
+		[ -f "${objtree}/arch/x86/boot/bzImage" ] && cp -v -- "${objtree}/arch/x86/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
 	alpha)
 		[ -f "${objtree}/arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"

