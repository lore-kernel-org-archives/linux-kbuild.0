Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:17156 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727353AbfD0Ddv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Apr 2019 23:33:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/5] samples: guard sub-directories with CONFIG options
Date: Sat, 27 Apr 2019 12:33:38 +0900
Message-Id: <1556336020-15634-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
References: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Do not descend to sub-directories when unneeded.

I used subdir-$(CONFIG_...) for hidraw, seccomp, and statx because
they only contain host programs.

While we are here, let's add SPDX License tag, and sort the directories
alphabetically.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 samples/Makefile | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/samples/Makefile b/samples/Makefile
index 50f8586..0f2d70d 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -1,6 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux samples code
 
-obj-y			+= kobject/ kprobes/ trace_events/ livepatch/ \
-			   hw_breakpoint/ kfifo/ kdb/ hidraw/ rpmsg/ seccomp/ \
-			   configfs/ connector/ v4l/ trace_printk/ \
-			   vfio-mdev/ statx/ qmi/ binderfs/
+obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)	+= binderfs/
+obj-$(CONFIG_SAMPLE_CONFIGFS)		+= configfs/
+obj-$(CONFIG_SAMPLE_CONNECTOR)		+= connector/
+subdir-y				+= hidraw
+obj-$(CONFIG_SAMPLE_HW_BREAKPOINT)	+= hw_breakpoint/
+obj-$(CONFIG_SAMPLE_KDB)		+= kdb/
+obj-$(CONFIG_SAMPLE_KFIFO)		+= kfifo/
+obj-$(CONFIG_SAMPLE_KOBJECT)		+= kobject/
+obj-$(CONFIG_SAMPLE_KPROBES)		+= kprobes/
+obj-$(CONFIG_SAMPLE_LIVEPATCH)		+= livepatch/
+obj-$(CONFIG_SAMPLE_QMI_CLIENT)		+= qmi/
+obj-$(CONFIG_SAMPLE_RPMSG_CLIENT)	+= rpmsg/
+subdir-$(CONFIG_SAMPLE_SECCOMP)		+= seccomp
+subdir-$(CONFIG_SAMPLE_STATX)		+= statx
+obj-$(CONFIG_SAMPLE_TRACE_EVENTS)	+= trace_events/
+obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+= trace_printk/
+obj-$(CONFIG_VIDEO_PCI_SKELETON)	+= v4l/
+obj-y					+= vfio-mdev/
-- 
2.7.4
