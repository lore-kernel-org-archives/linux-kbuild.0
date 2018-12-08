Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41949 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbeLHGwU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Dec 2018 01:52:20 -0500
MIME-Version: 1.0
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-7-git-send-email-yamada.masahiro@socionext.com> <ccf309af-f225-2c12-cb2f-1d8787d2e4fa@monstr.eu>
In-Reply-To: <ccf309af-f225-2c12-cb2f-1d8787d2e4fa@monstr.eu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 8 Dec 2018 15:51:39 +0900
Message-ID: <CAK7LNASP4nifHrWRzUr2sHM=2ytg1fxi0=u4mLnTfrcbQc1U6g@mail.gmail.com>
Subject: Re: [PATCH 6/7] microblaze: fix race condition in building boot images
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Dec 6, 2018 at 1:32 AM Michal Simek <monstr@monstr.eu> wrote:
>
> On 03. 12. 18 8:50, Masahiro Yamada wrote:
> > I fixed a race condition in the parallel building of ARM in commit
> > 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> > generate invalid images").
> >
> > I see the same problem for MicroBlaze too.
> >
> > "make -j<N> ARCH=microblaze all linux.bin.ub" results in a broken build
> > since two threads descend into arch/microblaze/boot simultaneously.
>
> I see also different problem that when I run that make above
> linux.bin.ub is not generated at all.


That's why I am fixing the problem.

Before the fix, the parallel build fails.


/usr/bin/mkimage: Can't read arch/microblaze/boot/linux.bin: Invalid argument
arch/microblaze/boot/Makefile:14: recipe for target
'arch/microblaze/boot/linux.bin.ub' failed
make[1]: *** [arch/microblaze/boot/linux.bin.ub] Error 1
make[1]: *** Deleting file 'arch/microblaze/boot/linux.bin.ub'
arch/microblaze/Makefile:87: recipe for target 'linux.bin.ub' failed
make: *** [linux.bin.ub] Error 2
make: *** Waiting for unfinished jobs....
  MODPOST 6 modules
Kernel: arch/microblaze/boot/linux.bin is ready  (#2)





>
> >
> > Add proper dependencies to avoid it.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  arch/microblaze/Makefile | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
> > index 7a5df02..544796d 100644
> > --- a/arch/microblaze/Makefile
> > +++ b/arch/microblaze/Makefile
> > @@ -79,13 +79,15 @@ all: linux.bin
> >  archclean:
> >       $(Q)$(MAKE) $(clean)=$(boot)
> >
> > +linux.bin.ub linux.bin.gz: linux.bin
> > +
> >  PHONY += linux.bin linux.bin.gz linux.bin.ub
> >  linux.bin linux.bin.gz linux.bin.ub: vmlinux
> >       $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> >       @echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
> >
> >  PHONY += simpleImage.$(DTB)
> > -simpleImage.$(DTB): vmlinux
> > +simpleImage.$(DTB): linux.bin.ub
>
> It looks weird that simpleImage requires linux.bin.ub.
> Is it really linux.bin.ub here or just linux.bin?


This is intentional to avoid a race in
"make simpleImage.<dt> linux.bin.ub"


But, I chose to make simpleImage* independent of linux.bin* in v2.

I hope you will like it.



> >       $(Q)$(MAKE) $(build)=$(boot) simple_images
> >       @echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
> >
> >
>
>
> Thanks,
> Michal
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
