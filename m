Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml107.kpnxchange.com ([195.121.3.11]:64929 "EHLO
	CPSMTPM-EML107.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751192AbZDVXKN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:10:13 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 6/14] deb-pkg: allow alternative hook scripts directory in .deb packages
Date: Thu, 23 Apr 2009 01:10:10 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230110.11919.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Hook scripts in the default directory /etc/kernel are also executed by
official Debian kernel packages as well as kernel packages created using
make-kpkg. Allow to specify an alternative hook scripts directory by
exporting the environment variable KDEB_HOOKDIR.
    
Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5868c0f..c01f812 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -6,8 +6,9 @@
 # Simple script to generate a deb package for a Linux kernel. All the
 # complexity of what to do with a kernel after it is installed or removed
 # is left to other scripts and packages: they can install scripts in the
-# /etc/kernel/{pre,post}{inst,rm}.d/ directories that will be called on
-# package install and removal.
+# /etc/kernel/{pre,post}{inst,rm}.d/ directories (or an alternative location
+# specified in KDEB_HOOKDIR) that will be called on package install and
+# removal.
 
 set -e
 
@@ -73,8 +74,11 @@ if grep -q '^CONFIG_MODULES=y' .config ; then
 fi
 
 # Install the maintainer scripts
+# Note: hook scripts under /etc/kernel are also executed by official Debian
+# kernel packages, as well as kernel packages built using make-kpkg
+debhookdir=${KDEB_HOOKDIR:-/etc/kernel}
 for script in postinst postrm preinst prerm ; do
-	mkdir -p "$tmpdir/etc/kernel/$script.d"
+	mkdir -p "$tmpdir$debhookdir/$script.d"
 	cat <<EOF > "$tmpdir/DEBIAN/$script"
 #!/bin/sh
 
@@ -83,7 +87,7 @@ set -e
 # Pass maintainer script parameters to hook scripts
 export DEB_MAINT_PARAMS="\$@"
 
-test -d /etc/kernel/$script.d && run-parts --arg="$version" /etc/kernel/$script.d
+test -d $debhookdir/$script.d && run-parts --arg="$version" $debhookdir/$script.d
 exit 0
 EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
