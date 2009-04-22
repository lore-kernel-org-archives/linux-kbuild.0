Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml108.kpnxchange.com ([195.121.3.12]:56014 "EHLO
	CPSMTPM-EML108.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751794AbZDVXLX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:11:23 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 9/14] deb-pkg: improve maintainer identification
Date: Thu, 23 Apr 2009 01:11:20 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230111.21558.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

From: maximilian attems <max@stro.at>
Subject: deb-pkg: improve maintainer identification

Try harder to find email and maintainer name.
Debian's own devscripts all use DEBEMAIL or DEBFULLNAME prior to an
eventual EMAIL or NAME environment variable. Match their logic.

"Anonymous" sounds nicer then "Kernel Compiler" if no name is found.

Signed-off-by: maximilian attems <max@stro.at>
Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: Andres Salomon <dilinger@debian.org>
---

I've removed some unnecessary braces. Also, "Anonymous Maintainer" seemed
somewhat redundant to me; just "Anonymous" should do.

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 2bd12c1..60f8de2 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -95,14 +95,30 @@ EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
 done
 
-name="Kernel Compiler <$(id -nu)@$(hostname -f)>"
+# Try to determine maintainer and email values
+if [ -n "$DEBEMAIL" ]; then
+       email=$DEBEMAIL
+elif [ -n "$EMAIL" ]; then
+       email=$EMAIL
+else
+       email=$(id -nu)@$(hostname -f)
+fi
+if [ -n "$DEBFULLNAME" ]; then
+       name=$DEBFULLNAME
+elif [ -n "$NAME" ]; then
+       name=$NAME
+else
+       name="Anonymous"
+fi
+maintainer="$name <$email>"
+
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
 linux ($packageversion) unstable; urgency=low
 
   * Custom built Linux kernel.
 
- -- $name  $(date -R)
+ -- $maintainer  $(date -R)
 EOF
 
 # Generate copyright file
@@ -130,7 +146,7 @@ cat <<EOF > debian/control
 Source: linux
 Section: base
 Priority: optional
-Maintainer: $name
+Maintainer: $maintainer
 Standards-Version: 3.6.1
 EOF
 
