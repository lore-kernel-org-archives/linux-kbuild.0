Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml102.kpnxchange.com ([195.121.3.6]:60831 "EHLO
	CPSMTPM-EML102.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752003AbZDVXLF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:11:05 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 8/14] deb-pkg: generate debian/copyright file
Date: Thu, 23 Apr 2009 01:11:01 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230111.02672.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Add a basic debian/copyright to the binary packages.

Based on an earlier patch from Maximilian Attems.

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>
---

Original patch did not actually include the copyright file in the binary
package. I've also made minor changes in the text of the copyright file.

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 0449147..2bd12c1 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -15,6 +15,8 @@ set -e
 create_package() {
 	local pname="$1" pdir="$2"
 
+	cp debian/copyright "$pdir/usr/share/doc/$pname/"
+
 	# Fix ownership and permissions
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
@@ -43,10 +45,10 @@ fi
 
 # Setup the directory structure
 rm -rf "$tmpdir" "$fwdir"
-mkdir -p "$tmpdir/DEBIAN" "$tmpdir/lib" "$tmpdir/boot"
-mkdir -p "$fwdir/DEBIAN" "$fwdir/lib"
+mkdir -p "$tmpdir/DEBIAN" "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
+mkdir -p "$fwdir/DEBIAN" "$fwdir/lib" "$fwdir/usr/share/doc/$fwpackagename"
 if [ "$ARCH" = "um" ] ; then
-	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/share/doc/$packagename" "$tmpdir/usr/bin"
+	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin"
 fi
 
 # Build and install the kernel
@@ -103,6 +105,26 @@ linux ($packageversion) unstable; urgency=low
  -- $name  $(date -R)
 EOF
 
+# Generate copyright file
+cat <<EOF > debian/copyright
+This is a packacked upstream version of the Linux kernel.
+
+The sources may be found at most Linux ftp sites, including:
+ftp://ftp.kernel.org/pub/linux/kernel
+
+Copyright: 1991 - 2009 Linus Torvalds and others.
+
+The git repository for mainline kernel development is at: 
+git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; version 2 dated June, 1991.
+
+On Debian GNU/Linux systems, the complete text of the GNU General Public
+License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
+EOF
+
 # Generate a control file
 cat <<EOF > debian/control
 Source: linux
