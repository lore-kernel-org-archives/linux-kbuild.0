Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from charm.itp.tuwien.ac.at ([128.131.48.139]:43223 "EHLO
	charm.itp.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030AbYIQU6F (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Sep 2008 16:58:05 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: generate changelog, copyright and control on demand
Date: Wed, 17 Sep 2008 22:09:55 +0200
Message-Id: <1221682195-26809-7-git-send-email-max@stro.at>
In-Reply-To: <1221682195-26809-6-git-send-email-max@stro.at>
References: <1221682195-26809-1-git-send-email-max@stro.at>
 <1221682195-26809-2-git-send-email-max@stro.at>
 <1221682195-26809-3-git-send-email-max@stro.at>
 <1221682195-26809-4-git-send-email-max@stro.at>
 <1221682195-26809-5-git-send-email-max@stro.at>
 <1221682195-26809-6-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, dilinger@debian.org, maximilian attems <max@stro.at>

if one those files are already in place don't overwrite it.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 01964f4..b690a91 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -63,6 +63,10 @@ EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
 done
 
+[ -f debian/changelog ] || gen_changelog
+[ -f debian/copyright ] || gen_copyright
+[ -f debian/control ] || gen_control
+
 # Try to determine maintainer and email values
 if [ -n "${DEBEMAIL}" ]; then
 	email=${DEBEMAIL}
@@ -79,7 +83,10 @@ else
 	name="Anonymous Maintainer"
 fi
 maintainer="${name} <${email}>"
+
 # Generate a simple changelog template
+gen_changelog()
+{
 cat <<EOF > debian/changelog
 linux-2.6 ($version-$revision) unstable; urgency=low
 
@@ -87,8 +94,11 @@ linux-2.6 ($version-$revision) unstable; urgency=low
 
  -- ${maintainer}  $(date -R)
 EOF
+}
 
 # Generate copyright file
+gen_copyright()
+{
 cat <<EOF > debian/copyright
 This is a packacked upstream version of the Linux kernel.
 
@@ -107,8 +117,11 @@ git://git.eu.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
 On Debian GNU/Linux systems, the complete text of the GNU General
 Public License can be found in \`/usr/share/common-licenses/GPL'.
 EOF
+}
 
 # Generate a control file
+gen_control()
+{
 if [ "$ARCH" == "um" ]; then
 
 cat <<EOF > debian/control
@@ -148,6 +161,7 @@ Description: Linux kernel, version $version
  files version $version
 EOF
 fi
+}
 
 # Fix some ownership and permissions
 chown -R root:root "$tmpdir"
-- 
1.5.6.5

