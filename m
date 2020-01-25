Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:28259 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgAYENM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:13:12 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v3 5/7] builddeb: remove redundant make for ARCH=um
Date: Sat, 25 Jan 2020 13:12:33 +0900
Message-Id: <20200125041235.8856-5-masahiroy@kernel.org>
In-Reply-To: <20200125041235.8856-1-masahiroy@kernel.org>
References: <20200125041235.8856-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

The kernel build has already been done before builddeb is invoked.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3: None
Changes in v2: None

 scripts/package/builddeb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index a73e0d5377e9..731b5d0b2422 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -82,10 +82,9 @@ mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
 mkdir -p "$kernel_headers_dir/lib/modules/$version/"
 
-# Build and install the kernel
+# Install the kernel
 if [ "$ARCH" = "um" ] ; then
 	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin" "$tmpdir/usr/share/doc/$packagename"
-	$MAKE linux
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
 	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
 	gzip "$tmpdir/usr/share/doc/$packagename/config"
-- 
2.17.1
