Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:60875 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755480AbYE0TXy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 May 2008 15:23:54 -0400
Date: Tue, 27 May 2008 21:24:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: 'make arch/x86/' fails
Message-ID: <20080527192434.GA6433@uranus.ravnborg.org>
References: <19f34abd0805271114o70f62d6gdf2f37109364a86@mail.gmail.com> <20080527184426.GA6235@uranus.ravnborg.org> <19f34abd0805271201g587a2e8w4379f3d3f20f2cfa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19f34abd0805271201g587a2e8w4379f3d3f20f2cfa@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Tue, May 27, 2008 at 09:01:45PM +0200, Vegard Nossum wrote:
> On Tue, May 27, 2008 at 8:44 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Tue, May 27, 2008 at 08:14:31PM +0200, Vegard Nossum wrote:
> >> Hi,
> >>
> >> I don't know if this is a regression or what (I've observed it for a
> >> while), but now I thought I'd let you know about it:
> >>
> >> $ make arch/x86/
> >>   CHK     include/linux/version.h
> >>   CHK     include/linux/utsrelease.h
> >>   CC      kernel/bounds.s
> >>   GEN     include/linux/bounds.h
> >>   CC      arch/x86/kernel/asm-offsets.s
> >>   GEN     include/asm-x86/asm-offsets.h
> >>   CALL    scripts/checksyscalls.sh
> >> [...]/linux-2.6/arch/x86/Makefile:37: *** Recursive variable
> >> `KBUILD_CFLAGS' references itself (eventually).  Stop.
> >> make: *** [arch/x86/] Error 2
> >
> > This is unfortunately what you should expect
> > because the directory arch/x86/ is special as it does
> > not contain a regular Kbuild file but instead contains
> > a badly named arch configuration file (Makefile).
> >
> >>
> >> Are there any work-arounds or easy fixes for this? Thanks.
> > For each directory in arch/x86/* do make arch/x86/{directory}
> >
> 
> Thanks.
> 
> How about splitting a part of arch/*/Makefile into
> arch/*/Makefile.arch and including this new Makefile.arch from the
> top-level Makefile instead?
> 
> -include $(srctree)/arch/$(SRCARCH)/Makefile
> +include $(srctree)/arch/$(SRCARCH)/Makefile.arch

I have looked into doing this in a clean way.
But in the end I always stumbled over something for
one of the archs and then I dropped it again.
The purpose of splitting it up should be to simplify
the top-level Makefile and enabling make arch/x86/ would
be a nice sideeffect.

	Sam
