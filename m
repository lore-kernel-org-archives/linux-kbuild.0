Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:33040 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750880Ab3FQNtd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Jun 2013 09:49:33 -0400
Received: by mail-wi0-f181.google.com with SMTP id hq4so2194318wib.8
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2013 06:49:31 -0700 (PDT)
Date: Mon, 17 Jun 2013 15:49:21 +0200
From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v5 1/4] deb-pkg: use KCONFIG_CONFIG instead of .config
 file directly
Message-ID: <20130617154921.221997cd@serenity>
In-Reply-To: <1371265896.3776.2.camel@deadeye.wl.decadent.org.uk>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
	<1371203217-19572-2-git-send-email-anisse@astier.eu>
	<1371265896.3776.2.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>

On Sat, 15 Jun 2013 04:11:36 +0100, Ben Hutchings <ben@decadent.org.uk> wrote :

> On Fri, 2013-06-14 at 11:46 +0200, Anisse Astier wrote:
> > Signed-off-by: Anisse Astier <anisse@astier.eu>
> > Cc: Ben Hutchings <ben@decadent.org.uk>
> [...]
> > @@ -245,7 +245,7 @@ fi
> >  # Build header package
> >  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
> >  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
> > -(cd $objtree; find arch/$SRCARCH/include .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
> > +(cd $objtree; find arch/$SRCARCH/include $KCONFIG_CONFIG Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
> [...]
> 
> I think $KCONFIG_CONFIG needs to be handled specially here - it should
> be installed as .config in the linux-headers package, since you can't
> assume the environment variable is set when that package is used.
> 
> Ben.
> 

You're right. New version below.

From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH] deb-pkg: use KCONFIG_CONFIG instead of .config file directly

Signed-off-by: Anisse Astier <anisse@astier.eu>
Cc: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/builddeb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index acb8650..a8662ef 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -41,9 +41,9 @@ create_package() {
 	parisc*)
 		debarch=hppa ;;
 	mips*)
-		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
+		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el) ;;
 	arm*)
-		debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
+		debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el) ;;
 	*)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
@@ -106,12 +106,12 @@ fi
 if [ "$ARCH" = "um" ] ; then
 	$MAKE linux
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
-	cp .config "$tmpdir/usr/share/doc/$packagename/config"
+	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
 	gzip "$tmpdir/usr/share/doc/$packagename/config"
 	cp $KBUILD_IMAGE "$tmpdir/usr/bin/linux-$version"
 else 
 	cp System.map "$tmpdir/boot/System.map-$version"
-	cp .config "$tmpdir/boot/config-$version"
+	cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
 	# Not all arches include the boot path in KBUILD_IMAGE
 	if [ -e $KBUILD_IMAGE ]; then
 		cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
@@ -120,7 +120,7 @@ else
 	fi
 fi
 
-if grep -q '^CONFIG_MODULES=y' .config ; then
+if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_install
 	rm -f "$tmpdir/lib/modules/$version/build"
 	rm -f "$tmpdir/lib/modules/$version/source"
@@ -245,11 +245,12 @@ fi
 # Build header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
-(cd $objtree; find arch/$SRCARCH/include .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
+(cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T "$objtree/debian/hdrobjfiles") | (cd $destdir; tar -xf -)
+(cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
 rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
 arch=$(dpkg --print-architecture)
-- 
1.8.3.rc1

