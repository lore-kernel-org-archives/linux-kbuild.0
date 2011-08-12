Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:34475 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751196Ab1HLUYx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Aug 2011 16:24:53 -0400
Date: Fri, 12 Aug 2011 22:24:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Relinking zImage when nothing changes
Message-ID: <20110812202450.GA28713@merkur.ravnborg.org>
References: <4E4566F0.4020001@codeaurora.org> <20110812180209.GA28520@merkur.ravnborg.org> <CACqU3MUkZBEs=v9181bixR37R4DxmkykiH5fU8PVUTd0c2a_ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACqU3MUkZBEs=v9181bixR37R4DxmkykiH5fU8PVUTd0c2a_ZA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, Peter Foley <pefoley2@verizon.net>

On Fri, Aug 12, 2011 at 04:20:15PM -0400, Arnaud Lacombe wrote:
> Hi,
> 
> On Fri, Aug 12, 2011 at 2:02 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Fri, Aug 12, 2011 at 10:46:24AM -0700, Stephen Boyd wrote:
> >> I was hoping with the recent patch e78e8f2 (kernel: prevent unnecessary
> >> rebuilding due to config_data.gz, 2011-07-05) compiling ARM linux a
> >> second time would amount to no more linking. This doesn't seem to be the
> >> case though. Doing a make V=2 I see that lib1funcs.S is shipped and thus
> >> we have to recompile it although nothing actually changed. This in turn
> >> requires us to relink the compressed vmlinux and then recreate the zImage.
> >>
> >>   Kernel: arch/arm/boot/Image is ready
> >>   SHIPPED arch/arm/boot/compressed/lib1funcs.S - due to missing .cmd file
> >>   AS      arch/arm/boot/compressed/lib1funcs.o - due to: arch/arm/boot/compressed/lib1funcs.S
> >>   LD      arch/arm/boot/compressed/vmlinux - due to: arch/arm/boot/compressed/lib1funcs.o
> >>   OBJCOPY arch/arm/boot/zImage - due to: arch/arm/boot/compressed/vmlinux
> >>   Kernel: arch/arm/boot/zImage is ready
> >>
> >>
> >> Is there any way to avoid this? Perhaps the shipped command could become
> >> a bit wiser?
> >
> > Following patch will likely fix it:
> > diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> > index 0c74a6f..80b6b6e 100644
> > --- a/arch/arm/boot/compressed/Makefile
> > +++ b/arch/arm/boot/compressed/Makefile
> > @@ -123,7 +123,7 @@ LDFLAGS_vmlinux += -T
> >  # For __aeabi_uidivmod
> >  lib1funcs = $(obj)/lib1funcs.o
> >
> > -$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S FORCE
> > +$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S
> >        $(call cmd,shipped)
> >
> AFAIK, we have a generic rule to handle shipped files:
> 
> from scripts/Makefile.lib:
> 
> $(obj)/%: $(src)/%_shipped
>         $(call cmd,shipped)
> 
> so, that rule should not be needed at all.

In this case the cmd_shipped is misused to make a copy of a file.
So the generic rule does not apply.

	Sam
