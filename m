Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:36731 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbeICOWx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Sep 2018 10:22:53 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 2/3] kbuild: rpm-pkg: hard-code ARCH in RPM SPEC file
Date: Mon,  3 Sep 2018 19:01:55 +0900
Message-Id: <1535968916-9159-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
References: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>, Laura Abbott <labbott@redhat.com>, Jiri Kosina <jkosina@suse.cz>, Ben Hutchings <ben.hutchings@codethink.co.uk>, =?UTF-8?q?Michal=20Such=8F=AB=A1nek?= <msuchanek@suse.de>, Takashi Iwai <tiwai@suse.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The kernel source package contains the .config, which is ARCH-specific.
Obviously, the target architecture is specified when you create a
source package, instead of build-time.

Record ARCH= in the spec file in order to avoid uncertainty about
what ARCH should be given for building.

Add 'ExclusiveArch' tag to stop building immediately in case a user
tries to build it for an unintended architecture.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index e05646d..f72c46a 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -26,6 +26,14 @@ if grep -q CONFIG_DRM=y .config; then
 	PROVIDES=kernel-drm
 fi
 
+if [ "$ARCH" = ia64 ]; then
+	INSTALL_IMAGE="mkdir -p %{buildroot}/boot/efi
+	cp $KBUILD_IMAGE %{buildroot}/boot/efi/vmlinuz-$KERNELRELEASE
+	ln -s efi/vmlinuz-$KERNELRELEASE %{buildroot}/boot/"
+else
+	INSTALL_IMAGE="cp $KBUILD_IMAGE %{buildroot}/boot/vmlinuz-$KERNELRELEASE"
+fi
+
 PROVIDES="$PROVIDES kernel-$KERNELRELEASE"
 __KERNELRELEASE=$(echo $KERNELRELEASE | sed -e "s/-/_/g")
 EXCLUDES="$RCS_TAR_IGNORE --exclude=.tmp_versions --exclude=*vmlinux* \
@@ -47,6 +55,7 @@ sed -e '/^DEL/d' -e 's/^\t*//' <<EOF
 	Vendor: The Linux Community
 	URL: http://www.kernel.org
 $S	Source: kernel-$__KERNELRELEASE.tar.gz
+	ExclusiveArch: $UTS_MACHINE
 	Provides: $PROVIDES
 	%define __spec_install_post /usr/lib/rpm/brp-compress || :
 	%define debug_package %{nil}
@@ -78,19 +87,13 @@ $S	%prep
 $S	%setup -q
 $S
 $S	%build
-$S	make %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}
+$S	make %{?_smp_mflags} ARCH=$ARCH KBUILD_BUILD_VERSION=%{release}
 $S
 	%install
 	mkdir -p %{buildroot}/boot
-	%ifarch ia64
-	mkdir -p %{buildroot}/boot/efi
-	cp \$(make image_name) %{buildroot}/boot/efi/vmlinuz-$KERNELRELEASE
-	ln -s efi/vmlinuz-$KERNELRELEASE %{buildroot}/boot/
-	%else
-	cp \$(make image_name) %{buildroot}/boot/vmlinuz-$KERNELRELEASE
-	%endif
-$M	make %{?_smp_mflags} INSTALL_MOD_PATH=%{buildroot} KBUILD_SRC= modules_install
-	make %{?_smp_mflags} INSTALL_HDR_PATH=%{buildroot}/usr KBUILD_SRC= headers_install
+	$INSTALL_IMAGE
+$M	make %{?_smp_mflags} ARCH=$ARCH INSTALL_MOD_PATH=%{buildroot} KBUILD_SRC= modules_install
+	make %{?_smp_mflags} ARCH=$ARCH INSTALL_HDR_PATH=%{buildroot}/usr KBUILD_SRC= headers_install
 	cp System.map %{buildroot}/boot/System.map-$KERNELRELEASE
 	cp .config %{buildroot}/boot/config-$KERNELRELEASE
 	bzip2 -9 --keep vmlinux
-- 
2.7.4
