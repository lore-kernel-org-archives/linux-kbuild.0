Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:34778 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932545AbbDJNPb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Apr 2015 09:15:31 -0400
Received: by lbcga7 with SMTP id ga7so13411728lbc.1
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2015 06:15:29 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 1/2] deb-pkg: move setting debarch for a separate function
Date: Fri, 10 Apr 2015 16:15:13 +0300
Message-Id: <cf573e24baadc04da27c471dafee90344e0cb400.1428671643.git.riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

create_package() function tries to resolve used architecture
for everry package. Split the setting the architecture to a
new function, set_debarch(), called once on startup.

This allows using debarch from other parts of script as
needed.
---
 scripts/package/builddeb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index a9858a4..e397815 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -27,8 +27,15 @@ create_package() {
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
 
+	# Create the package
+	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch:-$(dpkg --print-architecture)}" -p$pname -P"$pdir"
+	dpkg --build "$pdir" ..
+}
+
+set_debarch() {
 	# Attempt to find the correct Debian architecture
-	local forcearch="" debarch=""
+	forcearch=""
+	debarch=""
 	case "$UTS_MACHINE" in
 	i386|ia64|alpha)
 		debarch="$UTS_MACHINE" ;;
@@ -73,10 +80,8 @@ create_package() {
 	if [ -n "$debarch" ] ; then
 		forcearch="-DArchitecture=$debarch"
 	fi
+	export forcearch debarch
 
-	# Create the package
-	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch:-$(dpkg --print-architecture)}" -p$pname -P"$pdir"
-	dpkg --build "$pdir" ..
 }
 
 # Some variables and settings used throughout the script
@@ -99,6 +104,7 @@ kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
 dbg_packagename=$packagename-dbg
 tools_packagename=linux-tools-$version
+set_debarch
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
-- 
2.1.4

