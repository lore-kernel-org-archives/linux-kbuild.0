Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml110.kpnxchange.com ([195.121.3.14]:51158 "EHLO
	CPSMTPM-EML110.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751192AbZDVXJr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:09:47 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 5/14] deb-pkg: allow to specify a custom revision for .deb packages
Date: Thu, 23 Apr 2009 01:09:44 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230109.45989.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Allow to specify a custom revision for the generated .deb by
exporting the environment variable KDEB_PKGVERSION.

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5eecbbe..5868c0f 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -26,6 +26,11 @@ create_package() {
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
 revision=$(cat .version)
+if [ -n "$KDEB_PKGVERSION" ]; then
+	packageversion=$KDEB_PKGVERSION
+else
+	packageversion=$version-$revision
+fi
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
 packagename=linux-$version
@@ -87,7 +92,7 @@ done
 name="Kernel Compiler <$(id -nu)@$(hostname -f)>"
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux ($version-$revision) unstable; urgency=low
+linux ($packageversion) unstable; urgency=low
 
   * A standard release
 
