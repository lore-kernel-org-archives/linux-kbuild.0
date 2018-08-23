Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:38540 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbeHWPoS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 11:44:18 -0400
Received: by mail-io0-f194.google.com with SMTP id y3-v6so4096604ioc.5
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Aug 2018 05:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAEp-SHUdZy32X8sE68kYXwPz+xx7hwjMdAD04_zATudAhn+MYQ@mail.gmail.com>
 <CAK7LNAQJraYp8CJ7_=HZXgoGxh2qdycPjD9V9gpyBE_mmNH1zw@mail.gmail.com>
In-Reply-To: <CAK7LNAQJraYp8CJ7_=HZXgoGxh2qdycPjD9V9gpyBE_mmNH1zw@mail.gmail.com>
From: Casey Fitzpatrick <kcghost@gmail.com>
Date: Thu, 23 Aug 2018 08:14:28 -0400
Message-ID: <CAEp-SHWZbO6wGMSTh7VbbQfS2vsC57914LDHExOv-M_s29m0Xg@mail.gmail.com>
Subject: Re: Bug: Unnecessary, repeated, and inconsistent work done when
 rebuilding bzImage
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org

Masahiro,

Thanks, I was not aware of that patch. That does fix the issue for the
most part. A rebuild now consistently does the same work, and does not
unnecessarily update the timestamp of bzImage as before. It still
takes 3 seconds, but maybe that is necessary? I don't know exactly
what it is doing there.

