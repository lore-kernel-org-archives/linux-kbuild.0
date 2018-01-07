Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:37109 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754702AbeAGVl5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jan 2018 16:41:57 -0500
Received: by mail-pf0-f196.google.com with SMTP id n6so4611219pfa.4
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Jan 2018 13:41:57 -0800 (PST)
From: Martin Kelly <martin@martingkelly.com>
Subject: [PATCH v2] tools: fix cross-compile var clobbering
Date: Sun,  7 Jan 2018 13:40:28 -0800
Message-Id: <20180107214028.23771-1-martin@martingkelly.com>
In-Reply-To: <20180106201601.11074-1-martin@martingkelly.com>
References: <20180106201601.11074-1-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Martin Kelly <martin@martingkelly.com>, Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, Linus Walleij <linus.walleij@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Jonathan Cameron <jic23@kernel.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Robert Moore <robert.moore@intel.com>, Lv Zheng <lv.zheng@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuahkh@osg.samsung.com>, Shuah Khan <shuah@kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

From: Martin Kelly <martin@martingkelly.com>

Currently a number of Makefiles break when used with toolchains that pass
extra flags in CC and other cross-compile related variables (such as
--sysroot). Thus we get this error when we use a toolchain that puts
--sysroot in the CC var:

~/src/linux/tools$ make iio
[snip]
iio_event_monitor.c:18:10: fatal error: unistd.h: No such file or directory
  #include <unistd.h>
           ^~~~~~~~~~

This occurs because we clobber several env vars related to cross-compiling
with lines like this:

CC = $(CROSS_COMPILE)gcc

Although this will point to a valid cross-compiler, we lose any extra flags
that might exist in the CC variable, which can break toolchains that rely
on them (for example, those that use --sysroot). This easily shows up using
a Yocto SDK:

$ . [snip]/sdk/environment-setup-cortexa8hf-neon-poky-linux-gnueabi

$ echo $CC
arm-poky-linux-gnueabi-gcc -march=armv7-a -mfpu=neon -mfloat-abi=hard
-mcpu=cortex-a8
--sysroot=[snip]/sdk/sysroots/cortexa8hf-neon-poky-linux-gnueabi

$ echo $CROSS_COMPILE
arm-poky-linux-gnueabi-

$ echo ${CROSS_COMPILE}gcc
krm-poky-linux-gnueabi-gcc

Although arm-poky-linux-gnueabi-gcc is a cross-compiler, we've lost the
--sysroot and other flags that enable us to find the right libraries to
link against, so we can't find unistd.h and other libraries and headers.
Normally with the --sysroot flag we would find unistd.h in the sdk
directory in the sysroot:

$ find [snip]/sdk/sysroots -path '*/usr/include/unistd.h'
[snip]/sdk/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/include/unistd.h

The perf Makefile adds CC = $(CROSS_COMPILE)gcc if and only if CC is not
already set, and it compiles correctly with the above toolchain.

So, generalize the logic that perf uses in the common Makefile and remove
the manual CC = $(CROSS_COMPILE)gcc lines from each Makefile.

Note that this patch does not fix cross-compile for all the tools (some
have other bugs), but it does fix it for all except usb and acpi, which
still have other unrelated issues.

I tested both with and without the patch on native and cross-build and
there appear to be no regressions.

Cc: Tejun Heo <tj@kernel.org>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Robert Moore <robert.moore@intel.com>
Cc: Lv Zheng <lv.zheng@intel.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>
Cc: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Martin Kelly <martin@martingkelly.com>
---
Since there is no globals tools maintainer, I'm sending this to linux-kbuild as
the closest match and CC-ing all affected subsystem maintainers. If no one has
objections, I'm hoping Andrew Morton can pull in the patch.

v2:
- Expand commit description to fill in more detail and CC all relevant
  maintainers.
