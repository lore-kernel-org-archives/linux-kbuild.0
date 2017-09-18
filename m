Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35742 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752971AbdIRMMr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Sep 2017 08:12:47 -0400
From: Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] kbuild: do not try to include firmware in the kernel rpm
Date: Mon, 18 Sep 2017 14:11:15 +0200
Message-Id: <649fc773623d3f3a445cbfb8abca51c04c7919f4.1505730087.git.pabeni@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Since the commit 5620a0d1aacd ("firmware: delete in-kernel firmware")
the make target 'firmware_install' is no more available, but the
current kernel rpm specfile uses it, so that binary rpm generation
always fails.

Fix it by dropping firmware inclusion in the generated rpm, too.
The firmware directory - now empty - is still included into the rpm.

Fixes: 5620a0d1aacd ("firmware: delete in-kernel firmware")
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 scripts/package/mkspec | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index bb43f153fd8e..8c687463f872 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -91,8 +91,6 @@ echo "%endif"
 echo 'mkdir -p $RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
 
 echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= mod-fw= modules_install'
-echo 'INSTALL_FW_PATH=$RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
-echo 'make INSTALL_FW_PATH=$INSTALL_FW_PATH' firmware_install
 echo "%ifarch ia64"
 echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
 echo 'ln -s '"efi/vmlinuz-$KERNELRELEASE" '$RPM_BUILD_ROOT'"/boot/"
-- 
2.13.5

