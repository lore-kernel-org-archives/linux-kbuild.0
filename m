Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:3772 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753909AbeAKJQb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 04:16:31 -0500
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Subject: [PATCH] Kbuild: suppress packed-not-aligned warning for default setting only
Date: Thu, 11 Jan 2018 17:22:29 +0800
Message-ID: <1515662549-58933-1-git-send-email-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, wangxiongfeng2@huawei.com

From: Xiongfeng Wang <xiongfeng.wang@linaro.org>

gcc-8 reports many -Wpacked-not-aligned warnings. The below are some
examples.

./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
 } __attribute__ ((packed));

./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
 } __attribute__ ((packed));

./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
 } __attribute__ ((packed));

This patch suppress this kind of warnings for default setting.

Signed-off-by: Xiongfeng Wang <xiongfeng.wang@linaro.org>
---
 scripts/Makefile.extrawarn | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index c6ebf42..8d53570 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -11,6 +11,8 @@
 # are not supported by all versions of the compiler
 # ==========================================================================
 
+KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
+
 ifeq ("$(origin W)", "command line")
   export KBUILD_ENABLE_EXTRA_GCC_CHECKS := $(W)
 endif
@@ -26,6 +28,7 @@ warning-1 += -Wold-style-definition
 warning-1 += $(call cc-option, -Wmissing-include-dirs)
 warning-1 += $(call cc-option, -Wunused-but-set-variable)
 warning-1 += $(call cc-option, -Wunused-const-variable)
+warning-1 += $(call cc-option, -Wpacked-not-aligned)
 warning-1 += $(call cc-disable-warning, missing-field-initializers)
 warning-1 += $(call cc-disable-warning, sign-compare)
 
-- 
1.8.3.1

