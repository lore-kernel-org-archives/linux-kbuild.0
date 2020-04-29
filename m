Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:31551 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgD2Dq4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 23:46:56 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 14/15] samples: timers: use 'userprogs' syntax
Date: Wed, 29 Apr 2020 12:45:26 +0900
Message-Id: <20200429034527.590520-15-masahiroy@kernel.org>
In-Reply-To: <20200429034527.590520-1-masahiroy@kernel.org>
References: <20200429034527.590520-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf <bpf@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

Kbuild now supports the 'userprogs' syntax to compile userspace
programs for the same architecture as the kernel.

Add the entry to samples/Makefile to put this into the build bot
coverage.

I also added the CONFIG option guarded by 'depends on CC_CAN_LINK'
because $(CC) may not provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2: None

 samples/Kconfig         |  4 ++++
 samples/Makefile        |  1 +
 samples/timers/Makefile | 17 +++--------------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index 2322e11e8b80..a8629a0d4f96 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -135,6 +135,10 @@ config SAMPLE_SECCOMP
 	  Build samples of seccomp filters using various methods of
 	  BPF filter construction.
 
+config SAMPLE_TIMER
+	bool "Timer sample"
+	depends on CC_CAN_LINK && HEADERS_INSTALL
+
 config SAMPLE_UHID
 	bool "UHID sample"
 	depends on CC_CAN_LINK && HEADERS_INSTALL
diff --git a/samples/Makefile b/samples/Makefile
index 0c43b5d34b15..042208326689 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -16,6 +16,7 @@ subdir-$(CONFIG_SAMPLE_PIDFD)		+= pidfd
 obj-$(CONFIG_SAMPLE_QMI_CLIENT)		+= qmi/
 obj-$(CONFIG_SAMPLE_RPMSG_CLIENT)	+= rpmsg/
 subdir-$(CONFIG_SAMPLE_SECCOMP)		+= seccomp
+subdir-$(CONFIG_SAMPLE_TIMER)		+= timers
 obj-$(CONFIG_SAMPLE_TRACE_EVENTS)	+= trace_events/
 obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+= trace_printk/
 obj-$(CONFIG_SAMPLE_FTRACE_DIRECT)	+= ftrace/
diff --git a/samples/timers/Makefile b/samples/timers/Makefile
index f9fa07460802..15c7ddbc8c51 100644
--- a/samples/timers/Makefile
+++ b/samples/timers/Makefile
@@ -1,16 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef CROSS_COMPILE
-uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+userprogs := hpet_example
+always-y := $(userprogs)
 
-ifeq ($(ARCH),x86)
-CC := $(CROSS_COMPILE)gcc
-PROGS := hpet_example
-
-all: $(PROGS)
-
-clean:
-	rm -fr $(PROGS)
-
-endif
-endif
+userccflags += -I usr/include
-- 
2.25.1
