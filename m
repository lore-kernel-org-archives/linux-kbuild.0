Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml110.kpnxchange.com ([195.121.3.14]:54949 "EHLO
	CPSMTPM-EML110.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934041AbZDATnV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 15:43:21 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 3/5] deb-pkg: pass Debian maintainer script parameters to packaging hook scripts
Date: Wed, 1 Apr 2009 21:43:17 +0200
References: <200904012133.37387.elendil@planet.nl>
In-Reply-To: <200904012133.37387.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904012143.18562.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

The Debian packaging scripts created by the deb-pkg target do not pass
on the standard Debian maintainer script parameters to hook scripts,
which means that those scripts cannot tell whether they are being called
during e.g. install vs. upgrade, or removal vs. purge of the package.

As there are several variantions in how hook scripts are called from
kernel packages, we pass the parameters in the environment variable
DEB_MAINT_PARAMS rather than as extra arguments.

Bump version of builddep script to 1.3.

Signed-off-by: Frans Pop <elendil@planet.nl>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5b1517d..c9a4dcd 100644
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
@@ -63,7 +63,11 @@ for script in postinst postrm preinst prerm ; do
 
 set -e
 
-test -d /etc/kernel/$script.d && run-parts --arg="$version" /etc/kernel/$script.d
+# Pass maintainer script parameters to hook scripts
+export DEB_MAINT_PARAMS="\$@"
+
+test -d $debhookdir/$script.d && \\
+	run-parts --arg="$version" /etc/kernel/$script.d
 exit 0
 EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
