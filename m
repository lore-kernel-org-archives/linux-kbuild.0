Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:59113 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbgCVSu2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Mar 2020 14:50:28 -0400
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 22 Mar 2020 12:50:13 -0600
Message-ID: <CAHmME9ptzBzzn+jOo=azZagB=TTFbc2vzdcYurfsE0_1nvKF+g@mail.gmail.com>
Subject: using libbpf in external projects
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: bpf@vger.kernel.org
Cc: nicolas@serveur.io, linux-kbuild@vger.kernel.org

Hi,

Nicolas (CC'd) and I are working on a small utility that does some bpf
things. What it actually does isn't important. But I did just clean up
its use of libbpf by way of a Makefile:

> KERNEL_VERSION := 5.5.11
> PKG_CONFIG ?= pkg-config
>
> all: linux-$(KERNEL_VERSION)/.prepared
>     @$(MAKE) --no-print-directory netifexec
>
> linux-$(KERNEL_VERSION)/.prepared:
>     curl https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$(KERNEL_VERSION).tar.xz | tar xJf -
>     touch $@
>
> CFLAGS ?= -O3
> CFLAGS += -Ilinux-$(KERNEL_VERSION)/tools/lib/bpf -Ilinux-$(KERNEL_VERSION)/tools/include -Ilinux-$(KERNEL_VERSION)/tools/include/uapi
> CFLAGS += -DHAVE_LIBELF_MMAP_SUPPORT
> CFLAGS += -MMD -MP
> CFLAGS += -std=gnu99 -D_GNU_SOURCE
> CFLAGS += -Wall
> CFLAGS += $(shell $(PKG_CONFIG) --cflags libelf zlib)
> LDLIBS += $(shell $(PKG_CONFIG) --libs libelf zlib)
>
> netifexec: $(sort $(patsubst %.c,%.o,$(wildcard *.c linux-$(KERNEL_VERSION)/tools/lib/bpf/*.c)))
>
> clean:
>     $(RM) netifexec *.o *.d linux-$(KERNEL_VERSION)/tools/lib/bpf/*.o linux-$(KERNEL_VERSION)/tools/lib/bpf/*.d
>
> mrproper: clean
>     $(RM) -r linux-$(KERNEL_VERSION)
>
> .PHONY: all clean mrproper

Ignoring that piping curl to tar with no hash checking is unsafe, is
this kind of embedding something you intended people would do to use
this code externally? Or is there another distribution of this library
from elsewhere that you'd recommend?

Jason
