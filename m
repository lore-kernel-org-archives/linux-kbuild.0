Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726774AbeKOIaT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 03:30:19 -0500
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.18 58/59] kbuild: deb-pkg: fix too low build version number
Date: Wed, 14 Nov 2018 17:23:30 -0500
Message-Id: <20181114222335.99339-58-sashal@kernel.org>
In-Reply-To: <20181114222335.99339-1-sashal@kernel.org>
References: <20181114222335.99339-1-sashal@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit bbcde0a7241261cd0ca8d8e6b94a4113a4b71443 ]

Since commit b41d920acff8 ("kbuild: deb-pkg: split generating packaging
and build"), the build version of the kernel contained in a deb package
is too low by 1.

Prior to the bad commit, the kernel was built first, then the number
in .version file was read out, and written into the debian control file.

Now, the debian control file is created before the kernel is actually
compiled, which is causing the version number mismatch.

Let the mkdebian script pass KBUILD_BUILD_VERSION=${revision} to require
the build system to use the specified version number.

Fixes: b41d920acff8 ("kbuild: deb-pkg: split generating packaging and build")
Reported-by: Doug Smythies <dsmythies@telus.net>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Tested-by: Doug Smythies <dsmythies@telus.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/package/mkdebian | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 985d72d1ab34..d2c4365c189f 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -56,6 +56,7 @@ set_debarch() {
 version=$KERNELRELEASE
 if [ -n "$KDEB_PKGVERSION" ]; then
 	packageversion=$KDEB_PKGVERSION
+	revision=${packageversion##*-}
 else
 	revision=$(cat .version 2>/dev/null||echo 1)
 	packageversion=$version-$revision
@@ -173,10 +174,12 @@ cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f
 
 build:
-	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=
+	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
+	KBUILD_BUILD_VERSION=${revision} KBUILD_SRC=
 
 binary-arch:
-	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC= intdeb-pkg
+	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
+	KBUILD_BUILD_VERSION=${revision} KBUILD_SRC= intdeb-pkg
 
 clean:
 	rm -rf debian/*tmp debian/files
-- 
2.17.1
