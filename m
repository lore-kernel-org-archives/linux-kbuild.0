Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:26453 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752678Ab1HLSeM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Aug 2011 14:34:12 -0400
Date: Fri, 12 Aug 2011 20:34:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Relinking zImage when nothing changes
Message-ID: <20110812183410.GA28589@merkur.ravnborg.org>
References: <4E4566F0.4020001@codeaurora.org> <20110812180209.GA28520@merkur.ravnborg.org> <4E456CFB.3080206@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E456CFB.3080206@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, Peter Foley <pefoley2@verizon.net>

On Fri, Aug 12, 2011 at 11:12:11AM -0700, Stephen Boyd wrote:
> On 08/12/2011 11:02 AM, Sam Ravnborg wrote:
> > On Fri, Aug 12, 2011 at 10:46:24AM -0700, Stephen Boyd wrote:
> >> I was hoping with the recent patch e78e8f2 (kernel: prevent unnecessary
> >> rebuilding due to config_data.gz, 2011-07-05) compiling ARM linux a
> >> second time would amount to no more linking. This doesn't seem to be the
> >> case though. Doing a make V=2 I see that lib1funcs.S is shipped and thus
> >> we have to recompile it although nothing actually changed. This in turn
> >> requires us to relink the compressed vmlinux and then recreate the zImage.
> >>
> >>   Kernel: arch/arm/boot/Image is ready
> >>   SHIPPED arch/arm/boot/compressed/lib1funcs.S - due to missing .cmd file
> >>   AS      arch/arm/boot/compressed/lib1funcs.o - due to: arch/arm/boot/compressed/lib1funcs.S
> >>   LD      arch/arm/boot/compressed/vmlinux - due to: arch/arm/boot/compressed/lib1funcs.o
> >>   OBJCOPY arch/arm/boot/zImage - due to: arch/arm/boot/compressed/vmlinux
> >>   Kernel: arch/arm/boot/zImage is ready
> >>
> >>
> >> Is there any way to avoid this? Perhaps the shipped command could become
> >> a bit wiser?
> > Following patch will likely fix it:
> > diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> > index 0c74a6f..80b6b6e 100644
> > --- a/arch/arm/boot/compressed/Makefile
> > +++ b/arch/arm/boot/compressed/Makefile
> > @@ -123,7 +123,7 @@ LDFLAGS_vmlinux += -T
> >  # For __aeabi_uidivmod
> >  lib1funcs = $(obj)/lib1funcs.o
> >
> > -$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S FORCE
> > +$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S
> >         $(call cmd,shipped)
> >
> >  # We need to prevent any GOTOFF relocs being used with references
> >
> > (cut'n'pasted ...)
> >
> > The FORCE prerequisite will tell make to always execute the command.
> > But we only want to execute the command if:
> > 1) $(obj)/lib1funcs.S is missing
> > 2) or $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S is not older then $(obj)/lib1funcs.S 
> >
> > So dropping FORCE should be a safe thing to do.
> >
> 
> Hm... that fixes the shipped part. But now we still reassemble lib1funcs.o.
> 
>   Kernel: arch/arm/boot/Image is ready
>   AS      arch/arm/boot/compressed/lib1funcs.o - due to lib1funcs.o not in $(targets)
>   LD      arch/arm/boot/compressed/vmlinux - due to: arch/arm/boot/compressed/lib1funcs.o
>   OBJCOPY arch/arm/boot/zImage - due to: arch/arm/boot/compressed/vmlinux
>   Kernel: arch/arm/boot/zImage is ready
> 
> 
> Is it correct to add lib1funcs.o to targets?
Yes - it is a bug this was not done before.

> 
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index 0c74a6f..64889e6 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -91,7 +91,7 @@ suffix_$(CONFIG_KERNEL_LZMA) = lzma
>  
>  targets       := vmlinux vmlinux.lds \
>                  piggy.$(suffix_y) piggy.$(suffix_y).o \
> -                font.o font.c head.o misc.o $(OBJS)
> +                font.o font.c head.o misc.o lib1funcs.o $(OBJS)
>  
>  # Make sure files are removed during clean
>  extra-y       += piggy.gzip piggy.lzo piggy.lzma lib1funcs.S
> @@ -123,7 +123,7 @@ LDFLAGS_vmlinux += -T

>  # For __aeabi_uidivmod
>  lib1funcs = $(obj)/lib1funcs.o
While touching the file I would kill this assignment - it confused me.

>  
> -$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S FORCE
> +$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S
>         $(call cmd,shipped)
>  
>  # We need to prevent any GOTOFF relocs being used with references

If you prepare a patch with the changes then you can add my "Acked-by".

	Sam