- Fix small typo related to the STRIP variable.

 tools/cgroup/Makefile            |  1 -
 tools/gpio/Makefile              |  2 --
 tools/hv/Makefile                |  1 -
 tools/iio/Makefile               |  2 --
 tools/laptop/freefall/Makefile   |  1 -
 tools/leds/Makefile              |  1 -
 tools/perf/Makefile.perf         |  6 ------
 tools/power/acpi/Makefile.config |  3 ---
 tools/scripts/Makefile.include   | 18 ++++++++++++++++++
 tools/spi/Makefile               |  2 --
 tools/usb/Makefile               |  1 -
 tools/vm/Makefile                |  1 -
 tools/wmi/Makefile               |  1 -
 13 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/tools/cgroup/Makefile b/tools/cgroup/Makefile
index 860fa151640a..ffca068e4a76 100644
--- a/tools/cgroup/Makefile
+++ b/tools/cgroup/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for cgroup tools
 
-CC = $(CROSS_COMPILE)gcc
 CFLAGS = -Wall -Wextra
 
 all: cgroup_event_listener
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 805a2c0cf4cd..240eda014b37 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -12,8 +12,6 @@ endif
 # (this improves performance and avoids hard-to-debug behaviour);
 MAKEFLAGS += -r
 
-CC = $(CROSS_COMPILE)gcc
-LD = $(CROSS_COMPILE)ld
 CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
 
 ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon
diff --git a/tools/hv/Makefile b/tools/hv/Makefile
index 31503819454d..68c2d7b059b3 100644
--- a/tools/hv/Makefile
+++ b/tools/hv/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Hyper-V tools
 
-CC = $(CROSS_COMPILE)gcc
 WARNINGS = -Wall -Wextra
 CFLAGS = $(WARNINGS) -g $(shell getconf LFS_CFLAGS)
 
diff --git a/tools/iio/Makefile b/tools/iio/Makefile
index a08e7a47d6a3..332ed2f6c2c2 100644
--- a/tools/iio/Makefile
+++ b/tools/iio/Makefile
@@ -12,8 +12,6 @@ endif
 # (this improves performance and avoids hard-to-debug behaviour);
 MAKEFLAGS += -r
 
-CC = $(CROSS_COMPILE)gcc
-LD = $(CROSS_COMPILE)ld
 CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
 
 ALL_TARGETS := iio_event_monitor lsiio iio_generic_buffer
diff --git a/tools/laptop/freefall/Makefile b/tools/laptop/freefall/Makefile
index 5f758c489a20..b572d94255f6 100644
--- a/tools/laptop/freefall/Makefile
+++ b/tools/laptop/freefall/Makefile
@@ -2,7 +2,6 @@
 PREFIX ?= /usr
 SBINDIR ?= sbin
 INSTALL ?= install
-CC = $(CROSS_COMPILE)gcc
 
 TARGET = freefall
 
diff --git a/tools/leds/Makefile b/tools/leds/Makefile
index c379af003807..7b6bed13daaa 100644
--- a/tools/leds/Makefile
+++ b/tools/leds/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for LEDs tools
 
-CC = $(CROSS_COMPILE)gcc
 CFLAGS = -Wall -Wextra -g -I../../include/uapi
 
 all: uledmon led_hw_brightness_mon
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 68cf1360a3f3..3035ce5f6b36 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -144,12 +144,6 @@ define allow-override
     $(eval $(1) = $(2)))
 endef
 
-# Allow setting CC and AR and LD, or setting CROSS_COMPILE as a prefix.
-$(call allow-override,CC,$(CROSS_COMPILE)gcc)
-$(call allow-override,AR,$(CROSS_COMPILE)ar)
-$(call allow-override,LD,$(CROSS_COMPILE)ld)
-$(call allow-override,CXX,$(CROSS_COMPILE)g++)
-
 LD += $(EXTRA_LDFLAGS)
 
 HOSTCC  ?= gcc
