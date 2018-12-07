Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47899 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbeLGLZq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Dec 2018 06:25:46 -0500
MIME-Version: 1.0
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <dd726c23-7c37-2b38-5b9f-a4edc391511d@monstr.eu> <CAK7LNARtiP2xnB3hK92QJ_GadnViCG7kxXW73RmjzQAxJM4GKQ@mail.gmail.com>
 <8dd96009-976b-99a5-c8e5-8a2242a04371@monstr.eu>
In-Reply-To: <8dd96009-976b-99a5-c8e5-8a2242a04371@monstr.eu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 7 Dec 2018 20:25:00 +0900
Message-ID: <CAK7LNASFuA+Jgt31NtcyCbFCO8PiVngLYaXK=3dn_ioErfOx=Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot images
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

On Thu, Dec 6, 2018 at 10:10 PM Michal Simek <monstr@monstr.eu> wrote:
>
> Hi,
>
> On 06. 12. 18 6:08, Masahiro Yamada wrote:
> > Hi Michal,
> >
> > On Thu, Dec 6, 2018 at 1:41 AM Michal Simek <monstr@monstr.eu> wrote:
> >>
> >> On 03. 12. 18 8:50, Masahiro Yamada wrote:
> >>> This patch set fixes various issues in microblaze Makefiles.
> >>>
> >>> BTW, "simpleImage.<dt>" works like a phony target to generate the
> >>> following four images, where the first three are just aliases.
> >>>
> >>>  - arch/microblaze/boot/simpleImage.<dt>:
> >>>          identical to arch/microblaze/boot/linux.bin
> >>
> >> It is not - fdt section should be empty.
> >> simpleImage has this section filled.
> >>
> >>>
> >>>  - arch/microblaze/boot/simpleImage.<dt>.unstrip:
> >>>          identical to vmlinux
> >>
> >> The same here with filled section.
> >
> >
> > vmlinux is built anyway
> > for whatever target you are building.
> >
> > What is the point of making a copy of vmlinux?
> > They are the same.
> > You can confirm it by 'diff'
> >
> > $ export CROSS_COMPILE=microblaze-linux-
> > $ make ARCH=microblaze  defconfig
> > $ make -j8 ARCH=microblaze   simpleImage.system
> > $ diff arch/microblaze/boot/simpleImage.system.unstrip  vmlinux
>
> I can't remember the reason for this. Maybe it was just a copy from
> PowerPC which started to use this simpleImage format in past and MB just
> copied it.
>
> >>>
> >>>  - arch/microblaze/boot/simpleImage.<dt>.ub:
> >>>          identical to arch/microblaze/boot/linux.bin.ub
> >>
> >> as above.
> >>
> >>>
> >>>  - arch/microblaze/boot/simpleImage.<dt>.strip:
> >>>          stripped vmlinux
> >>
> >> And this is there because unstrip version is quite huge and for early
> >> issues you need to know only some symbols that's why debugger is not
> >> overflow with stuff which none needs.
> >> Maybe this is not an issue now but that strip version is used a lot.
> >>
> >>
> >>>
> >>> I am not sure how much useful those copies are,
> >>> but, I tried my best to keep the same behavior.
> >>>
> >>> IMHO, I guess DTB=<dt> would be more sensible,
> >>> but it is up to Michal.
> >>
> >> What do you mean by this exactly?
> >
> >
> > As I showed above,
> > arch/microblaze/boot/simpleImage.system.unstrip
> > is exactly the same as vmlinux.
> >
> > arch/microblaze/boot/simpleImage.<dt>
> > is objcopy'ed binary of vmlinux.
> >
> > arch/microblaze/boot/simpleImage.<dt>.ub
> > is objcopy'ed binary of vmlinux, with u-boot header prepended.
> >
> > You have already build-rules for them.
> >
> >
> >
> > It is true that the stripped image only exist in simpleImage,
> > but I think "arch/microblaze/boot/vmlinux.strip"
> > is a more sensible name.
> >
> >
> >
> > What I want to point out is:
> >     "Which file should be compiled in",
> >     is a part of the configuration.
> >     We generally do not change the final
> >     target name just for the difference of
> >     configuration.
> >     For example, ARM just uses "vmlinux", "Image", "zImage", etc.
> >     Never duplicate target-specific copies depending on configuration.
> >
> >
> > Why does microblaze create copies for each DT
> > instead of using generic image like linux.bin, linux.bin.ub, etc. ?
> >
> > If using generic image names is acceptable,
> > "make simpleImage.<dt>" is just a shorthand of
> > "make DTB=<dt> vmlinux linux.bin linux.bin.ub vmlinux.strip"
> >
> >
> > Only the benefit of this approach is,
> > you can keep all images for multiple boards at the same time.
> >
> > $ make ARCH=microblaze simpleImage.board1
> > $ make ARCH=microblaze simpleImage.board2
> > $ make ARCH=microblaze simpleImage.board3
>
> yes that's one thing which came to my mind too.
>
> >
> >
> >
> >
> > Since I do not know how many users rely on this usage,
> > I said "it is up to you".
>
> One thing is what it is sensible and the second thing is historical
> connection to that names. Because Xilinx was having ppc405 and ppc440
> and microblaze as big endian architecture at that time was taking a lot
> of stuff from powerpc that's why we took also that targets just to be
> the same in distributions.
> PPC was using simpleImage format in the same way that's why we have
> adopted that too.
>
> Personally for me it is not a problem to remove that simpleImage format
> but I have no idea how many people rely on that.
>
> I can't see any problem not to generate/copy simpleImage.<dt>.unstrip
> version but I would keep the rest same as before just to make sure that
> we are not breaking anybody.


OK, let's keep all simpleImage images.


BTW, I noticed this series changed the behavior a bit.
"make simpleImage.<dt>" will overwrite linux.bin.ub
where linux.bin.ub should not contain built-in DT.

I will fix it just in case.


--
Best Regards
Masahiro Yamada
