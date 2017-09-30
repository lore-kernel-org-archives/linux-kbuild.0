Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25310 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752622AbdI3BKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:10:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/9] kbuild: rpm-pkg: replace $RPM_BUILD_ROOT with %{buildroot}
Date: Sat, 30 Sep 2017 10:10:08 +0900
Message-Id: <1506733811-24636-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

$RPM_BUILD_ROOT must be escaped to prevent shell from expanding it
when generating the spec file.

%{build_root} is more readable than \$RPM_BUILD_ROOT.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 8a9ab85..11e07b5 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -81,30 +81,30 @@ $S	%build
 $S	make %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}
 $S
 	%install
-	mkdir -p \$RPM_BUILD_ROOT/boot
+	mkdir -p %{buildroot}/boot
 	%ifarch ia64
-	mkdir -p \$RPM_BUILD_ROOT/boot/efi
-	cp \$(make image_name) \$RPM_BUILD_ROOT/boot/efi/vmlinuz-$KERNELRELEASE
-	ln -s efi/vmlinuz-$KERNELRELEASE \$RPM_BUILD_ROOT/boot/
+	mkdir -p %{buildroot}/boot/efi
+	cp \$(make image_name) %{buildroot}/boot/efi/vmlinuz-$KERNELRELEASE
+	ln -s efi/vmlinuz-$KERNELRELEASE %{buildroot}/boot/
 	%else
-	cp \$(make image_name) \$RPM_BUILD_ROOT/boot/vmlinuz-$KERNELRELEASE
+	cp \$(make image_name) %{buildroot}/boot/vmlinuz-$KERNELRELEASE
 	%endif
-$M	make %{?_smp_mflags} INSTALL_MOD_PATH=\$RPM_BUILD_ROOT KBUILD_SRC= modules_install
-	make %{?_smp_mflags} INSTALL_HDR_PATH=\$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install
-	cp System.map \$RPM_BUILD_ROOT/boot/System.map-$KERNELRELEASE
-	cp .config \$RPM_BUILD_ROOT/boot/config-$KERNELRELEASE
+$M	make %{?_smp_mflags} INSTALL_MOD_PATH=%{buildroot} KBUILD_SRC= modules_install
+	make %{?_smp_mflags} INSTALL_HDR_PATH=%{buildroot}/usr KBUILD_SRC= headers_install
+	cp System.map %{buildroot}/boot/System.map-$KERNELRELEASE
+	cp .config %{buildroot}/boot/config-$KERNELRELEASE
 	bzip2 -9 --keep vmlinux
-	mv vmlinux.bz2 \$RPM_BUILD_ROOT/boot/vmlinux-$KERNELRELEASE.bz2
-$S$M	rm -f \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE/build
-$S$M	rm -f \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE/source
-$S$M	mkdir -p \$RPM_BUILD_ROOT/usr/src/kernels/$KERNELRELEASE
-$S$M	tar cf - . $EXCLUDES | tar xf - -C \$RPM_BUILD_ROOT/usr/src/kernels/$KERNELRELEASE
-$S$M	cd \$RPM_BUILD_ROOT/lib/modules/$KERNELRELEASE
+	mv vmlinux.bz2 %{buildroot}/boot/vmlinux-$KERNELRELEASE.bz2
+$S$M	rm -f %{buildroot}/lib/modules/$KERNELRELEASE/build
+$S$M	rm -f %{buildroot}/lib/modules/$KERNELRELEASE/source
+$S$M	mkdir -p %{buildroot}/usr/src/kernels/$KERNELRELEASE
+$S$M	tar cf - . $EXCLUDES | tar xf - -C %{buildroot}/usr/src/kernels/$KERNELRELEASE
+$S$M	cd %{buildroot}/lib/modules/$KERNELRELEASE
 $S$M	ln -sf /usr/src/kernels/$KERNELRELEASE build
 $S$M	ln -sf /usr/src/kernels/$KERNELRELEASE source
 
 	%clean
-	rm -rf \$RPM_BUILD_ROOT
+	rm -rf %{buildroot}
 
 	%post
 	if [ -x /sbin/installkernel -a -r /boot/vmlinuz-$KERNELRELEASE -a -r /boot/System.map-$KERNELRELEASE ]; then
-- 
2.7.4

