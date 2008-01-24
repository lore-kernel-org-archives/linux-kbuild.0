Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42831 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756155AbYAXWEI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:08 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 73/77] kbuild: support ARCH=x86 in buildtar
Date: Thu, 24 Jan 2008 23:03:54 +0100
Message-Id: <1201212238-4369-73-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Daniel De Graaf <danieldegraaf@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

From: Daniel De Graaf <danieldegraaf@gmail.com>

Signed-off-by: Daniel De Graaf <danieldegraaf@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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
-- 
1.5.4.rc3.14.g44397

