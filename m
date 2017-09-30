Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25305 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752627AbdI3BKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:10:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/9] kbuild: rpm-pkg: clean up mkspec
Date: Sat, 30 Sep 2017 10:10:05 +0900
Message-Id: <1506733811-24636-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Clean up the mkspec without changing the behavior.

 - grep CONFIG_DRM=y more simply

 - move "EXCLUDE" out of the "%install" section because it can be
   computed when the spec file is generated

 - remove "BuildRoot:" field, which is now redundant

 - do not mkdir $RPM_BUILD_ROOT/lib/modules explicitly because it
   is automatically created by "make modules_install"

 - exclude "%package devel" from source package spec file because
   it does not make sense where "%files devel" is already excluded

 - exclude "%build" from source package spec file

 - remove unneeded "make clean" because we had already cleaned
   before making tar file

 - merge two %ifarch ia64 conditionals

 - replace KBUILD_IMAGE with direct use of $(make image_name)

 - remove trailing empty line from the spec file

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 44 ++++++++++++++++----------------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index a026c08..97feb60 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -10,19 +10,21 @@
 #
 
 # how we were called determines which rpms we build and how we build them
-if [ "$1" = "prebuilt" ]; then
+if [ "$1" = prebuilt ]; then
 	PREBUILT=true
 else
 	PREBUILT=false
 fi
 
-# starting to output the spec
-if [ "`grep CONFIG_DRM=y .config | cut -f2 -d\=`" = "y" ]; then
+if grep -q CONFIG_DRM=y .config; then
 	PROVIDES=kernel-drm
 fi
 
 PROVIDES="$PROVIDES kernel-$KERNELRELEASE"
-__KERNELRELEASE=`echo $KERNELRELEASE | sed -e "s/-/_/g"`
+__KERNELRELEASE=$(echo $KERNELRELEASE | sed -e "s/-/_/g")
+EXCLUDES="$RCS_TAR_IGNORE --exclude=.tmp_versions --exclude=*vmlinux* \
+--exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation \
+--exclude=.config.old --exclude=.missing-syscalls.d"
 
 echo "Name: kernel"
 echo "Summary: The Linux Kernel"
@@ -37,7 +39,6 @@ if ! $PREBUILT; then
 echo "Source: kernel-$__KERNELRELEASE.tar.gz"
 fi
 
-echo "BuildRoot: %{_tmppath}/%{name}-%{PACKAGE_VERSION}-root"
 echo "Provides: $PROVIDES"
 echo "%define __spec_install_post /usr/lib/rpm/brp-compress || :"
 echo "%define debug_package %{nil}"
@@ -57,6 +58,8 @@ echo "header files define structures and constants that are needed for"
 echo "building most standard programs and are also needed for rebuilding the"
 echo "glibc package."
 echo ""
+
+if ! $PREBUILT; then
 echo "%package devel"
 echo "Summary: Development package for building kernel modules to match the $__KERNELRELEASE kernel"
 echo "Group: System Environment/Kernel"
@@ -65,39 +68,26 @@ echo "%description -n kernel-devel"
 echo "This package provides kernel headers and makefiles sufficient to build modules"
 echo "against the $__KERNELRELEASE kernel package."
 echo ""
-
-if ! $PREBUILT; then
 echo "%prep"
 echo "%setup -q"
 echo ""
-fi
-
 echo "%build"
-
-if ! $PREBUILT; then
-echo "make clean && make %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}"
+echo "make %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}"
 echo ""
 fi
 
 echo "%install"
-echo 'KBUILD_IMAGE=$(make image_name)'
+echo 'mkdir -p $RPM_BUILD_ROOT/boot'
 echo "%ifarch ia64"
-echo 'mkdir -p $RPM_BUILD_ROOT/boot/efi $RPM_BUILD_ROOT/lib/modules'
-echo "%else"
-echo 'mkdir -p $RPM_BUILD_ROOT/boot $RPM_BUILD_ROOT/lib/modules'
-echo "%endif"
-
-echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= modules_install'
-echo "%ifarch ia64"
-echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
+echo 'mkdir -p $RPM_BUILD_ROOT/boot/efi'
+echo 'cp $(make image_name) $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
 echo 'ln -s '"efi/vmlinuz-$KERNELRELEASE" '$RPM_BUILD_ROOT'"/boot/"
 echo "%else"
-echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
+echo 'cp $(make image_name) $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
 echo "%endif"
-
+echo 'make %{?_smp_mflags} INSTALL_MOD_PATH=$RPM_BUILD_ROOT KBUILD_SRC= modules_install'
 echo 'make %{?_smp_mflags} INSTALL_HDR_PATH=$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install'
 echo 'cp System.map $RPM_BUILD_ROOT'"/boot/System.map-$KERNELRELEASE"
-
 echo 'cp .config $RPM_BUILD_ROOT'"/boot/config-$KERNELRELEASE"
 echo 'bzip2 -9 --keep vmlinux'
 echo 'mv vmlinux.bz2 $RPM_BUILD_ROOT'"/boot/vmlinux-$KERNELRELEASE.bz2"
@@ -106,8 +96,7 @@ if ! $PREBUILT; then
 echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/build"
 echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/source"
 echo "mkdir -p "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
-echo "EXCLUDES=\"$RCS_TAR_IGNORE --exclude .tmp_versions --exclude=*vmlinux* --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation --exclude .config.old --exclude .missing-syscalls.d\""
-echo "tar "'$EXCLUDES'" -cf- . | (cd "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE;tar xvf -)"
+echo "tar cf - . $EXCLUDES | tar xf - -C "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
 echo 'cd $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE"
 echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
 echo "ln -sf /usr/src/kernels/$KERNELRELEASE source"
@@ -146,12 +135,11 @@ echo ""
 echo "%files headers"
 echo '%defattr (-, root, root)'
 echo "/usr/include"
-echo ""
 if ! $PREBUILT; then
+echo ""
 echo "%files devel"
 echo '%defattr (-, root, root)'
 echo "/usr/src/kernels/$KERNELRELEASE"
 echo "/lib/modules/$KERNELRELEASE/build"
 echo "/lib/modules/$KERNELRELEASE/source"
-echo ""
 fi
-- 
2.7.4

