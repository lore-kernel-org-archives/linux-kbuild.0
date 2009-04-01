Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml108.kpnxchange.com ([195.121.3.12]:51866 "EHLO
	CPSMTPM-EML108.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934119AbZDATn4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 15:43:56 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 5a/5] deb-pkg: allow alternative hook scripts directory in .deb packages
Date: Wed, 1 Apr 2009 21:43:51 +0200
References: <200904012133.37387.elendil@planet.nl>
In-Reply-To: <200904012133.37387.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904012143.52853.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hook scripts in the default directory /etc/kernel are also executed by
official Debian kernel packages as well as kernel packages created using
make-kpkg. Allow to specify an alternative hook scripts directory by
exporting the environment variable KDEB_HOOKDIR.

Signed-off-by: Frans Pop <elendil@planet.nl>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 1b8820f..dada305 100644
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
 
@@ -61,8 +62,11 @@ if grep -q '^CONFIG_MODULES=y' .config ; then
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
 
@@ -72,7 +76,7 @@ set -e
 export DEB_MAINT_PARAMS="\$@"
 
 test -d $debhookdir/$script.d && \\
-	run-parts --arg="$version" /etc/kernel/$script.d
+	run-parts --arg="$version" $debhookdir/$script.d
 exit 0
 EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
