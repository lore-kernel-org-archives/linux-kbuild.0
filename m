Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:55753 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759550AbZCaPTJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Mar 2009 11:19:09 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH 1/7] deb-pkg: Beautify changelog
Date: Tue, 31 Mar 2009 17:19:26 +0200
Message-Id: <1238512772-21180-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, akpm@linux-foundation.org, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Try harder to find email and maintainer name.
Debian's own devscripts all use DEBEMAIL or DEBFULLNAME
prior to an eventual EMAIL or NAME environment variable.
Match their logic.

"Anonymous Maintainer" sounds nicer then Kernel compiler
if no name is found. As bonus add more descriptive changelog
entry.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   25 ++++++++++++++++++++-----
 1 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 1264b8e..dd61591 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -66,14 +66,29 @@ EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
 done
 
-name="Kernel Compiler <$(id -nu)@$(hostname -f)>"
+# Try to determine maintainer and email values
+if [ -n "${DEBEMAIL}" ]; then
+	email=${DEBEMAIL}
+elif [ -n "${EMAIL}" ]; then
+	email=${EMAIL}
+else
+	email=$(id -nu)@$(hostname -f)
+fi
+if [ -n "${DEBFULLNAME}" ]; then
+	name=${DEBFULLNAME}
+elif [ -n "${NAME}" ]; then
+	name=${NAME}
+else
+	name="Anonymous Maintainer"
+fi
+maintainer="${name} <${email}>"
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
 linux ($version-$revision) unstable; urgency=low
 
-  * A standard release
+  * New upstream release
 
- -- $name  $(date -R)
+ -- ${maintainer}  $(date -R)
 EOF
 
 # Generate a control file
@@ -83,7 +98,7 @@ cat <<EOF > debian/control
 Source: linux
 Section: base
 Priority: optional
-Maintainer: $name
+Maintainer: $maintainer
 Standards-Version: 3.6.1
 
 Package: $packagename
@@ -105,7 +120,7 @@ cat <<EOF > debian/control
 Source: linux
 Section: base
 Priority: optional
-Maintainer: $name
+Maintainer: $maintainer
 Standards-Version: 3.6.1
 
 Package: $packagename
-- 
1.6.2.1

