Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:55747 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758736AbZCaPTH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Mar 2009 11:19:07 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH 7/7] deb-pkg: generate changelog, copyright and control on demand
Date: Tue, 31 Mar 2009 17:19:32 +0200
Message-Id: <1238512772-21180-7-git-send-email-max@stro.at>
In-Reply-To: <1238512772-21180-6-git-send-email-max@stro.at>
References: <1238512772-21180-1-git-send-email-max@stro.at>
 <1238512772-21180-2-git-send-email-max@stro.at>
 <1238512772-21180-3-git-send-email-max@stro.at>
 <1238512772-21180-4-git-send-email-max@stro.at>
 <1238512772-21180-5-git-send-email-max@stro.at>
 <1238512772-21180-6-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, akpm@linux-foundation.org, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

if one those files are already in place don't overwrite it.

Cc: Andres Salomon <dilinger@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5be141a..3d833a0 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -66,6 +66,10 @@ EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
 done
 
+[ -f debian/changelog ] || gen_changelog
+[ -f debian/copyright ] || gen_copyright
+[ -f debian/control ] || gen_control
+
 # Try to determine maintainer and email values
 if [ -n "${DEBEMAIL}" ]; then
 	email=${DEBEMAIL}
@@ -82,7 +86,10 @@ else
 	name="Anonymous Maintainer"
 fi
 maintainer="${name} <${email}>"
+
 # Generate a simple changelog template
+gen_changelog()
+{
 cat <<EOF > debian/changelog
 linux-2.6 ($version-$revision) unstable; urgency=low
 
@@ -90,8 +97,11 @@ linux-2.6 ($version-$revision) unstable; urgency=low
 
  -- ${maintainer}  $(date -R)
 EOF
+}
 
 # Generate copyright file
+gen_copyright()
+{
 cat <<EOF > debian/copyright
 This is a packacked upstream version of the Linux kernel.
 
@@ -110,8 +120,11 @@ git://git.eu.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
 On Debian GNU/Linux systems, the complete text of the GNU General Public
 License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
 EOF
+}
 
 # Generate a control file
+gen_control()
+{
 if [ "$ARCH" == "um" ]; then
 
 cat <<EOF > debian/control
@@ -152,6 +165,7 @@ Description: Linux kernel, version $version
  files version $version
 EOF
 fi
+}
 
 # Fix some ownership and permissions
 chown -R root:root "$tmpdir"
-- 
1.6.2.1

