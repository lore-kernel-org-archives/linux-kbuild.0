Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:50776 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgAMGtl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 01:49:41 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/7] builddeb: remove redundant $objtree/
Date: Mon, 13 Jan 2020 15:48:37 +0900
Message-Id: <20200113064841.3946-3-masahiroy@kernel.org>
In-Reply-To: <20200113064841.3946-1-masahiroy@kernel.org>
References: <20200113064841.3946-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This script works only when it is invoked in the $objtree, that is,
it is already relying on $objtree is '.'

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 0a0a7c1447f4..9b92745bf13a 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -47,10 +47,10 @@ create_package() {
 }
 
 version=$KERNELRELEASE
-tmpdir="$objtree/debian/linux-image"
-kernel_headers_dir="$objtree/debian/linux-headers"
-libc_headers_dir="$objtree/debian/linux-libc-dev"
-dbg_dir="$objtree/debian/linux-image-dbg"
+tmpdir=debian/linux-image
+kernel_headers_dir=debian/linux-headers
+libc_headers_dir=debian/linux-libc-dev
+dbg_dir=debian/linux-image-dbg
 packagename=linux-image-$version
 kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
@@ -77,7 +77,7 @@ esac
 BUILD_DEBUG=$(if_enabled_echo CONFIG_DEBUG_INFO Yes)
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" $objtree/debian/files
+rm -rf "$tmpdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" debian/files
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
 mkdir -p "$kernel_headers_dir/lib/modules/$version/"
@@ -165,24 +165,24 @@ EOF
 done
 
 # Build kernel header package
-(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > "$objtree/debian/hdrsrcfiles"
-(cd $srctree; find include scripts -type f -o -type l) >> "$objtree/debian/hdrsrcfiles"
-(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
-(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
+(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > debian/hdrsrcfiles
+(cd $srctree; find include scripts -type f -o -type l) >> debian/hdrsrcfiles
+(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> debian/hdrsrcfiles
+(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> debian/hdrsrcfiles
 if is_enabled CONFIG_STACK_VALIDATION; then
-	echo tools/objtool/objtool >> "$objtree/debian/hdrobjfiles"
+	echo tools/objtool/objtool >> debian/hdrobjfiles
 fi
-(cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
+find arch/$SRCARCH/include Module.symvers include scripts -type f >> debian/hdrobjfiles
 if is_enabled CONFIG_GCC_PLUGINS; then
-	(cd $objtree; find scripts/gcc-plugins -name \*.so) >> "$objtree/debian/hdrobjfiles"
+	find scripts/gcc-plugins -name \*.so >> debian/hdrobjfiles
 fi
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-(cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd $destdir; tar -xf -)
-(cd $objtree; tar -c -f - -T -) < "$objtree/debian/hdrobjfiles" | (cd $destdir; tar -xf -)
-(cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
+(cd $srctree; tar -c -f - -T -) < debian/hdrsrcfiles | (cd $destdir; tar -xf -)
+tar -c -f - -T - < debian/hdrobjfiles | (cd $destdir; tar -xf -)
+cp $KCONFIG_CONFIG $destdir/.config # copy .config manually to be where it's expected to be
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
-rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
+rm -f debian/hdrsrcfiles debian/hdrobjfiles
 
 if [ "$ARCH" != "um" ]; then
 	create_package "$kernel_headers_packagename" "$kernel_headers_dir"
-- 
2.17.1
