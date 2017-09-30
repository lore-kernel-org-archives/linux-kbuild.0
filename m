Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25322 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752731AbdI3BKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:10:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/9] kbuild: rpm-pkg: refactor mkspec with here doc
Date: Sat, 30 Sep 2017 10:10:06 +0900
Message-Id: <1506733811-24636-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

The repeat of echo is unreadable.  The here-document is a well-known
device for such scripts.  One difficulty is we have a bunch of PREBUILT
conditionals that would split the here-document.

My idea is to add "$S" annotatation to lines only for the source package
spec file, then post-process it by sed.  I hope it will make our life
easier than repeat of "cat <<EOF ..."

I confirmed this commit still produced the same (bin)kernel.spec as
before.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 218 ++++++++++++++++++++++++-------------------------
 1 file changed, 105 insertions(+), 113 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 97feb60..f34e3bf 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -11,9 +11,9 @@
 
 # how we were called determines which rpms we build and how we build them
 if [ "$1" = prebuilt ]; then
-	PREBUILT=true
+	S=DEL
 else
-	PREBUILT=false
+	S=
 fi
 
 if grep -q CONFIG_DRM=y .config; then
@@ -26,120 +26,112 @@ EXCLUDES="$RCS_TAR_IGNORE --exclude=.tmp_versions --exclude=*vmlinux* \
 --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation \
 --exclude=.config.old --exclude=.missing-syscalls.d"
 
-echo "Name: kernel"
-echo "Summary: The Linux Kernel"
-echo "Version: $__KERNELRELEASE"
-echo "Release: $(cat .version 2>/dev/null || echo 1)"
-echo "License: GPL"
-echo "Group: System Environment/Kernel"
-echo "Vendor: The Linux Community"
-echo "URL: http://www.kernel.org"
+# We can label the here-doc lines for conditional output to the spec file
+#
+# Labels:
+#  $S: this line is enabled only when building source package
+sed -e '/^DEL/d' -e's/^\t*//' <<EOF
+	Name: kernel
+	Summary: The Linux Kernel
+	Version: $__KERNELRELEASE
+	Release: $(cat .version 2>/dev/null || 1)
+	License: GPL
+	Group: System Environment/Kernel
+	Vendor: The Linux Community
+	URL: http://www.kernel.org
+$S	Source: kernel-$__KERNELRELEASE.tar.gz
+	Provides: $PROVIDES
+	%define __spec_install_post /usr/lib/rpm/brp-compress || :
+	%define debug_package %{nil}
 
-if ! $PREBUILT; then
-echo "Source: kernel-$__KERNELRELEASE.tar.gz"
-fi
+	%description
+	The Linux Kernel, the operating system core itself
 
-echo "Provides: $PROVIDES"
-echo "%define __spec_install_post /usr/lib/rpm/brp-compress || :"
-echo "%define debug_package %{nil}"
-echo ""
-echo "%description"
-echo "The Linux Kernel, the operating system core itself"
-echo ""
-echo "%package headers"
-echo "Summary: Header files for the Linux kernel for use by glibc"
-echo "Group: Development/System"
-echo "Obsoletes: kernel-headers"
-echo "Provides: kernel-headers = %{version}"
-echo "%description headers"
-echo "Kernel-headers includes the C header files that specify the interface"
-echo "between the Linux kernel and userspace libraries and programs.  The"
-echo "header files define structures and constants that are needed for"
-echo "building most standard programs and are also needed for rebuilding the"
-echo "glibc package."
-echo ""
+	%package headers
+	Summary: Header files for the Linux kernel for use by glibc
+	Group: Development/System
+	Obsoletes: kernel-headers
+	Provides: kernel-headers = %{version}
+	%description headers
+	Kernel-headers includes the C header files that specify the interface
+	between the Linux kernel and userspace libraries and programs.  The
+	header files define structures and constants that are needed for
+	building most standard programs and are also needed for rebuilding the
+	glibc package.
 
