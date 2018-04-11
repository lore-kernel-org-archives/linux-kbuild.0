Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:46349 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750734AbeDKSP3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Apr 2018 14:15:29 -0400
Received: by mail-wr0-f196.google.com with SMTP id d1so2652802wrj.13
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Apr 2018 11:15:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] kbuild: rpm-pkg: use kernel-install as a fallback for new-kernel-pkg
Date: Wed, 11 Apr 2018 20:15:24 +0200
Message-Id: <20180411181525.23902-1-javierm@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Peter Jones <pjones@redhat.com>, Paolo Abeni <pabeni@redhat.com>, Josh Boyer <jwboyer@redhat.com>, Javier Martinez Canillas <javierm@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

The new-kernel-pkg script is only present when grubby is installed, but it
may not always be the case. So if the script isn't present, attempt to use
the kernel-install script as a fallback instead.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

---

 scripts/package/mkspec | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 61427c6f2209..e05646dc24dc 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -118,6 +118,8 @@ $S$M	ln -sf /usr/src/kernels/$KERNELRELEASE source
 	%preun
 	if [ -x /sbin/new-kernel-pkg ]; then
 	new-kernel-pkg --remove $KERNELRELEASE --rminitrd --initrdfile=/boot/initramfs-$KERNELRELEASE.img
+	elif [ -x /usr/bin/kernel-install ]; then
+	kernel-install remove $KERNELRELEASE
 	fi
 
 	%postun
-- 
2.14.3

