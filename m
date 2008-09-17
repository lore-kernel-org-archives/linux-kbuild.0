Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from charm.itp.tuwien.ac.at ([128.131.48.139]:43222 "EHLO
	charm.itp.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752991AbYIQU6E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Sep 2008 16:58:04 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Beautify changelog
Date: Wed, 17 Sep 2008 22:09:49 +0200
Message-Id: <1221682195-26809-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, dilinger@debian.org, maximilian attems <max@stro.at>

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
index ba6bf5d..9889a73 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -63,14 +63,29 @@ EOF
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
@@ -80,7 +95,7 @@ cat <<EOF > debian/control
 Source: linux
 Section: base
 Priority: optional
-Maintainer: $name
+Maintainer: $maintainer
 Standards-Version: 3.6.1
 
 Package: $packagename
@@ -102,7 +117,7 @@ cat <<EOF > debian/control
 Source: linux
 Section: base
 Priority: optional
-Maintainer: $name
+Maintainer: $maintainer
 Standards-Version: 3.6.1
 
 Package: $packagename
-- 
1.5.6.5

