Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outmail005.snc4.facebook.com ([66.220.144.137]:64506 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753387Ab1EDUsM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 16:48:12 -0400
Date: Wed, 4 May 2011 13:48:11 -0700
From: Arun Sharma <asharma@fb.com>
Subject: [PATCH] Replace '-' in kernel version with '_'
Message-ID: <20110504204811.GA1803@dev1756.snc6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Removing the '-' results in hard to read filenames such as:
kernel-2.6.35.2000042g76e4caf-28.x86_64.rpm

kernel-2.6.35.2_000042_g76e4caf-28.x86_64.rpm is easier to
read.

Signed-off-by: Arun Sharma <asharma@fb.com>

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index d0b931b..30b437f 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -26,7 +26,7 @@ RPM := $(shell if [ -x "/usr/bin/rpmbuild" ]; then echo rpmbuild; \
 	           else echo rpm; fi)
 
 # Remove hyphens since they have special meaning in RPM filenames
-KERNELPATH := kernel-$(subst -,,$(KERNELRELEASE))
+KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
 MKSPEC     := $(srctree)/scripts/package/mkspec
 PREV       := set -e; cd ..;
 
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 65845b4..309a275 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -22,7 +22,7 @@ if [ "`grep CONFIG_DRM=y .config | cut -f2 -d\=`" = "y" ]; then
 fi
 
 PROVIDES="$PROVIDES kernel-$KERNELRELEASE"
-__KERNELRELEASE=`echo $KERNELRELEASE | sed -e "s/-//g"`
+__KERNELRELEASE=`echo $KERNELRELEASE | sed -e "s/-/_/g"`
 
 echo "Name: kernel"
 echo "Summary: The Linux Kernel"
-- 
1.7.4
