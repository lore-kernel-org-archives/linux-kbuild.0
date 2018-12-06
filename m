Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27082 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbeLFF2f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Dec 2018 00:28:35 -0500
MIME-Version: 1.0
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com> <80bf0f6e-8f1f-314e-b22d-6e786cf15e45@monstr.eu>
In-Reply-To: <80bf0f6e-8f1f-314e-b22d-6e786cf15e45@monstr.eu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 6 Dec 2018 14:27:50 +0900
Message-ID: <CAK7LNAQBFfaJbFXf5h9LX689RUwA4kSeqPrimVOWDWq0XAVJ_Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] microblaze: adjust the help to the real behavior
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Michal,

On Thu, Dec 6, 2018 at 12:41 AM Michal Simek <monstr@monstr.eu> wrote:
>
> On 03. 12. 18 8:50, Masahiro Yamada wrote:
> > "make ARCH=microblaze help" mentions simpleImage.<dt>.unstrip,
> > but it never works because Makefile assumes "system.unstrip" is
> > the name of DT.
> >
> > $ make ARCH=microblaze CROSS_COMPILE=microblaze-linux- simpleImage.system.unstrip
> >   [ snip ]
> > make[1]: *** No rule to make target 'arch/microblaze/boot/dts/system.unstrip.dtb', needed by 'arch/microblaze/boot/dts/system.dtb'.  Stop.
> > make: *** [Makefile;1060: arch/microblaze/boot/dts] Error 2
> > make: *** Waiting for unfinished jobs....
> >
> > Rip off the never-working target.
> >
> > In my understanding, simpleImage.<dt> works like a phony target that
> > generates multiple images. Reflect the behavior to the help message.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  arch/microblaze/Makefile | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
> > index 0823d29..97e1384 100644
> > --- a/arch/microblaze/Makefile
> > +++ b/arch/microblaze/Makefile
> > @@ -89,9 +89,7 @@ define archhelp
> >    echo '* linux.bin    - Create raw binary'
> >    echo '  linux.bin.gz - Create compressed raw binary'
> >    echo '  linux.bin.ub - Create U-Boot wrapped raw binary'
> > -  echo '  simpleImage.<dt> - ELF image with $(arch)/boot/dts/<dt>.dts linked in'
> > -  echo '                   - stripped elf with fdt blob'
> > -  echo '  simpleImage.<dt>.unstrip - full ELF image with fdt blob'
> > +  echo '  simpleImage.<dt> - Create images with $(arch)/boot/dts/<dt>.dts linked in'
> >    echo '  *_defconfig      - Select default config from arch/microblaze/configs'
> >    echo ''
> >    echo '  Targets with <dt> embed a device tree blob inside the image'
> >
>
> I understand what you are trying to say but I would still like to keep
> information about unstrip file.
> It is correct that it is not build target. It is just generated file and
> message above was used for description what it is.
> Definitely agree that this should be the part of targets but it should
> be in description.
> The same is for missing description for simpleImage.<dt>.strip and
> simpleImage.<dt>.ub files.
>
> Thanks,
> Michal
>

If we want to be precise to the current behavior,
we could describe more.
(Is it too much?)


Architecture specific targets (microblaze):
* linux.bin    - Create raw binary
  linux.bin.gz - Create compressed raw binary
  linux.bin.ub - Create U-Boot wrapped raw binary
  simpleImage.<dt> - Create the following images with
arch/macroblaze/boot/dts/<dt>.dts linked in
                     simpleImage.<dt>        : raw image
                     simpleImage.<dt>.ub     : raw image with U-Boot header
                     simpleImage.<dt>.unstrip: ELF (identical to vmlinux)
                     simpleImage.<dt>.strip  : stripped ELF
  *_defconfig      - Select default config from arch/microblaze/configs




If you want to modify as you like,
I will not touch it though.





BTW, "make ARCH=microblaze help" looks like follows:

* linux.bin    - Create raw binary
  linux.bin.gz - Create compressed raw binary
  linux.bin.ub - Create U-Boot wrapped raw binary
  simpleImage.<dt> - ELF image with /boot/dts/<dt>.dts linked in
                   - stripped elf with fdt blob
  simpleImage.<dt>.unstrip - full ELF image with fdt blob
  *_defconfig      - Select default config from arch/microblaze/configs




Since "arch" is not set anywhere, $(arch) is empty,
"ELF image with /boot/dts/<dt>.dts linked in" looks strange.



--
Best Regards
Masahiro Yamada
