Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:60087 "EHLO smtp3-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932301Ab3DSUzn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Apr 2013 16:55:43 -0400
Received: from molly.corsac.net (unknown [78.192.68.46])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 254F1A627E
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Apr 2013 22:55:31 +0200 (CEST)
Date: Fri, 19 Apr 2013 22:54:37 +0200
From: Yves-Alexis Perez <corsac@debian.org>
Subject: [PATCH] Correctly handle $KCONFIG_CONFIG
Message-ID: <20130419205433.GA3705@scapa.corsac.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; x-action=pgp-signed
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

I noticed that the builddeb packaging script used by make deb-pkg didn't
handle $KCONFIG_CONFIG environment for setting the config file.

This patch adds support for the variable.

Signed-off-by: Yves-Alexis Perez <corsac@debian.org>
- ---
 scripts/package/builddeb |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3c6c0b1..243d3c9 100644
- --- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -41,9 +41,9 @@ create_package() {
 	parisc*)
 		debarch=hppa ;;
 	mips*)
- -		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
+		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el) ;;
 	arm*)
- -		debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
+		debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el) ;;
 	*)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
@@ -105,12 +105,12 @@ fi
 if [ "$ARCH" = "um" ] ; then
 	$MAKE linux
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
- -	cp .config "$tmpdir/usr/share/doc/$packagename/config"
+	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
 	gzip "$tmpdir/usr/share/doc/$packagename/config"
 	cp $KBUILD_IMAGE "$tmpdir/usr/bin/linux-$version"
 else 
 	cp System.map "$tmpdir/boot/System.map-$version"
- -	cp .config "$tmpdir/boot/config-$version"
+	cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
 	# Not all arches include the boot path in KBUILD_IMAGE
 	if [ -e $KBUILD_IMAGE ]; then
 		cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
@@ -119,7 +119,7 @@ else
 	fi
 fi
 
- -if grep -q '^CONFIG_MODULES=y' .config ; then
+if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	INSTALL_MOD_PATH="$tmpdir" make KBUILD_SRC= modules_install
 	if [ "$ARCH" = "um" ] ; then
 		mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$version/"
@@ -240,7 +240,7 @@ fi
 # Build header package
 (cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
- -(cd $objtree; find .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
+(cd $objtree; find $KCONFIG_CONFIG Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
- -- 
1.7.10.4


- -- 
Yves-Alexis
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQEcBAEBCgAGBQJRca8FAAoJEG3bU/KmdcCl9HEH/AnfDEUw58DkxlNLARM8nkfO
x7DRZmSL9eLeRbalhU1iMNxSKj7An62Z7mkGGDUBVppBu6EA1G+QIFn+n/KpJIg5
ufEODYphwY1dgy0fN/i336Hu3pb60KrhuPLBFIyoe8EQQWLyG9PvM5KvjNc7937A
NZ4fhuxTdF7tm3TY0RkeaIglHCiwyYOpULtk67pRHhmedC5l1WuBspelPUj8GeH6
/8vciNnn+3cnhCPIo1YC+2784B9YWQoFEVciAkxCutzfS+UUplXya2E7J4OqDm4T
wDqfGOtAH1WlXF0AhDuhv5Fnkc+ts4fuq7KmwqOJ+MVV1n+RUOcFj0ChwDm22lY=
=wF+s
-----END PGP SIGNATURE-----
