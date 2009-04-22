Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml101.kpnxchange.com ([195.121.3.5]:63781 "EHLO
	CPSMTPM-EML101.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751832AbZDVXJ2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:09:28 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 4/14] deb-pkg: pass Debian maintainer script parameters to packaging hook scripts
Date: Thu, 23 Apr 2009 01:09:25 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230109.26615.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

The Debian packaging scripts created by the deb-pkg target do not pass
on the standard Debian maintainer script parameters to hook scripts,
which means that those scripts cannot tell whether they are being called
during e.g. install vs. upgrade, or removal vs. purge of the package.

As there are several variantions in how hook scripts are called from
kernel packages, we pass the parameters in the environment variable
DEB_MAINT_PARAMS rather than as extra arguments.

Bump version of builddep script to 1.3.

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 4876ff3..5eecbbe 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -1,6 +1,6 @@
 #!/bin/sh
 #
-# builddeb 1.2
+# builddeb 1.3
 # Copyright 2003 Wichert Akkerman <wichert@wiggy.net>
 #
 # Simple script to generate a deb package for a Linux kernel. All the
@@ -75,6 +75,9 @@ for script in postinst postrm preinst prerm ; do
 
 set -e
 
+# Pass maintainer script parameters to hook scripts
+export DEB_MAINT_PARAMS="\$@"
+
 test -d /etc/kernel/$script.d && run-parts --arg="$version" /etc/kernel/$script.d
 exit 0
 EOF
