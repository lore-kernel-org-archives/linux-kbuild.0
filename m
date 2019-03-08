Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:58422 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfCHJ5E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 04:57:04 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: deb-pkg: introduce is_enabled and if_enabled_echo to builddeb
Date: Fri,  8 Mar 2019 18:56:24 +0900
Message-Id: <1552038985-10473-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1552038985-10473-1-git-send-email-yamada.masahiro@socionext.com>
References: <1552038985-10473-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

I think is_enabled() and if_enable_echo() in scripts/package/mkdebian
are useful.

builddeb also has many repetitive greps over the kernel config, so I
borrowed the idea to clean it up.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/builddeb | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8ac25d1..e2cb438 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -12,6 +12,18 @@
 
 set -e
 
+is_enabled() {
+	grep -q "^$1=y" $KCONFIG_CONFIG
+}
+
+if_enabled_echo() {
+	if is_enabled "$1"; then
+		echo -n "$2"
+	elif [ $# -ge 3 ]; then
+		echo -n "$3"
+	fi
+}
+
 create_package() {
 	local pname="$1" pdir="$2"
 
@@ -62,7 +74,7 @@ parisc|mips|powerpc)
 	installed_image_path="boot/vmlinuz-$version"
 esac
 
-BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
+BUILD_DEBUG=$(if_enabled_echo CONFIG_DEBUG_INFO Yes)
 
 # Setup the directory structure
 rm -rf "$tmpdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" $objtree/debian/files
@@ -83,14 +95,14 @@ else
 fi
 cp "$($MAKE -s -f $srctree/Makefile image_name)" "$tmpdir/$installed_image_path"
 
-if grep -q "^CONFIG_OF_EARLY_FLATTREE=y" $KCONFIG_CONFIG ; then
+if is_enabled CONFIG_OF_EARLY_FLATTREE; then
 	# Only some architectures with OF support have this target
 	if [ -d "${srctree}/arch/$SRCARCH/boot/dts" ]; then
 		$MAKE -f $srctree/Makefile INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
 	fi
 fi
 
-if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
+if is_enabled CONFIG_MODULES; then
 	INSTALL_MOD_PATH="$tmpdir" $MAKE -f $srctree/Makefile modules_install
 	rm -f "$tmpdir/lib/modules/$version/build"
 	rm -f "$tmpdir/lib/modules/$version/source"
@@ -111,8 +123,7 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 		done
 
 		# resign stripped modules
-		MODULE_SIG_ALL="$(grep -s '^CONFIG_MODULE_SIG_ALL=y' $KCONFIG_CONFIG || true)"
-		if [ -n "$MODULE_SIG_ALL" ]; then
+		if is_enabled CONFIG_MODULE_SIG_ALL; then
 			INSTALL_MOD_PATH="$tmpdir" $MAKE -f $srctree/Makefile modules_sign
 		fi
 	fi
@@ -129,11 +140,6 @@ fi
 # make-kpkg sets $INITRD to indicate whether an initramfs is wanted, and
 # so do we; recent versions of dracut and initramfs-tools will obey this.
 debhookdir=${KDEB_HOOKDIR:-/etc/kernel}
-if grep -q '^CONFIG_BLK_DEV_INITRD=y' $KCONFIG_CONFIG; then
-	want_initrd=Yes
-else
-	want_initrd=No
-fi
 for script in postinst postrm preinst prerm ; do
 	mkdir -p "$tmpdir$debhookdir/$script.d"
 	cat <<EOF > "$tmpdir/DEBIAN/$script"
@@ -145,7 +151,7 @@ set -e
 export DEB_MAINT_PARAMS="\$*"
 
 # Tell initramfs builder whether it's wanted
-export INITRD=$want_initrd
+export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
 
 test -d $debhookdir/$script.d && run-parts --arg="$version" --arg="/$installed_image_path" $debhookdir/$script.d
 exit 0
@@ -158,11 +164,11 @@ done
 (cd $srctree; find arch/*/include include scripts -type f -o -type l) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
-if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
+if is_enabled CONFIG_STACK_VALIDATION; then
 	(cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
 fi
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
-if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
+if is_enabled CONFIG_GCC_PLUGINS; then
 	(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
 fi
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
-- 
2.7.4
