Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17092 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbeLFFJm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Dec 2018 00:09:42 -0500
MIME-Version: 1.0
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com> <dd726c23-7c37-2b38-5b9f-a4edc391511d@monstr.eu>
In-Reply-To: <dd726c23-7c37-2b38-5b9f-a4edc391511d@monstr.eu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 6 Dec 2018 14:08:48 +0900
Message-ID: <CAK7LNARtiP2xnB3hK92QJ_GadnViCG7kxXW73RmjzQAxJM4GKQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot images
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

Hi Michal,

On Thu, Dec 6, 2018 at 1:41 AM Michal Simek <monstr@monstr.eu> wrote:
>
> On 03. 12. 18 8:50, Masahiro Yamada wrote:
> > This patch set fixes various issues in microblaze Makefiles.
> >
> > BTW, "simpleImage.<dt>" works like a phony target to generate the
> > following four images, where the first three are just aliases.
> >
> >  - arch/microblaze/boot/simpleImage.<dt>:
> >          identical to arch/microblaze/boot/linux.bin
>
> It is not - fdt section should be empty.
> simpleImage has this section filled.
>
> >
> >  - arch/microblaze/boot/simpleImage.<dt>.unstrip:
> >          identical to vmlinux
>
> The same here with filled section.


vmlinux is built anyway
for whatever target you are building.

What is the point of making a copy of vmlinux?
They are the same.
You can confirm it by 'diff'

$ export CROSS_COMPILE=microblaze-linux-
$ make ARCH=microblaze  defconfig
$ make -j8 ARCH=microblaze   simpleImage.system
$ diff arch/microblaze/boot/simpleImage.system.unstrip  vmlinux






> >
> >  - arch/microblaze/boot/simpleImage.<dt>.ub:
> >          identical to arch/microblaze/boot/linux.bin.ub
>
> as above.
>
> >
> >  - arch/microblaze/boot/simpleImage.<dt>.strip:
> >          stripped vmlinux
>
> And this is there because unstrip version is quite huge and for early
> issues you need to know only some symbols that's why debugger is not
> overflow with stuff which none needs.
> Maybe this is not an issue now but that strip version is used a lot.
>
>
> >
> > I am not sure how much useful those copies are,
> > but, I tried my best to keep the same behavior.
> >
> > IMHO, I guess DTB=<dt> would be more sensible,
> > but it is up to Michal.
>
> What do you mean by this exactly?


As I showed above,
arch/microblaze/boot/simpleImage.system.unstrip
is exactly the same as vmlinux.



arch/microblaze/boot/simpleImage.<dt>
is objcopy'ed binary of vmlinux.

arch/microblaze/boot/simpleImage.<dt>.ub
is objcopy'ed binary of vmlinux, with u-boot header prepended.

You have already build-rules for them.



It is true that the stripped image only exist in simpleImage,
but I think "arch/microblaze/boot/vmlinux.strip"
is a more sensible name.



What I want to point out is:
    "Which file should be compiled in",
    is a part of the configuration.
    We generally do not change the final
    target name just for the difference of
    configuration.
    For example, ARM just uses "vmlinux", "Image", "zImage", etc.
    Never duplicate target-specific copies depending on configuration.


Why does microblaze create copies for each DT
instead of using generic image like linux.bin, linux.bin.ub, etc. ?

If using generic image names is acceptable,
"make simpleImage.<dt>" is just a shorthand of
"make DTB=<dt> vmlinux linux.bin linux.bin.ub vmlinux.strip"


Only the benefit of this approach is,
you can keep all images for multiple boards at the same time.

$ make ARCH=microblaze simpleImage.board1
$ make ARCH=microblaze simpleImage.board2
$ make ARCH=microblaze simpleImage.board3




Since I do not know how many users rely on this usage,
I said "it is up to you".









> Definitely thanks for looking at this.
> Michal
>
>
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Xilinx Microblaze
> Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
> U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
>
>


-- 
Best Regards
Masahiro Yamada
