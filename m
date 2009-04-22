Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml103.kpnxchange.com ([195.121.3.7]:62754 "EHLO
	CPSMTPM-EML103.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751732AbZDVXK2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:10:28 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 7/14] dep-pkg: improve changelog entry and package descriptions
Date: Thu, 23 Apr 2009 01:10:25 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230110.27211.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c01f812..0449147 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -98,7 +98,7 @@ name="Kernel Compiler <$(id -nu)@$(hostname -f)>"
 cat <<EOF > debian/changelog
 linux ($packageversion) unstable; urgency=low
 
-  * A standard release
+  * Custom built Linux kernel.
 
  -- $name  $(date -R)
 EOF
@@ -126,7 +126,7 @@ Description: User Mode Linux kernel, version $version
  many other things.
  .
  This package contains the Linux kernel, modules and corresponding other
- files version $version
+ files, version: $version.
 EOF
 
 else
@@ -138,7 +138,7 @@ Suggests: $fwpackagename
 Architecture: any
 Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
- files version $version
+ files, version: $version.
 EOF
 
 fi
@@ -152,7 +152,7 @@ if [ -e "$tmpdir/lib/firmware" ]; then
 Package: $fwpackagename
 Architecture: all
 Description: Linux kernel firmware, version $version
- This package contains firmware from the Linux kernel, version $version
+ This package contains firmware from the Linux kernel, version $version.
 EOF
 
 	create_package "$fwpackagename" "$fwdir"
