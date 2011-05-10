Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:47567 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775Ab1EJF0X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2011 01:26:23 -0400
From: Nuno Subtil <subtil@gmail.com>
Subject: [PATCH 1/1] deb-pkg: fix cross-compile build
Date: Mon,  9 May 2011 22:25:14 -0700
Message-Id: <1305005114-25810-1-git-send-email-subtil@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Robert Gordon <robert@greenroomsoftware.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nuno Subtil <subtil@gmail.com>

When generating the header package, scripts/package/builddeb was inferring the
target architecture by looking at the output of dpkg --print-architecture. This
makes it go instead through the same detection sequence that was previously
implemented in create_package.

Signed-off-by: Nuno Subtil <subtil@gmail.com>
---
 scripts/package/builddeb |   42 ++++++++++++++++++++++++------------------
 1 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f6cbc3d..67a72d2 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -12,21 +12,10 @@
 
 set -e
 
-create_package() {
-	local pname="$1" pdir="$2"
-
-	cp debian/copyright "$pdir/usr/share/doc/$pname/"
-	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
-	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
-	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
-		| xargs -r0 md5sum > DEBIAN/md5sums"
-
-	# Fix ownership and permissions
-	chown -R root:root "$pdir"
-	chmod -R go-w "$pdir"
-
+infer_debian_architecture() {
 	# Attempt to find the correct Debian architecture
-	local forcearch="" debarch=""
+	forcearch=""
+	debarch=""
 	case "$UTS_MACHINE" in
 	i386|ia64|alpha)
 		debarch="$UTS_MACHINE" ;;
@@ -60,6 +49,22 @@ create_package() {
 	if [ -n "$debarch" ] ; then
 		forcearch="-DArchitecture=$debarch"
 	fi
+}
+
+create_package() {
+	local pname="$1" pdir="$2"
+
+	cp debian/copyright "$pdir/usr/share/doc/$pname/"
+	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
+	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
+	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
+		| xargs -r0 md5sum > DEBIAN/md5sums"
+
+	# Fix ownership and permissions
+	chown -R root:root "$pdir"
+	chmod -R go-w "$pdir"
+
+	infer_debian_architecture
 
 	# Create the package
 	dpkg-gencontrol -isp $forcearch -p$pname -P"$pdir"
@@ -246,15 +251,16 @@ mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T /tmp/files$$) | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
 rm -f /tmp/files$$ /tmp/objfiles$$
-arch=$(dpkg --print-architecture)
+
+infer_debian_architecture
 
 cat <<EOF >> debian/control
 
 Package: $kernel_headers_packagename
 Provides: linux-headers, linux-headers-2.6
-Architecture: $arch
-Description: Linux kernel headers for $KERNELRELEASE on $arch
- This package provides kernel header files for $KERNELRELEASE on $arch
+Architecture: $debarch
+Description: Linux kernel headers for $KERNELRELEASE on $debarch
+ This package provides kernel header files for $KERNELRELEASE on $debarch
  .
  This is useful for people who need to build external modules
 EOF
-- 
1.7.4.4

