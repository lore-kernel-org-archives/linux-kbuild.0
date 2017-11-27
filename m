Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from david.siemens.de ([192.35.17.14]:39849 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752430AbdK0Q1T (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 11:27:19 -0500
From: Henning Schild <henning.schild@siemens.com>
Subject: [PATCH] builddeb: introduce variables for control-file customization
Date: Mon, 27 Nov 2017 17:13:45 +0100
Message-Id: <20171127161345.17880-1-henning.schild@siemens.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Henning Schild <henning.schild@siemens.com>, Konrad Schwarz <konrad.schwarz@siemens.com>

The debian packages coming out of "make *deb-pkg" lack some critical
information in the control-files e.g. the "Depends:" field. If one
tries to install a fresh system with such a "linux-image" debootstrap or
multistrap might try to install the kernel before its deps and the
package hooks will fail.

Different debian-based distros use different values for the missing
fields. And the values differ between distro versions as well. So
hardcoding of e.g. "Depends" is not possible.

This patch introduces an option variable for every debian package built
by builddeb. That allows advanced users to pass additional arguments to
"dpkg-gencontrol" e.g. to set "Depends". All the new variables are
optional.

for example:
make \
	KDEB_OPTS_IMAGE=\
"-DDepends='initramfs-tools | linux-initramfs-tool, kmod, linux-base'" \
	KDEB_OPTS_LIBC_HEADERS="-DMaintainer='root@machine' -v42" \
	bindeb-pkg

Signed-off-by: Henning Schild <henning.schild@siemens.com>
Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 scripts/package/builddeb | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b4f0f2b3f8d2..037e722bbd8f 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -13,7 +13,10 @@
 set -e
 
 create_package() {
-	local pname="$1" pdir="$2"
+	local pname="$1"
+	shift
+	local pdir="$1"
+	shift
 
 	mkdir -m 755 -p "$pdir/DEBIAN"
 	mkdir -p "$pdir/usr/share/doc/$pname"
@@ -30,7 +33,8 @@ create_package() {
 	chmod -R a+rX "$pdir"
 
 	# Create the package
-	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch}" -p$pname -P"$pdir"
+	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch}" -p$pname \
+		-P"$pdir" "$@"
 	dpkg --build "$pdir" ..
 }
 
@@ -353,11 +357,13 @@ Description: Linux support headers for userspace development
 EOF
 
 if [ "$ARCH" != "um" ]; then
-	create_package "$kernel_headers_packagename" "$kernel_headers_dir"
-	create_package "$libc_headers_packagename" "$libc_headers_dir"
+	eval 'create_package "$kernel_headers_packagename" \
+		"$kernel_headers_dir"' "$KDEB_OPTS_IMAGE_HEADERS"
+	eval 'create_package "$libc_headers_packagename" \
+		"$libc_headers_dir"' "$KDEB_OPTS_LIBC_HEADERS"
 fi
 
-create_package "$packagename" "$tmpdir"
+eval 'create_package "$packagename" "$tmpdir"' "$KDEB_OPTS_IMAGE"
 
 if [ -n "$BUILD_DEBUG" ] ; then
 	# Build debug package
@@ -381,7 +387,8 @@ Description: Linux kernel debugging symbols for $version
  all the necessary debug symbols for the kernel and its modules.
 EOF
 
-	create_package "$dbg_packagename" "$dbg_dir"
+	eval 'create_package "$dbg_packagename" "$dbg_dir" \
+		' "$KDEB_OPTS_IMAGE_DBG"
 fi
 
 if [ "x$1" = "xdeb-pkg" ]
-- 
2.13.6

