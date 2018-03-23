Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr30073.outbound.protection.outlook.com ([40.107.3.73]:52135
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752175AbeCWR7r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Mar 2018 13:59:47 -0400
Date: Fri, 23 Mar 2018 11:59:36 -0600
From: Jason Gunthorpe <jgg@mellanox.com>
Subject: [PATCH] kbuild: rpm-pkg: Support GNU tar >= 1.29
Message-ID: <20180323175936.GA18412@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Pressler <danielpr@mellanox.com>

There is a change in how command line parsing is done in this version.
Excludes and includes are now ordered with the file list. Since
the spec file puts the file list before the exclude list it means newer
tar ignores the excludes and packs all the build output into the
kernel-devel RPM resulting in a huge package.

Simple argument re-ordering fixes the problem.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 scripts/package/mkspec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

At the very least this effects FC27.

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 280027fad991c1..61427c6f220922 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -98,7 +98,7 @@ $M	make %{?_smp_mflags} INSTALL_MOD_PATH=%{buildroot} KBUILD_SRC= modules_instal
 $S$M	rm -f %{buildroot}/lib/modules/$KERNELRELEASE/build
 $S$M	rm -f %{buildroot}/lib/modules/$KERNELRELEASE/source
 $S$M	mkdir -p %{buildroot}/usr/src/kernels/$KERNELRELEASE
-$S$M	tar cf - . $EXCLUDES | tar xf - -C %{buildroot}/usr/src/kernels/$KERNELRELEASE
+$S$M	tar cf - $EXCLUDES . | tar xf - -C %{buildroot}/usr/src/kernels/$KERNELRELEASE
 $S$M	cd %{buildroot}/lib/modules/$KERNELRELEASE
 $S$M	ln -sf /usr/src/kernels/$KERNELRELEASE build
 $S$M	ln -sf /usr/src/kernels/$KERNELRELEASE source
-- 
2.16.2

