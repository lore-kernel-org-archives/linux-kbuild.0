Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml106.kpnxchange.com ([195.121.3.10]:64585 "EHLO
	CPSMTPM-EML106.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751043AbZDVXMX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:12:23 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 12/14] deb-pkg: fix Provides field
Date: Thu, 23 Apr 2009 01:12:21 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230112.22423.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

From: maximilian attems <max@stro.at>
Subject: deb-pkg: fix Provides field

kernel-image naming has been dropped for the Lenny release
and was only transitional for Etch.

As it builds modules it provides linux-modules-$version.

Signed-off-by: maximilian attems <max@stro.at>
Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f8bc361..763edcd 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -154,7 +154,7 @@ if [ "$ARCH" = "um" ]; then
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: kernel-image-$version, linux-image-$version
+Provides: linux-image, linux-image-2.6, linux-modules-$version
 Architecture: any
 Description: User Mode Linux kernel, version $version
  User-mode Linux is a port of the Linux kernel to its own system call
@@ -171,7 +171,7 @@ else
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: kernel-image-$version, linux-image-$version
+Provides: linux-image, linux-image-2.6, linux-modules-$version
 Suggests: $fwpackagename
 Architecture: any
 Description: Linux kernel, version $version