-if ! $PREBUILT; then
-echo "%package devel"
-echo "Summary: Development package for building kernel modules to match the $__KERNELRELEASE kernel"
-echo "Group: System Environment/Kernel"
-echo "AutoReqProv: no"
-echo "%description -n kernel-devel"
-echo "This package provides kernel headers and makefiles sufficient to build modules"
-echo "against the $__KERNELRELEASE kernel package."
-echo ""
-echo "%prep"
-echo "%setup -q"
-echo ""
-echo "%build"
-echo "make %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}"
-echo ""
-fi
+$S	%package devel
+$S	Summary: Development package for building kernel modules to match the $__KERNELRELEASE kernel
+$S	Group: System Environment/Kernel
+$S	AutoReqProv: no
+$S	%description -n kernel-devel
+$S	This package provides kernel headers and makefiles sufficient to build modules
+$S	against the $__KERNELRELEASE kernel package.
+$S
+$S	%prep
+$S	%setup -q
+$S
+$S	%build
+$S	make %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}
+$S
+	%install
+	mkdir -p \$RPM_BUILD_ROOT/boot
+	%ifarch ia64
+	mkdir -p \$RPM_BUILD_ROOT/boot/efi
+	cp \$(make image_name) \$RPM_BUILD_ROOT/boot/efi/vmlinuz-$KERNELRELEASE
+	ln -s efi/vmlinuz-$KERNELRELEASE \$RPM_BUILD_ROOT/boot/
+	%else
+	cp \$(make image_name) \$RPM_BUILD_ROOT/boot/vmlinuz-$KERNELRELEASE
+	%endif
+	make %{?_smp_mflags} INSTALL_MOD_PATH=\$RPM_BUILD_ROOT KBUILD_SRC= modules_install
+	make %{?_smp_mflags} INSTALL_HDR_PATH=\$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install
+	cp System.map \$RPM_BUILD_ROOT/boot/System.map-$KERNELRELEASE
+	cp .config \$RPM_BUILD_ROOT/boot/config-$KERNELRELEASE
+	bzip2 -9 --keep vmlinux
+	mv vmlinux.bz2 \$RPM_BUILD_ROOT/boot/vmlinux-$KERNELRELEASE.bz2
+$S	rm -f \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE/build
+$S	rm -f \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE/source
+$S	mkdir -p \$RPM_BUILD_ROOT/usr/src/kernels/$KERNELRELEASE
+$S	tar cf - . $EXCLUDES | tar xf - -C \$RPM_BUILD_ROOT/usr/src/kernels/$KERNELRELEASE
+$S	cd \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE
+$S	ln -sf /usr/src/kernels/$KERNELRELEASE build
+$S	ln -sf /usr/src/kernels/$KERNELRELEASE source
 
-echo "%install"
-echo 'mkdir -p $RPM_BUILD_ROOT/boot'
-echo "%ifarch ia64"
-echo 'mkdir -p $RPM_BUILD_ROOT/boot/efi'
-echo 'cp $(make image_name) $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
-echo 'ln -s '"efi/vmlinuz-$KERNELRELEASE" '$RPM_BUILD_ROOT'"/boot/"
-echo "%else"
-echo 'cp $(make image_name) $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
-echo "%endif"
-echo 'make %{?_smp_mflags} INSTALL_MOD_PATH=$RPM_BUILD_ROOT KBUILD_SRC= modules_install'
-echo 'make %{?_smp_mflags} INSTALL_HDR_PATH=$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install'
-echo 'cp System.map $RPM_BUILD_ROOT'"/boot/System.map-$KERNELRELEASE"
-echo 'cp .config $RPM_BUILD_ROOT'"/boot/config-$KERNELRELEASE"
-echo 'bzip2 -9 --keep vmlinux'
-echo 'mv vmlinux.bz2 $RPM_BUILD_ROOT'"/boot/vmlinux-$KERNELRELEASE.bz2"
+	%clean
+	rm -rf \$RPM_BUILD_ROOT
 