time make -j16 bzImage
      CHK     include/config/kernel.release
      CHK     include/generated/uapi/linux/version.h
      DESCEND  objtool
      CHK     include/generated/utsrelease.h
      CHK     scripts/mod/devicetable-offsets.h
      CHK     include/generated/timeconst.h
      CHK     include/generated/bounds.h
      CHK     include/generated/asm-offsets.h
      CALL    scripts/checksyscalls.sh
      CHK     include/generated/compile.h
    Kernel: arch/x86/boot/bzImage is ready  (#1)

    real    0m3.027s
    user    0m11.183s
    sys 0m4.755s
stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
    mtime: 2018-08-23 08:04:55.551644635 -0400
time make -j16 bzImage
      CHK     include/config/kernel.release
      CHK     include/generated/uapi/linux/version.h
      DESCEND  objtool
      CHK     include/generated/utsrelease.h
      CHK     scripts/mod/devicetable-offsets.h
      CHK     include/generated/timeconst.h
      CHK     include/generated/bounds.h
      CHK     include/generated/asm-offsets.h
      CALL    scripts/checksyscalls.sh
      CHK     include/generated/compile.h
    Kernel: arch/x86/boot/bzImage is ready  (#1)

    real    0m2.966s
    user    0m10.917s
    sys 0m4.834s
stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
    mtime: 2018-08-23 08:04:55.551644635 -0400
time make -j16 bzImage
      CHK     include/config/kernel.release
      CHK     include/generated/uapi/linux/version.h
      DESCEND  objtool
      CHK     include/generated/utsrelease.h
      CHK     scripts/mod/devicetable-offsets.h
      CHK     include/generated/timeconst.h
      CHK     include/generated/bounds.h
      CHK     include/generated/asm-offsets.h
      CALL    scripts/checksyscalls.sh
      CHK     include/generated/compile.h
    Kernel: arch/x86/boot/bzImage is ready  (#1)

    real    0m2.954s
    user    0m11.151s
    sys 0m4.734s
stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
    mtime: 2018-08-23 08:04:55.551644635 -0400

Sincerely,
Casey Fitzpatrick
On Wed, Aug 22, 2018 at 9:54 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Casey,
>
> 2018-08-23 8:21 GMT+09:00 Casey Fitzpatrick <kcghost@gmail.com>:
> > I have observed that attempting to rebuild the kernel with no changes
> > to source files:
> > 1. Takes more time than I should hope is necessary; I would hope it
> > would only check timestamps and determine the target does not need
> > updating rather than do work.
> > 2. Switches between two states of determining what work is needed to do.
> > 3. Unnecessarily updates timestamp on bzImage (and maybe others)
> > despite not actually modifying the file.
> >
> > I am working with v4.14.66 building from an Ubuntu 17.10 machine.
> > The following summarized output demonstrates the issue (I believe the
> > same happens with the default target).
> > Notice that despite no changes made to sources, a rebuild takes 3
> > seconds on my machine, does some work and typically updates the
> > timestamp of the target.
> > Also notice that the work is oddly inconsistent, the third time I ran
> > the same build with no changes it did different work. And in that case
> > it does not update the timestamp of the target, which is preferable.
> >
> > make distclean
> > make x86_64_defconfig
> > time make -j16 bzImage
> >     ...(lots of output, actually building all the sources)
> >       OBJCOPY arch/x86/boot/setup.bin
> >       BUILD   arch/x86/boot/bzImage
> >     Setup is 15548 bytes (padded to 15872 bytes).
> >     System is 7789 kB
> >     CRC 5b2b5059
> >     Kernel: arch/x86/boot/bzImage is ready  (#1)
> >
> >     real    4m15.147s
> >     user    27m21.182s
> >     sys 2m34.607s
> > stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
> >     mtime: 2018-08-22 18:57:10.000000000 -0400
> > time make -j16 bzImage
> >       CHK     include/config/kernel.release
> >       CHK     include/generated/uapi/linux/version.h
> >       DESCEND  objtool
> >       CHK     scripts/mod/devicetable-offsets.h
> >       CHK     include/generated/utsrelease.h
> >       CHK     include/generated/timeconst.h
> >       CHK     include/generated/bounds.h
> >       CHK     include/generated/asm-offsets.h
> >       CALL    scripts/checksyscalls.sh
> >       CHK     include/generated/compile.h
> >       DATAREL arch/x86/boot/compressed/vmlinux
> >       BUILD   arch/x86/boot/bzImage
> >     Setup is 15548 bytes (padded to 15872 bytes).
> >     System is 7789 kB
> >     CRC 5b2b5059
> >     Kernel: arch/x86/boot/bzImage is ready  (#1)
> >
> >     real    0m3.273s
> >     user    0m11.260s
> >     sys 0m4.727s
> > stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
> >     mtime: 2018-08-22 19:00:26.587233951 -0400
> > time make -j16 bzImage
> >       CHK     include/config/kernel.release
> >       CHK     include/generated/uapi/linux/version.h
> >       DESCEND  objtool
> >       CHK     include/generated/utsrelease.h
> >       CHK     scripts/mod/devicetable-offsets.h
> >       CHK     include/generated/timeconst.h
> >       CHK     include/generated/bounds.h
> >       CHK     include/generated/asm-offsets.h
> >       CALL    scripts/checksyscalls.sh
> >       CHK     include/generated/compile.h
> >       LD      arch/x86/boot/compressed/vmlinux
> >       ZOFFSET arch/x86/boot/zoffset.h
> >       OBJCOPY arch/x86/boot/vmlinux.bin
> >       AS      arch/x86/boot/header.o
> >       LD      arch/x86/boot/setup.elf
> >       OBJCOPY arch/x86/boot/setup.bin
> >       BUILD   arch/x86/boot/bzImage
> >     Setup is 15548 bytes (padded to 15872 bytes).
> >     System is 7789 kB
> >     CRC 5b2b5059
> >     Kernel: arch/x86/boot/bzImage is ready  (#1)
> >
> >     real    0m3.136s
> >     user    0m11.411s
> >     sys 0m4.775s
> > stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
> >     mtime: 2018-08-22 19:01:11.583377706 -0400
> > time make -j16 bzImage
> >       CHK     include/config/kernel.release
> >       CHK     include/generated/uapi/linux/version.h
> >       DESCEND  objtool
> >       CHK     include/generated/utsrelease.h
> >       CHK     scripts/mod/devicetable-offsets.h
> >       CHK     include/generated/timeconst.h
> >       CHK     include/generated/bounds.h
> >       CHK     include/generated/asm-offsets.h
> >       CALL    scripts/checksyscalls.sh
> >       CHK     include/generated/compile.h
> >       DATAREL arch/x86/boot/compressed/vmlinux
> >     Kernel: arch/x86/boot/bzImage is ready  (#1)
> >
> >     real    0m3.118s
> >     user    0m11.476s
> >     sys 0m4.505s
> > stat --printf 'mtime: %y\n' arch/x86/boot/bzImage
> >     mtime: 2018-08-22 19:01:11.583377706 -0400
> >
> > Sincerely,
> > Casey Fitzpatrick
>
>
>
> Could you check if the following commit fixes the problem?
>
>
> commit 92a4728608a8fd228c572bc8ff50dd98aa0ddf2a
> Author: Kees Cook <keescook@chromium.org>
> Date:   Tue Jul 24 16:08:27 2018 -0700
>
>     x86/boot: Fix if_changed build flip/flop bug
>
>
>
>
> I am not sure whether it was back-ported to 4.14 kernel or not...
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
