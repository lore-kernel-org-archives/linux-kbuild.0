Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25300 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752621AbdI3BKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:10:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/9] kbuild: rpm-pkg: fix build error when CONFIG_MODULES is disabled
Date: Sat, 30 Sep 2017 10:10:07 +0900
Message-Id: <1506733811-24636-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

When CONFIG_MODULES is disabled, make rpm-pkg / binrpm-pkg fails
with the following message:

  The present kernel configuration has modules disabled.
  Type 'make config' and enable loadable module support.
  Then build a kernel with module support enabled.

Do not install modules in the case.  Also, omit the devel package.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 57 ++++++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index f34e3bf..8a9ab85 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -16,6 +16,12 @@ else
 	S=
 fi
 
+if grep -q CONFIG_MODULES=y .config; then
+	M=
+else
+	M=DEL
+fi
+
 if grep -q CONFIG_DRM=y .config; then
 	PROVIDES=kernel-drm
 fi
@@ -30,6 +36,7 @@ EXCLUDES="$RCS_TAR_IGNORE --exclude=.tmp_versions --exclude=*vmlinux* \
 #
 # Labels:
 #  $S: this line is enabled only when building source package
+#  $M: this line is enabled only when CONFIG_MODULES is enabled
 sed -e '/^DEL/d' -e's/^\t*//' <<EOF
 	Name: kernel
 	Summary: The Linux Kernel
@@ -59,14 +66,14 @@ $S	Source: kernel-$__KERNELRELEASE.tar.gz
 	building most standard programs and are also needed for rebuilding the
 	glibc package.
 
-$S	%package devel
-$S	Summary: Development package for building kernel modules to match the $__KERNELRELEASE kernel
-$S	Group: System Environment/Kernel
-$S	AutoReqProv: no
-$S	%description -n kernel-devel
-$S	This package provides kernel headers and makefiles sufficient to build modules
-$S	against the $__KERNELRELEASE kernel package.
-$S
+$S$M	%package devel
+$S$M	Summary: Development package for building kernel modules to match the $__KERNELRELEASE kernel
+$S$M	Group: System Environment/Kernel
+$S$M	AutoReqProv: no
+$S$M	%description -n kernel-devel
+$S$M	This package provides kernel headers and makefiles sufficient to build modules
+$S$M	against the $__KERNELRELEASE kernel package.
+$S$M
 $S	%prep
 $S	%setup -q
 $S
@@ -82,19 +89,19 @@ $S
 	%else
 	cp \$(make image_name) \$RPM_BUILD_ROOT/boot/vmlinuz-$KERNELRELEASE
 	%endif
-	make %{?_smp_mflags} INSTALL_MOD_PATH=\$RPM_BUILD_ROOT KBUILD_SRC= modules_install
+$M	make %{?_smp_mflags} INSTALL_MOD_PATH=\$RPM_BUILD_ROOT KBUILD_SRC= modules_install
 	make %{?_smp_mflags} INSTALL_HDR_PATH=\$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install
 	cp System.map \$RPM_BUILD_ROOT/boot/System.map-$KERNELRELEASE
 	cp .config \$RPM_BUILD_ROOT/boot/config-$KERNELRELEASE
 	bzip2 -9 --keep vmlinux
 	mv vmlinux.bz2 \$RPM_BUILD_ROOT/boot/vmlinux-$KERNELRELEASE.bz2
-$S	rm -f \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE/build
-$S	rm -f \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE/source
-$S	mkdir -p \$RPM_BUILD_ROOT/usr/src/kernels/$KERNELRELEASE
-$S	tar cf - . $EXCLUDES | tar xf - -C \$RPM_BUILD_ROOT/usr/src/kernels/$KERNELRELEASE
-$S	cd \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE
-$S	ln -sf /usr/src/kernels/$KERNELRELEASE build
-$S	ln -sf /usr/src/kernels/$KERNELRELEASE source
+$S$M	rm -f \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE/build
+$S$M	rm -f \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE/source
+$S$M	mkdir -p \$RPM_BUILD_ROOT/usr/src/kernels/$KERNELRELEASE
+$S$M	tar cf - . $EXCLUDES | tar xf - -C \$RPM_BUILD_ROOT/usr/src/kernels/$KERNELRELEASE
+$S$M	cd \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE
+$S$M	ln -sf /usr/src/kernels/$KERNELRELEASE build
+$S$M	ln -sf /usr/src/kernels/$KERNELRELEASE source
 
 	%clean
 	rm -rf \$RPM_BUILD_ROOT
@@ -120,18 +127,18 @@ $S	ln -sf /usr/src/kernels/$KERNELRELEASE source
 
 	%files
 	%defattr (-, root, root)
-	/lib/modules/$KERNELRELEASE
-	%exclude /lib/modules/$KERNELRELEASE/build
-	%exclude /lib/modules/$KERNELRELEASE/source
+$M	/lib/modules/$KERNELRELEASE
+$M	%exclude /lib/modules/$KERNELRELEASE/build
+$M	%exclude /lib/modules/$KERNELRELEASE/source
 	/boot/*
 
 	%files headers
 	%defattr (-, root, root)
 	/usr/include
-$S
-$S	%files devel
-$S	%defattr (-, root, root)
-$S	/usr/src/kernels/$KERNELRELEASE
-$S	/lib/modules/$KERNELRELEASE/build
-$S	/lib/modules/$KERNELRELEASE/source
+$S$M
+$S$M	%files devel
+$S$M	%defattr (-, root, root)
+$S$M	/usr/src/kernels/$KERNELRELEASE
+$S$M	/lib/modules/$KERNELRELEASE/build
+$S$M	/lib/modules/$KERNELRELEASE/source
 EOF
-- 
2.7.4

