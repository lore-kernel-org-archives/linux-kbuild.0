Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from benson.vm.bytemark.co.uk ([212.110.190.137]:53658 "EHLO
	benson.vm.bytemark.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247AbaFIHEw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 03:04:52 -0400
Message-ID: <1402297488.31087.5.camel@dagon.hellion.org.uk>
Subject: Re: [PATCH v2 1/2] deb-pkg: Add automatic support for armhf
 architecture
From: Ian Campbell <ijc@hellion.org.uk>
Date: Mon, 09 Jun 2014 08:04:48 +0100
In-Reply-To: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
References: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, debian-arm@lists.debian.org, Hector Oron <hector.oron@gmail.com>

On Mon, 2014-06-09 at 01:21 +0100, Ben Hutchings wrote:
> The Debian armhf architecture uses the ARM EABI hard-float variant,
> whereas armel uses the soft-float variant.  Although the kernel
> doesn't use FP itself, CONFIG_VFP must be enabled to support
> hard-float userland and will probably be disabled when supporting a
> soft-float userland.  So set the architecture to armhf by default when
> CONFIG_AEABI and CONFIG_VFP are both enabled.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Acked-by: Ian Campbell <ijc@hellion.org.uk>

We should also add the following. If there is some reason to do a v3
feel free to squash it into you patch (if you wish).

8<-------------------------

From 3746add23576c58ca567e53b65c4c0cb40f48deb Mon Sep 17 00:00:00 2001
From: Ian Campbell <ijc@hellion.org.uk>
Date: Mon, 9 Jun 2014 08:00:56 +0100
Subject: [PATCH] deb-pkg: Add automatic support for arm64 architecture.

The Debian arch corresponding the kernel ARCH=arm64 is arm64. List this
explicitly to prevent falling through to the 32-bit ARM autodetection.

Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index d035df4..8d97fa8 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -28,7 +28,7 @@ create_package() {
 	# Attempt to find the correct Debian architecture
 	local forcearch="" debarch=""
 	case "$UTS_MACHINE" in
-	i386|ia64|alpha)
+	i386|ia64|alpha|arm64)
 		debarch="$UTS_MACHINE" ;;
 	x86_64)
 		debarch=amd64 ;;
-- 
1.9.0