-if ! $PREBUILT; then
-echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/build"
-echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/source"
-echo "mkdir -p "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
-echo "tar cf - . $EXCLUDES | tar xf - -C "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
-echo 'cd $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE"
-echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
-echo "ln -sf /usr/src/kernels/$KERNELRELEASE source"
-fi
+	%post
+	if [ -x /sbin/installkernel -a -r /boot/vmlinuz-$KERNELRELEASE -a -r /boot/System.map-$KERNELRELEASE ]; then
+	cp /boot/vmlinuz-$KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm
+	cp /boot/System.map-$KERNELRELEASE /boot/.System.map-$KERNELRELEASE-rpm
+	rm -f /boot/vmlinuz-$KERNELRELEASE /boot/System.map-$KERNELRELEASE
+	/sbin/installkernel $KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm /boot/.System.map-$KERNELRELEASE-rpm
+	rm -f /boot/.vmlinuz-$KERNELRELEASE-rpm /boot/.System.map-$KERNELRELEASE-rpm
+	fi
 
-echo ""
-echo "%clean"
-echo 'rm -rf $RPM_BUILD_ROOT'
-echo ""
-echo "%post"
-echo "if [ -x /sbin/installkernel -a -r /boot/vmlinuz-$KERNELRELEASE -a -r /boot/System.map-$KERNELRELEASE ]; then"
-echo "cp /boot/vmlinuz-$KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm"
-echo "cp /boot/System.map-$KERNELRELEASE /boot/.System.map-$KERNELRELEASE-rpm"
-echo "rm -f /boot/vmlinuz-$KERNELRELEASE /boot/System.map-$KERNELRELEASE"
-echo "/sbin/installkernel $KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm /boot/.System.map-$KERNELRELEASE-rpm"
-echo "rm -f /boot/.vmlinuz-$KERNELRELEASE-rpm /boot/.System.map-$KERNELRELEASE-rpm"
-echo "fi"
-echo ""
-echo "%preun"
-echo "if [ -x /sbin/new-kernel-pkg ]; then"
-echo "new-kernel-pkg --remove $KERNELRELEASE --rminitrd --initrdfile=/boot/initramfs-$KERNELRELEASE.img"
-echo "fi"
-echo ""
-echo "%postun"
-echo "if [ -x /sbin/update-bootloader ]; then"
-echo "/sbin/update-bootloader --remove $KERNELRELEASE"
-echo "fi"
-echo ""
-echo "%files"
-echo '%defattr (-, root, root)'
-echo "/lib/modules/$KERNELRELEASE"
-echo "%exclude /lib/modules/$KERNELRELEASE/build"
-echo "%exclude /lib/modules/$KERNELRELEASE/source"
-echo "/boot/*"
-echo ""
-echo "%files headers"
-echo '%defattr (-, root, root)'
-echo "/usr/include"
-if ! $PREBUILT; then
-echo ""
-echo "%files devel"
-echo '%defattr (-, root, root)'
-echo "/usr/src/kernels/$KERNELRELEASE"
-echo "/lib/modules/$KERNELRELEASE/build"
-echo "/lib/modules/$KERNELRELEASE/source"
-fi
+	%preun
+	if [ -x /sbin/new-kernel-pkg ]; then
+	new-kernel-pkg --remove $KERNELRELEASE --rminitrd --initrdfile=/boot/initramfs-$KERNELRELEASE.img
+	fi
+
+	%postun
+	if [ -x /sbin/update-bootloader ]; then
+	/sbin/update-bootloader --remove $KERNELRELEASE
+	fi
+
+	%files
+	%defattr (-, root, root)
+	/lib/modules/$KERNELRELEASE
+	%exclude /lib/modules/$KERNELRELEASE/build
+	%exclude /lib/modules/$KERNELRELEASE/source
+	/boot/*
+
+	%files headers
+	%defattr (-, root, root)
+	/usr/include
+$S
+$S	%files devel
+$S	%defattr (-, root, root)
+$S	/usr/src/kernels/$KERNELRELEASE
+$S	/lib/modules/$KERNELRELEASE/build
+$S	/lib/modules/$KERNELRELEASE/source
+EOF
-- 
2.7.4

