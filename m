Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36695 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbeLGL35 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Dec 2018 06:29:57 -0500
MIME-Version: 1.0
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com> <19c7bdab-8df8-f7c6-7921-9a4d43dbca64@monstr.eu>
In-Reply-To: <19c7bdab-8df8-f7c6-7921-9a4d43dbca64@monstr.eu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 7 Dec 2018 20:29:11 +0900
Message-ID: <CAK7LNATWSNqZ8uE+teMW+uvDCLXfq6zMTqh_7=ssrPquCLJz8A@mail.gmail.com>
Subject: Re: [PATCH 0/7] microblaze: fix various problems in building boot images
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>

On Thu, Dec 6, 2018 at 11:55 PM Michal Simek <monstr@monstr.eu> wrote:
>
> On 03. 12. 18 8:50, Masahiro Yamada wrote:
> > This patch set fixes various issues in microblaze Makefiles.
> >
> > BTW, "simpleImage.<dt>" works like a phony target to generate the
> > following four images, where the first three are just aliases.
> >
> >  - arch/microblaze/boot/simpleImage.<dt>:
> >          identical to arch/microblaze/boot/linux.bin
> >
> >  - arch/microblaze/boot/simpleImage.<dt>.unstrip:
> >          identical to vmlinux
> >
> >  - arch/microblaze/boot/simpleImage.<dt>.ub:
> >          identical to arch/microblaze/boot/linux.bin.ub
> >
> >  - arch/microblaze/boot/simpleImage.<dt>.strip:
> >          stripped vmlinux
> >
> > I am not sure how much useful those copies are,
> > but, I tried my best to keep the same behavior.
> >
> > IMHO, I guess DTB=<dt> would be more sensible,
> > but it is up to Michal.
> >
> >
> >
> > Masahiro Yamada (7):
> >   microblaze: fix cleaning of boot images
> >   microblaze: adjust the help to the real behavior
> >   microblaze: move "... is ready" message to arch/microblaze/Makefile
> >   microblaze: fix multiple bugs in arch/microblaze/boot/Makefile
> >   microblaze: add linux.bin* and simpleImage.* to PHONY
> >   microblaze: fix race condition in building boot images
> >   microblaze: remove the unneeded code just in case file copy fails
> >
> >  arch/microblaze/Makefile          | 14 +++++++++-----
> >  arch/microblaze/boot/Makefile     | 33 +++++++++++++++++----------------
> >  arch/microblaze/boot/dts/Makefile |  5 +----
> >  3 files changed, 27 insertions(+), 25 deletions(-)
> >
>
> One more thing I have in my mind for a while is that will be good to
> configure kernel build flags from DT and completely get rid of these
> symbols.
>
> XILINX_MICROBLAZE0_USE_MSR_INSTR
> XILINX_MICROBLAZE0_USE_PCMP_INSTR
> XILINX_MICROBLAZE0_USE_BARREL
> XILINX_MICROBLAZE0_USE_DIV
> XILINX_MICROBLAZE0_USE_HW_MUL
> XILINX_MICROBLAZE0_USE_FPU
>
> It means setup CPUFLAGS based on extracting that values from DT that it
> all the time match the hardware.
> It will also simplify all the CPUFLAGS logic which is in
> arch/microblaze/Makefile.
>
> Do you have any idea how this can be done?


I have no idea.

Parsing DTS with sed or something would be possible, but ugly.

In my opinion, the kernel should be multi platform image,
in other words, it is the least common denominator
of supported platforms.

So, the kernel should enable all features that may or may not be used
depending on platform.

I do not know if this works for MB.


-- 
Best Regards
Masahiro Yamada
