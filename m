Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25315 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752727AbdI3BKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:10:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/9] kbuild: rpm-pkg: install vmlinux.bz2 unconditionally
Date: Sat, 30 Sep 2017 10:10:04 +0900
Message-Id: <1506733811-24636-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

This conditional was added by commit fc370ecfdb37 ("kbuild: add
vmlinux to kernel rpm").  Its git-log mentioned vmlinux.bz2 was
necessary for debugging, but did not explain why ppc64 was an
exception.  I see no problem to copy vmlinux.bz2 all the time.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index ef00750..a026c08 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -99,11 +99,8 @@ echo 'make %{?_smp_mflags} INSTALL_HDR_PATH=$RPM_BUILD_ROOT/usr KBUILD_SRC= head
 echo 'cp System.map $RPM_BUILD_ROOT'"/boot/System.map-$KERNELRELEASE"
 
 echo 'cp .config $RPM_BUILD_ROOT'"/boot/config-$KERNELRELEASE"
-
-echo "%ifnarch ppc64"
 echo 'bzip2 -9 --keep vmlinux'
 echo 'mv vmlinux.bz2 $RPM_BUILD_ROOT'"/boot/vmlinux-$KERNELRELEASE.bz2"
-echo "%endif"
 
 if ! $PREBUILT; then
 echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/build"
-- 
2.7.4

