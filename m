Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:42673 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbeHWFVx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 01:21:53 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w7N1sSBu004894
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Aug 2018 10:54:29 +0900
Received: by mail-ua1-f45.google.com with SMTP id c12-v6so2283767uan.3
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Aug 2018 18:54:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEp-SHUdZy32X8sE68kYXwPz+xx7hwjMdAD04_zATudAhn+MYQ@mail.gmail.com>
References: <CAEp-SHUdZy32X8sE68kYXwPz+xx7hwjMdAD04_zATudAhn+MYQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Aug 2018 10:53:47 +0900
Message-ID: <CAK7LNAQJraYp8CJ7_=HZXgoGxh2qdycPjD9V9gpyBE_mmNH1zw@mail.gmail.com>
Subject: Re: Bug: Unnecessary, repeated, and inconsistent work done when
 rebuilding bzImage
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Casey Fitzpatrick <kcghost@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Casey,

2018-08-23 8:21 GMT+09:00 Casey Fitzpatrick <kcghost@gmail.com>:
> I have observed that attempting to rebuild the kernel with no changes
> to source files:
> 1. Takes more time than I should hope is necessary; I would hope it
> would only check timestamps and determine the target does not need
> updating rather than do work.
> 2. Switches between two states of determining what work is needed to do.
> 3. Unnecessarily updates timestamp on bzImage (and maybe others)
> despite not actually modifying the file.
>
> I am working with v4.14.66 building from an Ubuntu 17.10 machine.
> The following summarized output demonstrates the issue (I believe the
> same happens with the default target).
> Notice that despite no changes made to sources, a rebuild takes 3
> seconds on my machine, does some work and typically updates the
> timestamp of the target.
> Also notice that the work is oddly inconsistent, the third time I ran
> the same build with no changes it did different work. And in that case
> it does not update the timestamp of the target, which is preferable.
>
> make distclean
> make x86_64_defconfig
> time make -j16 bzImage
>     ...(lots of output, actually building all the sources)
>       OBJCOPY arch/x86/boot/setup.bin
>       BUILD   arch/x86/boot/bzImage
>     Setup is 15548 bytes (padded to 15872 bytes).
>     System is 7789 kB
>     CRC 5b2b5059
>     Kernel: arch/x86/boot/bzImage is ready  (#1)
>
>     real    4m15.147s
>     user    27m21.182s
>     sys 2m34.607s
> stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
>     mtime: 2018-08-22 18:57:10.000000000 -0400
> time make -j16 bzImage
>       CHK     include/config/kernel.release
>       CHK     include/generated/uapi/linux/version.h
>       DESCEND  objtool
>       CHK     scripts/mod/devicetable-offsets.h
>       CHK     include/generated/utsrelease.h
>       CHK     include/generated/timeconst.h
>       CHK     include/generated/bounds.h
>       CHK     include/generated/asm-offsets.h
>       CALL    scripts/checksyscalls.sh
>       CHK     include/generated/compile.h
>       DATAREL arch/x86/boot/compressed/vmlinux
>       BUILD   arch/x86/boot/bzImage
>     Setup is 15548 bytes (padded to 15872 bytes).
>     System is 7789 kB
>     CRC 5b2b5059
>     Kernel: arch/x86/boot/bzImage is ready  (#1)
>
>     real    0m3.273s
>     user    0m11.260s
>     sys 0m4.727s
> stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
>     mtime: 2018-08-22 19:00:26.587233951 -0400
> time make -j16 bzImage
>       CHK     include/config/kernel.release
>       CHK     include/generated/uapi/linux/version.h
>       DESCEND  objtool
>       CHK     include/generated/utsrelease.h
>       CHK     scripts/mod/devicetable-offsets.h
>       CHK     include/generated/timeconst.h
>       CHK     include/generated/bounds.h
>       CHK     include/generated/asm-offsets.h
>       CALL    scripts/checksyscalls.sh
>       CHK     include/generated/compile.h
>       LD      arch/x86/boot/compressed/vmlinux
>       ZOFFSET arch/x86/boot/zoffset.h
>       OBJCOPY arch/x86/boot/vmlinux.bin
>       AS      arch/x86/boot/header.o
>       LD      arch/x86/boot/setup.elf
>       OBJCOPY arch/x86/boot/setup.bin
>       BUILD   arch/x86/boot/bzImage
>     Setup is 15548 bytes (padded to 15872 bytes).
>     System is 7789 kB
>     CRC 5b2b5059
>     Kernel: arch/x86/boot/bzImage is ready  (#1)
>
>     real    0m3.136s
>     user    0m11.411s
>     sys 0m4.775s
> stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
>     mtime: 2018-08-22 19:01:11.583377706 -0400
> time make -j16 bzImage
>       CHK     include/config/kernel.release
>       CHK     include/generated/uapi/linux/version.h
>       DESCEND  objtool
>       CHK     include/generated/utsrelease.h
>       CHK     scripts/mod/devicetable-offsets.h
>       CHK     include/generated/timeconst.h
>       CHK     include/generated/bounds.h
>       CHK     include/generated/asm-offsets.h
>       CALL    scripts/checksyscalls.sh
>       CHK     include/generated/compile.h
>       DATAREL arch/x86/boot/compressed/vmlinux
>     Kernel: arch/x86/boot/bzImage is ready  (#1)
>
>     real    0m3.118s
>     user    0m11.476s
>     sys 0m4.505s
> stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
>     mtime: 2018-08-22 19:01:11.583377706 -0400
>
> Sincerely,
> Casey Fitzpatrick



Could you check if the following commit fixes the problem?


commit 92a4728608a8fd228c572bc8ff50dd98aa0ddf2a
Author: Kees Cook <keescook@chromium.org>
Date:   Tue Jul 24 16:08:27 2018 -0700

    x86/boot: Fix if_changed build flip/flop bug




I am not sure whether it was back-ported to 4.14 kernel or not...






-- 
Best Regards
Masahiro Yamada
