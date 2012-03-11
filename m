Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from stringer.orebokech.com ([88.190.240.207]:41103 "EHLO
	stringer.orebokech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751557Ab2CKUnB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Mar 2012 16:43:01 -0400
From: Romain Francoise <romain@orebokech.com>
Subject: [PATCH] kbuild, deb-pkg: pass options to dpkg-deb via KBUILD_DEBOPTS
Date: Sun, 11 Mar 2012 21:34:59 +0100
Message-Id: <1331498099-23597-1-git-send-email-romain@orebokech.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>

Call dpkg-deb directly instead of using the dpkg front-end, and pass it
any options found in the new KBUILD_DEBOPTS variable. With "-Zxz", this
allows compressing packages with xz instead of gzip, which provides very
significant space savings (x86-64 allmodconfig):
                                gzip    xz
    linux-firmware-image.deb    1.2M    903K
    linux-headers.deb           7.3M    5.1M
    linux-image.deb             197M    118M
    linux-libc-dev.deb          855K    653K

Signed-off-by: Romain Francoise <romain@orebokech.com>
---
 Documentation/kbuild/kbuild.txt |    6 ++++++
 scripts/package/builddeb        |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)
 mode change 100644 => 100755 scripts/package/builddeb

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 68e32bb..63897fb 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -81,6 +81,12 @@ the UTS_MACHINE variable, and on some architectures also the kernel config.
 The value of KBUILD_DEBARCH is assumed (not checked) to be a valid Debian
 architecture.
 
+KBUILD_DEBOPTS
+--------------------------------------------------
+For the deb-pkg target, allows passing options to dpkg-deb. For example,
+setting this variable to "-Zxz" will result in xz-compressed packages
+(instead of the default gzip).
+
 ARCH
 --------------------------------------------------
 Set ARCH to the architecture to be built.
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
old mode 100644
new mode 100755
index 3c6c0b1..f44f0a8
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -63,7 +63,7 @@ create_package() {
 
 	# Create the package
 	dpkg-gencontrol -isp $forcearch -p$pname -P"$pdir"
-	dpkg --build "$pdir" ..
+	dpkg-deb $KBUILD_DEBOPTS --build "$pdir" ..
 }
 
 # Some variables and settings used throughout the script
-- 
1.7.9.1

