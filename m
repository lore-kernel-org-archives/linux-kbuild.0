Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml106.kpnxchange.com ([195.121.3.10]:58302 "EHLO
	CPSMTPM-EML106.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934097AbZDATnj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 15:43:39 -0400
Subject: [PATCH 4/5] deb-pkg: allow to specify a custom revision for .deb packages
Content-Disposition: inline
From: Frans Pop <elendil@planet.nl>
Date: Wed, 1 Apr 2009 21:43:34 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200904012143.36217.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Allow to specify a custom revision for the generated .deb by
exporting the environment variable KDEB_PKGVERSION.

Signed-off-by: Frans Pop <elendil@planet.nl>
---
Hit "send" too early on this one :-(

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c9a4dcd..1b8820f 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -14,6 +14,11 @@ set -e
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
 revision=$(cat .version)
+if [ -n "$KDEB_PKGVERSION" ]; then
+	packageversion=$version-$revision
+else
+	packageversion=$KDEB_PKGVERSION
+fi
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
 packagename=linux-$version
@@ -76,7 +81,7 @@ done
 name="Kernel Compiler <$(id -nu)@$(hostname -f)>"
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux ($version-$revision) unstable; urgency=low
+linux ($packageversion) unstable; urgency=low
 
   * Custom built Linux kernel.
 
