Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml108.kpnxchange.com ([195.121.3.12]:55741 "EHLO
	CPSMTPM-EML108.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751964AbZDVXJH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:09:07 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 3/14] deb-pkg: fix 'file not found' error when building .deb package for arm
Date: Thu, 23 Apr 2009 01:09:04 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230109.05537.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Not all architectures prepend the $(boot) path in $(KBUILD_IMAGE).
Allow for that fact in the builddeb script. Example is arm.

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index feebd69..4876ff3 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -53,7 +53,10 @@ if [ "$ARCH" = "um" ] ; then
 else 
 	cp System.map "$tmpdir/boot/System.map-$version"
 	cp .config "$tmpdir/boot/config-$version"
-	cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
+	# Not all arches include the boot path in KBUILD_IMAGE
+	if ! cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"; then
+		cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
+	fi
 fi
 
 if grep -q '^CONFIG_MODULES=y' .config ; then
