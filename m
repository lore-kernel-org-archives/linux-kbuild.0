Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:57246 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754235AbaDQCsD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Apr 2014 22:48:03 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile14) with ESMTP id s3H2m1eR021176
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Apr 2014 11:48:01 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili17) with ESMTP id s3H2m1310138
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Apr 2014 11:48:01 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: do not add "selinux" to subdir- twice
Date: Thu, 17 Apr 2014 11:47:47 +0900
Message-Id: <1397702867-973-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

scripts/Makefile adds "selinux" to subdir-y or subdir- twice.

  subdir-$(CONFIG_MODVERSIONS) += genksyms
  subdir-y                     += mod
  subdir-$(CONFIG_SECURITY_SELINUX) += selinux    <--- here
  subdir-$(CONFIG_DTC)         += dtc

  # Let clean descend into subdirs
  subdir- += basic kconfig package selinux        <--- again

The latter is redundant.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 scripts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 1d07860..890df5c 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -39,4 +39,4 @@ subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_DTC)         += dtc
 
 # Let clean descend into subdirs
-subdir-	+= basic kconfig package selinux
+subdir-	+= basic kconfig package
-- 
1.8.3.2

