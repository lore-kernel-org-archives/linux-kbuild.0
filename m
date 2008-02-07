Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from max.feld.cvut.cz ([147.32.192.36]:50567 "EHLO max.feld.cvut.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756806AbYBGQ3a (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Feb 2008 11:29:30 -0500
From: Michal Sojka <sojkam1@fel.cvut.cz>
Subject: [PATCH] Kbuild: Fix deb-pkg target to work with kernel versions ending with -<text-without-digit>
Date: Thu, 7 Feb 2008 17:18:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200802071718.51976.sojkam1@fel.cvut.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org

If CONIFIG_LOCALVERSION is set for example to -loop, the following error
message was generated.

dpkg-deb - error: Debian revision (`loop') doesn't contain any digits
dpkg-deb: 1 errors in control file

The patch solves this by adding a numeric revision to package version.

Signed-off-by: Michal Sojka <sojkam1@fel.cvut.cz>
---
 scripts/package/builddeb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 0f657b5..ba6bf5d 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -13,6 +13,7 @@ set -e
 
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
+revision=`cat .version`
 tmpdir="$objtree/debian/tmp"
 packagename=linux-$version
 
@@ -65,7 +66,7 @@ done
 name="Kernel Compiler <$(id -nu)@$(hostname -f)>"
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux ($version) unstable; urgency=low
+linux ($version-$revision) unstable; urgency=low
 
   * A standard release
 
-- 
1.5.3.8

