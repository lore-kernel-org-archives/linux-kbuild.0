Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:28284 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729094AbgAYENO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:13:14 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v3 6/7] builddeb: split kernel headers deployment out into a function
Date: Sat, 25 Jan 2020 13:12:34 +0900
Message-Id: <20200125041235.8856-6-masahiroy@kernel.org>
In-Reply-To: <20200125041235.8856-1-masahiroy@kernel.org>
References: <20200125041235.8856-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

Deploy kernel headers (linux-headers package) in a separate function
for readability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3: None
Changes in v2: None

 scripts/package/builddeb | 76 ++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 34 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 731b5d0b2422..c9287e57d398 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -46,13 +46,49 @@ create_package() {
 	dpkg-deb ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
 }
 
+deploy_kernel_headers () {
+	pdir=$1
+
+	rm -rf $pdir
+
+	(
+		cd $srctree
+		find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
+		find include scripts -type f -o -type l
+		find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
+		find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f
+	) > debian/hdrsrcfiles
+
+	{
+		if is_enabled CONFIG_STACK_VALIDATION; then
+			echo tools/objtool/objtool
+		fi
+
+		find arch/$SRCARCH/include Module.symvers include scripts -type f
+
+		if is_enabled CONFIG_GCC_PLUGINS; then
+			find scripts/gcc-plugins -name \*.so
+		fi
+	} > debian/hdrobjfiles
+
+	destdir=$pdir/usr/src/linux-headers-$version
+	mkdir -p $destdir
+	tar -c -f - -C $srctree -T debian/hdrsrcfiles | tar -xf - -C $destdir
+	tar -c -f - -T debian/hdrobjfiles | tar -xf - -C $destdir
+	rm -f debian/hdrsrcfiles debian/hdrobjfiles
+
+	# copy .config manually to be where it's expected to be
+	cp $KCONFIG_CONFIG $destdir/.config
+
+	mkdir -p $pdir/lib/modules/$version/
+	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
+}
+
 version=$KERNELRELEASE
 tmpdir=debian/linux-image
-kernel_headers_dir=debian/linux-headers
 libc_headers_dir=debian/linux-libc-dev
 dbg_dir=debian/linux-image-dbg
 packagename=linux-image-$version
-kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
 dbg_packagename=$packagename-dbg
 
@@ -77,10 +113,9 @@ esac
 BUILD_DEBUG=$(if_enabled_echo CONFIG_DEBUG_INFO Yes)
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" debian/files
+rm -rf "$tmpdir" "$libc_headers_dir" "$dbg_dir" debian/files
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
-mkdir -p "$kernel_headers_dir/lib/modules/$version/"
 
 # Install the kernel
 if [ "$ARCH" = "um" ] ; then
@@ -163,37 +198,10 @@ EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
 done
 
-# Build kernel header package
-(
-	cd $srctree
-	find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
-	find include scripts -type f -o -type l
-	find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
-	find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f
-) > debian/hdrsrcfiles
-
-{
-	if is_enabled CONFIG_STACK_VALIDATION; then
-		echo tools/objtool/objtool
-	fi
-
-	find arch/$SRCARCH/include Module.symvers include scripts -type f
-
-	if is_enabled CONFIG_GCC_PLUGINS; then
-		find scripts/gcc-plugins -name \*.so
-	fi
-} > debian/hdrobjfiles
-
-destdir=$kernel_headers_dir/usr/src/linux-headers-$version
-mkdir -p "$destdir"
-tar -c -f - -C $srctree -T debian/hdrsrcfiles | tar -xf - -C $destdir
-tar -c -f - -T debian/hdrobjfiles | tar -xf - -C $destdir
-cp $KCONFIG_CONFIG $destdir/.config # copy .config manually to be where it's expected to be
-ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
-rm -f debian/hdrsrcfiles debian/hdrobjfiles
-
 if [ "$ARCH" != "um" ]; then
-	create_package "$kernel_headers_packagename" "$kernel_headers_dir"
+	deploy_kernel_headers debian/linux-headers
+	create_package linux-headers-$version debian/linux-headers
+
 	create_package "$libc_headers_packagename" "$libc_headers_dir"
 fi
 
-- 
2.17.1
