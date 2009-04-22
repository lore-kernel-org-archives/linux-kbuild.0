Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:61053 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750755AbZDVXMD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:12:03 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 11/14] deb-pkg: fix generated package name
Date: Thu, 23 Apr 2009 01:12:01 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230112.02643.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

From: maximilian attems <max@stro.at>
Subject: deb-pkg: fix generated package name

The binary package that make deb-pkg creates is a linux-image.
To be fixed may also be the addition of $DEB_ARCH.

Signed-off-by: maximilian attems <max@stro.at>
Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ebb112d..f8bc361 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -36,7 +36,7 @@ else
 fi
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
-packagename=linux-$version
+packagename=linux-image-$version
 fwpackagename=linux-firmware-image
 
 if [ "$ARCH" = "um" ] ; then
