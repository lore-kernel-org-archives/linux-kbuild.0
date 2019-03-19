Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:39780 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbfCSEFw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Mar 2019 00:05:52 -0400
MIME-Version: 1.0
References: <23500.1552920217@warthog.procyon.org.uk>
In-Reply-To: <23500.1552920217@warthog.procyon.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Mar 2019 13:05:05 +0900
Message-ID: <CAK7LNAS4zVusQRQLFNmmza9U_zbNBrjyx4qyDcH8g1oL0AzHTQ@mail.gmail.com>
Subject: Re: Commit seems to prevent use of GNUmakefile wrappers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Manoj Srivastava <srivasta@debian.org>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,


On Mon, Mar 18, 2019 at 11:43 PM David Howells <dhowells@redhat.com> wrote:
>
> Hi Mashiro,
>
>         commit 2b50f7ab63685cd247e32ad321f7338ed130d3d5
>         Author: Masahiro Yamada <yamada.masahiro@socionext.com>
>         kbuild: add workaround for Debian make-kpkg
>
> seems to prevent the use of GNUmakefile wrappers to set the ARCH and
> CROSS_COMPILE make variables.  With this commit, I now see:
>
>         make: Entering directory '/data/fs/linux-fs'
>         Makefile:39: Do not include top Makefile of Linux Kernel
>         ***
>         *** Configuration file ".config" not found!
>         ***
>         *** Please run some configurator (e.g. "make oldconfig" or
>         *** "make menuconfig" or "make xconfig").
>         ***
>         Makefile:605: include/config/auto.conf: No such file or directory
>         make: *** No rule to make target '.config', needed by 'include/config/auto.conf'.  Stop.
>         make: Leaving directory '/data/fs/linux-fs'
>
> Do you have a suggestion as to how to work around this?  Here's a sample
> GNUmakefile content:
>
>         CROSS_COMPILE   := x86_64-linux-gnu-
>         ARCH            := x86_64
>         MFLAGS          += CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH)
>         export CROSS_COMPILE
>         export ARCH
>         include Makefile


I think the following will work.
(code was taken from scripts/mkmakefile)



------------------(GNUmakefile BEGIN)-------------------
CROSS_COMPILE   := x86_64-linux-gnu-
ARCH            := x86_64
MFLAGS          += CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH)
export CROSS_COMPILE
export ARCH

ifeq ("$(origin V)", "command line")
VERBOSE := $(V)
endif
ifneq ($(VERBOSE),1)
Q := @
endif

MAKEFLAGS += --no-print-directory

.PHONY: __sub-make $(MAKECMDGOALS)

__sub-make:
        $(Q)$(MAKE) -f Makefile $(MAKECMDGOALS)

$(filter-out __sub-make, $(MAKECMDGOALS)): __sub-make
        @:
------------------(GNUmakefile END)-------------------



Having said that, the previous cheesy workaround sucks.

How about this patch?
https://patchwork.kernel.org/patch/10858809/

I hope you will be able to wrap the top Makefile again.


--
Best Regards
Masahiro Yamada