diff --git a/tools/power/acpi/Makefile.config b/tools/power/acpi/Makefile.config
index a1883bbb0144..2cccbba64418 100644
--- a/tools/power/acpi/Makefile.config
+++ b/tools/power/acpi/Makefile.config
@@ -56,9 +56,6 @@ INSTALL_SCRIPT = ${INSTALL_PROGRAM}
 # to compile vs uClibc, that can be done here as well.
 CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
 CROSS_COMPILE ?= $(CROSS)
-CC = $(CROSS_COMPILE)gcc
-LD = $(CROSS_COMPILE)gcc
-STRIP = $(CROSS_COMPILE)strip
 HOSTCC = gcc
 
 # check if compiler option is supported
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 3fab179b1aba..853e5e949c61 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -42,6 +42,24 @@ EXTRA_WARNINGS += -Wformat
 
 CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
+# Makefiles suck: This macro sets a default value of $(2) for the
+# variable named by $(1), unless the variable has been set by
+# environment or command line. This is necessary for CC and AR
+# because make sets default values, so the simpler ?= approach
+# won't work as expected.
+define allow-override
+  $(if $(or $(findstring environment,$(origin $(1))),\
+            $(findstring command line,$(origin $(1)))),,\
+    $(eval $(1) = $(2)))
+endef
+
+# Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
+$(call allow-override,CC,$(CROSS_COMPILE)gcc)
+$(call allow-override,AR,$(CROSS_COMPILE)ar)
+$(call allow-override,LD,$(CROSS_COMPILE)ld)
+$(call allow-override,CXX,$(CROSS_COMPILE)g++)
+$(call allow-override,STRIP,$(CROSS_COMPILE)strip)
+
 ifeq ($(CC_NO_CLANG), 1)
 EXTRA_WARNINGS += -Wstrict-aliasing=3
 endif
diff --git a/tools/spi/Makefile b/tools/spi/Makefile
index 90615e10c79a..815d15589177 100644
--- a/tools/spi/Makefile
+++ b/tools/spi/Makefile
@@ -11,8 +11,6 @@ endif
 # (this improves performance and avoids hard-to-debug behaviour);
 MAKEFLAGS += -r
 
-CC = $(CROSS_COMPILE)gcc
-LD = $(CROSS_COMPILE)ld
 CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
 
 ALL_TARGETS := spidev_test spidev_fdx
diff --git a/tools/usb/Makefile b/tools/usb/Makefile
index 4e6506078494..01d758d73b6d 100644
--- a/tools/usb/Makefile
+++ b/tools/usb/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for USB tools
 
-CC = $(CROSS_COMPILE)gcc
 PTHREAD_LIBS = -lpthread
 WARNINGS = -Wall -Wextra
 CFLAGS = $(WARNINGS) -g -I../include
diff --git a/tools/vm/Makefile b/tools/vm/Makefile
index be320b905ea7..20f6cf04377f 100644
--- a/tools/vm/Makefile
+++ b/tools/vm/Makefile
@@ -6,7 +6,6 @@ TARGETS=page-types slabinfo page_owner_sort
 LIB_DIR = ../lib/api
 LIBS = $(LIB_DIR)/libapi.a
 
-CC = $(CROSS_COMPILE)gcc
 CFLAGS = -Wall -Wextra -I../lib/
 LDFLAGS = $(LIBS)
 
diff --git a/tools/wmi/Makefile b/tools/wmi/Makefile
index e664f1167388..e0e87239126b 100644
--- a/tools/wmi/Makefile
+++ b/tools/wmi/Makefile
@@ -2,7 +2,6 @@ PREFIX ?= /usr
 SBINDIR ?= sbin
 INSTALL ?= install
 CFLAGS += -D__EXPORTED_HEADERS__ -I../../include/uapi -I../../include
-CC = $(CROSS_COMPILE)gcc
 
 TARGET = dell-smbios-example
 
-- 
2.11.0

