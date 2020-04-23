Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:31787 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgDWHkd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:33 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 14/16] samples: auxdisplay: use 'userprogs' syntax
Date: Thu, 23 Apr 2020 16:39:27 +0900
Message-Id: <20200423073929.127521-15-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

Kbuild now supports the 'userprogs' syntax to describe the build rules
of userspace programs for the target architecture (i.e. the same
architecture as the kernel).

Add the entry to samples/Makefile to put this into the build bot
coverage.

I also added the CONFIG option guarded by 'depends on CC_CAN_LINK'
because $(CC) may not necessarily provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Kconfig             |  4 ++++
 samples/Makefile            |  1 +
 samples/auxdisplay/Makefile | 11 ++---------
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index b9dafee5d3af..cdb0091e4734 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -6,6 +6,10 @@ menuconfig SAMPLES
 
 if SAMPLES
 
+config SAMPLE_AUXDISPLAY
+	bool "auxdisplay sample"
+	depends on CC_CAN_LINK
+
 config SAMPLE_TRACE_EVENTS
 	tristate "Build trace_events examples -- loadable modules only"
 	depends on EVENT_TRACING && m
diff --git a/samples/Makefile b/samples/Makefile
index bdc168405452..0c43b5d34b15 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux samples code
 
+subdir-$(CONFIG_SAMPLE_AUXDISPLAY)	+= auxdisplay
 obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)	+= binderfs/
 obj-$(CONFIG_SAMPLE_CONFIGFS)		+= configfs/
 obj-$(CONFIG_SAMPLE_CONNECTOR)		+= connector/
diff --git a/samples/auxdisplay/Makefile b/samples/auxdisplay/Makefile
index 0273bab27233..dbdf939af94a 100644
--- a/samples/auxdisplay/Makefile
+++ b/samples/auxdisplay/Makefile
@@ -1,10 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-CC := $(CROSS_COMPILE)gcc
-CFLAGS := -I../../usr/include
-
-PROGS := cfag12864b-example
-
-all: $(PROGS)
-
-clean:
-	rm -fr $(PROGS)
+userprogs := cfag12864b-example
+always-y := $(userprogs)
-- 
2.25.1
