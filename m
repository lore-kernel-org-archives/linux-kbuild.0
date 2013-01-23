Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:47998 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753599Ab3AWN2x (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Jan 2013 08:28:53 -0500
Message-ID: <50FFE587.4020801@gmail.com>
Date: Wed, 23 Jan 2013 21:28:39 +0800
From: winton <newtonliuwen@gmail.com>
MIME-Version: 1.0
Subject: Security Kconfig is not common
Content-Type: multipart/mixed;
 boundary="------------040402040902090208050805"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: james.l.morris@oracle.com
Cc: linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------040402040902090208050805
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi James,

     Please help to review this patch.
     When I analysis Kconfig files, I searched the keywork "source" and 
then follow double quotations. The Kconfig in security is missing. 
That's because security/Kconfig source keyword didn't using double 
quotations.
     Although that's may be not necessary. But I think the same as other 
Kconfig files will be better.

Best regards,
Winton.Liu

--------------040402040902090208050805
Content-Type: text/x-patch;
 name="0001-Security-Kconfig-not-common.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Security-Kconfig-not-common.patch"

From ccd2d4ddc01076570f23d3f4bfa5b3845a71524e Mon Sep 17 00:00:00 2001
From: "winton.liu" <newtonliuwen@gmail.com>
Date: Wed, 23 Jan 2013 21:08:33 +0800
Subject: [PATCH] Security Kconfig not common

Add dobule quotations in Kconfig source keyword.
That makes Kconfig files the same as other Kconfig.
It's more common.

Signed-off-by: winton.liu <newtonliuwen@gmail.com>
---
 security/Kconfig           |   12 ++++++------
 security/integrity/Kconfig |    4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/security/Kconfig b/security/Kconfig
index ccc61f8..e6936f2 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -183,13 +183,13 @@ config LSM_MMAP_MIN_ADDR
 	  this low address space will need the permission specific to the
 	  systems running LSM.
 
-source security/selinux/Kconfig
-source security/smack/Kconfig
-source security/tomoyo/Kconfig
-source security/apparmor/Kconfig
-source security/yama/Kconfig
+source "security/selinux/Kconfig"
+source "security/smack/Kconfig"
+source "security/tomoyo/Kconfig"
+source "security/apparmor/Kconfig"
+source "security/yama/Kconfig"
 
-source security/integrity/Kconfig
+source "security/integrity/Kconfig"
 
 choice
 	prompt "Default security module"
diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 5bd1cc1..ba9147d 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -17,5 +17,5 @@ config INTEGRITY_SIGNATURE
 	  This is useful for evm and module keyrings, when keys are
 	  usually only added from initramfs.
 
-source security/integrity/ima/Kconfig
-source security/integrity/evm/Kconfig
+source "security/integrity/ima/Kconfig"
+source "security/integrity/evm/Kconfig"
-- 
1.7.9.5


--------------040402040902090208050805--
