Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:62782 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750788AbaLYFbs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Dec 2014 00:31:48 -0500
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 4/6] kbuild,gcov: simplify kernel/gcov/Makefile
Date: Thu, 25 Dec 2014 14:31:26 +0900
Message-Id: <1419485488-22336-5-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kernel@vger.kernel.org

Kbuild descends into kernel/gcov/ directory only when
CONFIG_GCOV_KERNEL is enabled. (See kernel/Makefile)

CONFIG_GCOV_KERNEL check can be omitted in kernel/gcov/Makefile.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
---

 kernel/gcov/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/gcov/Makefile b/kernel/gcov/Makefile
index 42323c7..69b3515 100644
--- a/kernel/gcov/Makefile
+++ b/kernel/gcov/Makefile
@@ -13,10 +13,10 @@ else
   cc-ver := $(cc-version)
 endif
 
-obj-$(CONFIG_GCOV_KERNEL) := base.o fs.o
+obj-y := base.o fs.o
 
 ifeq ($(call if-lt, $(cc-ver), 0407),1)
-  obj-$(CONFIG_GCOV_KERNEL) += gcc_3_4.o
+  obj-y += gcc_3_4.o
 else
-  obj-$(CONFIG_GCOV_KERNEL) += gcc_4_7.o
+  obj-y += gcc_4_7.o
 endif
-- 
1.9.1

