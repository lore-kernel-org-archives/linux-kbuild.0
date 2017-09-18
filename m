Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:20488 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932138AbdIRJN2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Sep 2017 05:13:28 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: rpm-pkg: delete firmware_install to fix build error
Date: Mon, 18 Sep 2017 18:12:36 +0900
Message-Id: <1505725956-11012-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Markus Trippelsdorf <markus@trippelsdorf.de>, Greg K-H <gregkh@linuxfoundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Commit 5620a0d1aacd ("firmware: delete in-kernel firmware") deleted
in-kernel firmware support, including "make firmware_install".

Since then, "make rpm-pkg" / "make binrpm-pkg" fails to build with
the error:

  make[2]: *** No rule to make target `firmware_install'.  Stop.

Commit df85b2d767aa ("firmware: Restore support for built-in firmware")
restored the build infrastructure for CONFIG_EXTRA_FIRMWARE, but this
is out of the scope of "make firmware_install".  So, the right thing to
do is to kill the use of "make firmware_install".

Fixes: 5620a0d1aacd ("firmware: delete in-kernel firmware")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index bb43f15..bf3e9ab 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -88,11 +88,8 @@ echo 'mkdir -p $RPM_BUILD_ROOT/boot/efi $RPM_BUILD_ROOT/lib/modules'
 echo "%else"
 echo 'mkdir -p $RPM_BUILD_ROOT/boot $RPM_BUILD_ROOT/lib/modules'
 echo "%endif"
-echo 'mkdir -p $RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
 
-echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= mod-fw= modules_install'
-echo 'INSTALL_FW_PATH=$RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
-echo 'make INSTALL_FW_PATH=$INSTALL_FW_PATH' firmware_install
+echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= modules_install'
 echo "%ifarch ia64"
 echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
 echo 'ln -s '"efi/vmlinuz-$KERNELRELEASE" '$RPM_BUILD_ROOT'"/boot/"
@@ -119,7 +116,7 @@ if ! $PREBUILT; then
 echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/build"
 echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/source"
 echo "mkdir -p "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
-echo "EXCLUDES=\"$RCS_TAR_IGNORE --exclude .tmp_versions --exclude=*vmlinux* --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation --exclude=firmware --exclude .config.old --exclude .missing-syscalls.d\""
+echo "EXCLUDES=\"$RCS_TAR_IGNORE --exclude .tmp_versions --exclude=*vmlinux* --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation --exclude .config.old --exclude .missing-syscalls.d\""
 echo "tar "'$EXCLUDES'" -cf- . | (cd "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE;tar xvf -)"
 echo 'cd $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE"
 echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
@@ -154,7 +151,6 @@ echo '%defattr (-, root, root)'
 echo "/lib/modules/$KERNELRELEASE"
 echo "%exclude /lib/modules/$KERNELRELEASE/build"
 echo "%exclude /lib/modules/$KERNELRELEASE/source"
-echo "/lib/firmware/$KERNELRELEASE"
 echo "/boot/*"
 echo ""
 echo "%files headers"
-- 
2.7.4

