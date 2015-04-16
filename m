Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:35430 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964987AbbDPNm7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 09:42:59 -0400
Received: by labbd9 with SMTP id bd9so57030238lab.2
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2015 06:42:57 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH] deb-pkg: v2: move setting debarch for a separate function
Date: Thu, 16 Apr 2015 16:42:46 +0300
Message-Id: <1429191766-13385-1-git-send-email-riku.voipio@linaro.org>
In-Reply-To: <552E59D9.7060101@suse.cz>
References: <552E59D9.7060101@suse.cz>
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

v2: Follow Michals suggestion on setting variables at
top scope and also setting the fallback $debarch in the
new function

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index a9858a4..d9b7694 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -27,8 +27,13 @@ create_package() {
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
 
+	# Create the package
+	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch}" -p$pname -P"$pdir"
+	dpkg --build "$pdir" ..
+}
+
+set_debarch() {
 	# Attempt to find the correct Debian architecture
-	local forcearch="" debarch=""
 	case "$UTS_MACHINE" in
 	i386|ia64|alpha)
 		debarch="$UTS_MACHINE" ;;
@@ -58,6 +63,7 @@ create_package() {
 		fi
 		;;
 	*)
+		debarch=$(dpkg --print-architecture)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
 		echo "" >&2
@@ -70,13 +76,8 @@ create_package() {
 	if [ -n "$KBUILD_DEBARCH" ] ; then
 		debarch="$KBUILD_DEBARCH"
 	fi
-	if [ -n "$debarch" ] ; then
-		forcearch="-DArchitecture=$debarch"
-	fi
+	forcearch="-DArchitecture=$debarch"
 
-	# Create the package
-	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch:-$(dpkg --print-architecture)}" -p$pname -P"$pdir"
-	dpkg --build "$pdir" ..
 }
 
 # Some variables and settings used throughout the script
@@ -99,6 +100,9 @@ kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
 dbg_packagename=$packagename-dbg
 tools_packagename=linux-tools-$version
+debarch=
+forcearch=
+set_debarch
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
-- 
2.1.4

