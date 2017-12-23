Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35152 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752339AbdLWWQh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Dec 2017 17:16:37 -0500
Received: by mail-pg0-f66.google.com with SMTP id q20so15801851pgv.2
        for <linux-kbuild@vger.kernel.org>; Sat, 23 Dec 2017 14:16:37 -0800 (PST)
Subject: Re: [PATCH 1/1] tools: fix cross-compile var export
References: <20171223210641.24588-1-martin@martingkelly.com>
 <20171223210641.24588-2-martin@martingkelly.com>
From: Martin Kelly <martin@martingkelly.com>
Message-ID: <2512a330-1d30-d977-c635-233492da903a@martingkelly.com>
Date: Sat, 23 Dec 2017 14:16:26 -0800
MIME-Version: 1.0
In-Reply-To: <20171223210641.24588-2-martin@martingkelly.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel-janitors@vger.kernel.org
Cc: Alexey Dobriyan <adobriyan@gmail.com>, linux-kbuild@vger.kernel.org

On 12/23/2017 01:06 PM, Martin Kelly wrote:
> From: Martin Kelly <martin@martingkelly.com>
> 
> Currently in a number of Makefiles, we clobber the CC, LD, and/or STRIP env vars
> when cross-compiling, which breaks any additional flags that might be set (such
> as sysroot). This easily shows up by using, for instance, a Yocto SDK.
> 
> Fix this by more carefully overriding the flags in the way that the perf
> Makefile does.
> 
> This patch does not fix cross-compile for all the tools (some have other bugs),
> but it does appear to fix it for these:
> 
> - cgroup
> - freefall
> - gpio
> - hv
> - iio
> - leds
> - spi
> - vm
> - wmi
> 
> Signed-off-by: Martin Kelly <martin@martingkelly.com>
> ---
>   tools/cgroup/Makefile            |  1 -
>   tools/gpio/Makefile              |  2 --
>   tools/hv/Makefile                |  1 -
>   tools/iio/Makefile               |  2 --
>   tools/laptop/freefall/Makefile   |  1 -
>   tools/leds/Makefile              |  1 -
>   tools/perf/Makefile.perf         |  6 ------
>   tools/power/acpi/Makefile.config |  3 ---
>   tools/scripts/Makefile.include   | 18 ++++++++++++++++++
>   tools/spi/Makefile               |  2 --
>   tools/usb/Makefile               |  1 -
>   tools/vm/Makefile                |  1 -
>   tools/wmi/Makefile               |  1 -
>   13 files changed, 18 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/cgroup/Makefile b/tools/cgroup/Makefile
> index 860fa151640a..ffca068e4a76 100644
> --- a/tools/cgroup/Makefile
> +++ b/tools/cgroup/Makefile
> @@ -1,7 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for cgroup tools
>   
> -CC = $(CROSS_COMPILE)gcc
>   CFLAGS = -Wall -Wextra
>   
>   all: cgroup_event_listener
> diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> index 805a2c0cf4cd..240eda014b37 100644
> --- a/tools/gpio/Makefile
> +++ b/tools/gpio/Makefile
> @@ -12,8 +12,6 @@ endif
>   # (this improves performance and avoids hard-to-debug behaviour);
>   MAKEFLAGS += -r
>   
> -CC = $(CROSS_COMPILE)gcc
> -LD = $(CROSS_COMPILE)ld
>   CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>   
>   ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon
> diff --git a/tools/hv/Makefile b/tools/hv/Makefile
> index 31503819454d..68c2d7b059b3 100644
> --- a/tools/hv/Makefile
> +++ b/tools/hv/Makefile
> @@ -1,7 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for Hyper-V tools
>   
> -CC = $(CROSS_COMPILE)gcc
>   WARNINGS = -Wall -Wextra
>   CFLAGS = $(WARNINGS) -g $(shell getconf LFS_CFLAGS)
>   
> diff --git a/tools/iio/Makefile b/tools/iio/Makefile
> index a08e7a47d6a3..332ed2f6c2c2 100644
> --- a/tools/iio/Makefile
> +++ b/tools/iio/Makefile
> @@ -12,8 +12,6 @@ endif
>   # (this improves performance and avoids hard-to-debug behaviour);
>   MAKEFLAGS += -r
>   
> -CC = $(CROSS_COMPILE)gcc
> -LD = $(CROSS_COMPILE)ld
>   CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>   
>   ALL_TARGETS := iio_event_monitor lsiio iio_generic_buffer
> diff --git a/tools/laptop/freefall/Makefile b/tools/laptop/freefall/Makefile
> index 5f758c489a20..b572d94255f6 100644
> --- a/tools/laptop/freefall/Makefile
> +++ b/tools/laptop/freefall/Makefile
> @@ -2,7 +2,6 @@
>   PREFIX ?= /usr
>   SBINDIR ?= sbin
>   INSTALL ?= install
> -CC = $(CROSS_COMPILE)gcc
>   
>   TARGET = freefall
>   
> diff --git a/tools/leds/Makefile b/tools/leds/Makefile
> index c379af003807..7b6bed13daaa 100644
> --- a/tools/leds/Makefile
> +++ b/tools/leds/Makefile
> @@ -1,7 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for LEDs tools
>   
> -CC = $(CROSS_COMPILE)gcc
>   CFLAGS = -Wall -Wextra -g -I../../include/uapi
>   
>   all: uledmon led_hw_brightness_mon
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 68cf1360a3f3..3035ce5f6b36 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -144,12 +144,6 @@ define allow-override
>       $(eval $(1) = $(2)))
>   endef
>   
> -# Allow setting CC and AR and LD, or setting CROSS_COMPILE as a prefix.
> -$(call allow-override,CC,$(CROSS_COMPILE)gcc)
> -$(call allow-override,AR,$(CROSS_COMPILE)ar)
> -$(call allow-override,LD,$(CROSS_COMPILE)ld)
> -$(call allow-override,CXX,$(CROSS_COMPILE)g++)
> -
>   LD += $(EXTRA_LDFLAGS)
>   
>   HOSTCC  ?= gcc
> diff --git a/tools/power/acpi/Makefile.config b/tools/power/acpi/Makefile.config
> index a1883bbb0144..2cccbba64418 100644
> --- a/tools/power/acpi/Makefile.config
> +++ b/tools/power/acpi/Makefile.config
> @@ -56,9 +56,6 @@ INSTALL_SCRIPT = ${INSTALL_PROGRAM}
>   # to compile vs uClibc, that can be done here as well.
>   CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
>   CROSS_COMPILE ?= $(CROSS)
> -CC = $(CROSS_COMPILE)gcc
> -LD = $(CROSS_COMPILE)gcc
> -STRIP = $(CROSS_COMPILE)strip
>   HOSTCC = gcc
>   
>   # check if compiler option is supported
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
> index 3fab179b1aba..09b2d0f07f66 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -42,6 +42,24 @@ EXTRA_WARNINGS += -Wformat
>   
>   CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
>   
> +# Makefiles suck: This macro sets a default value of $(2) for the
> +# variable named by $(1), unless the variable has been set by
> +# environment or command line. This is necessary for CC and AR
> +# because make sets default values, so the simpler ?= approach
> +# won't work as expected.
> +define allow-override
> +  $(if $(or $(findstring environment,$(origin $(1))),\
> +            $(findstring command line,$(origin $(1)))),,\
> +    $(eval $(1) = $(2)))
> +endef
> +
> +# Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
> +$(call allow-override,CC,$(CROSS_COMPILE)gcc)
> +$(call allow-override,AR,$(CROSS_COMPILE)ar)
> +$(call allow-override,LD,$(CROSS_COMPILE)ld)
> +$(call allow-override,CXX,$(CROSS_COMPILE)g++)
> +$(call allow-override,CXX,$(CROSS_COMPILE)strip)
> +
>   ifeq ($(CC_NO_CLANG), 1)
>   EXTRA_WARNINGS += -Wstrict-aliasing=3
>   endif
> diff --git a/tools/spi/Makefile b/tools/spi/Makefile
> index 90615e10c79a..815d15589177 100644
> --- a/tools/spi/Makefile
> +++ b/tools/spi/Makefile
> @@ -11,8 +11,6 @@ endif
>   # (this improves performance and avoids hard-to-debug behaviour);
>   MAKEFLAGS += -r
>   
> -CC = $(CROSS_COMPILE)gcc
> -LD = $(CROSS_COMPILE)ld
>   CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>   
>   ALL_TARGETS := spidev_test spidev_fdx
> diff --git a/tools/usb/Makefile b/tools/usb/Makefile
> index 4e6506078494..01d758d73b6d 100644
> --- a/tools/usb/Makefile
> +++ b/tools/usb/Makefile
> @@ -1,7 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for USB tools
>   
> -CC = $(CROSS_COMPILE)gcc
>   PTHREAD_LIBS = -lpthread
>   WARNINGS = -Wall -Wextra
>   CFLAGS = $(WARNINGS) -g -I../include
> diff --git a/tools/vm/Makefile b/tools/vm/Makefile
> index be320b905ea7..20f6cf04377f 100644
> --- a/tools/vm/Makefile
> +++ b/tools/vm/Makefile
> @@ -6,7 +6,6 @@ TARGETS=page-types slabinfo page_owner_sort
>   LIB_DIR = ../lib/api
>   LIBS = $(LIB_DIR)/libapi.a
>   
> -CC = $(CROSS_COMPILE)gcc
>   CFLAGS = -Wall -Wextra -I../lib/
>   LDFLAGS = $(LIBS)
>   
> diff --git a/tools/wmi/Makefile b/tools/wmi/Makefile
> index e664f1167388..e0e87239126b 100644
> --- a/tools/wmi/Makefile
> +++ b/tools/wmi/Makefile
> @@ -2,7 +2,6 @@ PREFIX ?= /usr
>   SBINDIR ?= sbin
>   INSTALL ?= install
>   CFLAGS += -D__EXPORTED_HEADERS__ -I../../include/uapi -I../../include
> -CC = $(CROSS_COMPILE)gcc
>   
>   TARGET = dell-smbios-example
>   
> 
+linux-kbuild
