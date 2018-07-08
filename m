Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:19283 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754466AbeGHCbg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Jul 2018 22:31:36 -0400
MIME-Version: 1.0
In-Reply-To: <20180707010709.16648-4-labbott@redhat.com>
References: <20180707010709.16648-1-labbott@redhat.com> <20180707010709.16648-4-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 8 Jul 2018 11:30:26 +0900
Message-ID: <CAK7LNARqe2x1_C1Np0L0_rh4LUtb72Og1UkoM-_f6qaz1P4cxw@mail.gmail.com>
Subject: Re: [PATCH 3/7] treewide: Rename HOSTCFLAGS -> KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>

2018-07-07 10:07 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> In preparation for enabling command line CFLAGS, re-name HOSTCFLAGS to
> KBUILD_HOSTCFLAGS as the internal use only flags. This should not have any
> visible effects.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
>  Makefile                   |  4 ++--
>  arch/alpha/boot/Makefile   |  2 +-
>  arch/s390/tools/Makefile   |  4 ++--
>  arch/x86/tools/Makefile    |  4 ++--
>  net/bpfilter/Makefile      |  2 +-
>  samples/bpf/Makefile       | 26 +++++++++++++-------------
>  samples/connector/Makefile |  2 +-
>  samples/hidraw/Makefile    |  2 +-
>  samples/seccomp/Makefile   | 24 ++++++++++++------------
>  samples/statx/Makefile     |  2 +-
>  samples/uhid/Makefile      |  2 +-
>  scripts/Kbuild.include     |  2 +-
>  scripts/Makefile           |  4 ++--
>  scripts/Makefile.host      |  4 ++--
>  scripts/dtc/Makefile       | 24 ++++++++++++------------
>  scripts/genksyms/Makefile  |  4 ++--
>  scripts/kconfig/Makefile   | 12 ++++++------
>  tools/build/Build.include  |  2 +-
>  tools/objtool/Makefile     |  2 +-
>  19 files changed, 64 insertions(+), 64 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d15ac32afbaf..16cab22b1f40 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -359,7 +359,7 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
>
>  HOSTCC       = gcc
>  HOSTCXX      = g++
> -HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
> +KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
>                 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
>  HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
>  HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
> @@ -429,7 +429,7 @@ KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
>  LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>
> -export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
> +export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
>  export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
>  export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
> diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
> index 0cbe4c59d3ce..dfccf0195306 100644
> --- a/arch/alpha/boot/Makefile
> +++ b/arch/alpha/boot/Makefile
> @@ -14,7 +14,7 @@ targets               := vmlinux.gz vmlinux \
>                    tools/bootpzh bootloader bootpheader bootpzheader
>  OBJSTRIP       := $(obj)/tools/objstrip
>
> -HOSTCFLAGS     := -Wall -I$(objtree)/usr/include
> +KBUILD_HOSTCFLAGS      := -Wall -I$(objtree)/usr/include
>  BOOTCFLAGS     += -I$(objtree)/$(obj) -I$(srctree)/$(obj)
>
>  # SRM bootable image.  Copy to offset 512 of a partition.
> diff --git a/arch/s390/tools/Makefile b/arch/s390/tools/Makefile
> index 48cdac1143a9..40afcebf4e67 100644
> --- a/arch/s390/tools/Makefile
> +++ b/arch/s390/tools/Makefile
> @@ -14,8 +14,8 @@ kapi: $(kapi-hdrs-y)
>  hostprogs-y                += gen_facilities
>  hostprogs-y                += gen_opcode_table
>
> -HOSTCFLAGS_gen_facilities.o += -Wall $(LINUXINCLUDE)
> -HOSTCFLAGS_gen_opcode_table.o += -Wall $(LINUXINCLUDE)
> +KBUILD_HOSTCFLAGS_gen_facilities.o += -Wall $(LINUXINCLUDE)
> +KBUILD_HOSTCFLAGS_gen_opcode_table.o += -Wall $(LINUXINCLUDE)


No.
Please keep HOSTCFLAGS_<file>.o as-is.




-- 
Best Regards
Masahiro Yamada
