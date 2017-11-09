Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:34921 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751020AbdKIQIo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 11:08:44 -0500
Date: Thu, 9 Nov 2017 17:08:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] kbuild: create built-in.o automatically if parent
 directory wants it
Message-ID: <20171109160838.GA26703@ravnborg.org>
References: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com>
 <1510072307-16819-2-git-send-email-yamada.masahiro@socionext.com>
 <20171109053529.GA12717@ravnborg.org>
 <CAK7LNARyrgRBYOW7NGURnVUhhArL3C46UWiSosveM9KGmvEY4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARyrgRBYOW7NGURnVUhhArL3C46UWiSosveM9KGmvEY4Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linux-MIPS <linux-mips@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Michal Marek <mmarek@suse.com>

Hi Masahiro.

On Thu, Nov 09, 2017 at 02:53:04PM +0900, Masahiro Yamada wrote:
> Hi Sam,
> 
> Thanks for your review.
> 
> 2017-11-09 14:35 GMT+09:00 Sam Ravnborg <sam@ravnborg.org>:
> > Hi Masahiro.
> >
> > Thanks for picking this up.
> >
> >> A key point is, the parent Makefile knows whether built-in.o is needed
> >> or not.  If a subdirectory needs to create built-in.o, its parent can
> >> tell the fact when Kbuild descends into it.
> > Good observation!
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 008a4e5..cc0b618 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -1003,7 +1003,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
> >>
> >>  PHONY += $(vmlinux-dirs)
> >>  $(vmlinux-dirs): prepare scripts
> >> -     $(Q)$(MAKE) $(build)=$@
> >> +     $(Q)$(MAKE) $(build)=$@ need-builtin=1
> >
> > The need-bultin may also be required for the shortcuts
> > that allows one to use:
> >
> >         make <dir>/
> >
> >     example:
> >
> >         make net/
> 
> 
> I do not want to add need-builtin=1 for single targets.
> 
> 
> make scripts/
> would create false scripts/built-in.o
> This is odd.
> 
> I wrote the solution in the commit log:
>   $(obj-y) should be still checked to support the single target "%/".

I missed this bit in the commit log,
but I almost commented on this in the patch itself.
Good way to do it.

	Sam
