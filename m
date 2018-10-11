Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42651 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbeJKWgv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Oct 2018 18:36:51 -0400
MIME-Version: 1.0
References: <20181010222333.17794-1-bp@alien8.de> <CAK7LNAT2KpYkn=hj=h1XmbMJRdtgCQ__xP0X+Rpwm3e_Xs1brQ@mail.gmail.com>
 <20181011085234.GA25435@zn.tnic>
In-Reply-To: <20181011085234.GA25435@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Oct 2018 00:08:07 +0900
Message-ID: <CAK7LNAS=Kr1W6SfwojEVdwpKy7Au9NRh-wd2Qfo5+aVQVDe9ZQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fail the build early when no lz4 present
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Oct 11, 2018 at 5:54 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Thu, Oct 11, 2018 at 01:26:23PM +0900, Masahiro Yamada wrote:
> > So, the cause of the failure is clear enough
> > from the build log.
>
> Sure but it wasts unnecessary build cycles and appears only after all
> the compilation units have been produced.


Not a waste of time.

Install lz4c, and run 'make' again.
Almost all objects have been built there,
so you will finish it soon.

If you are building up a compile-test machine,
you will probably need to install various tools anyway.

I do not want to add ugly checks in random places.


> > It is weird to check only lz4c.
> > If CONFIG_KERNEL_LZO is enabled, but lzop is not installed,
> > I see this log
> >
> >   LZO     arch/x86/boot/compressed/vmlinux.bin.lzo
> > /bin/sh: 1: lzop: not found
> >
> > It is still clear what to do, though.
>
> Right, we should test for that too. Unless distros start installing it
> by default. It is not installed by default on a debian guest here, at
> least.
>
> SLES15 either:
>
> $ lzop
> If 'lzop' is not a typo you can use command-not-found to lookup the package that contains it, like this:
>     cnf lzop
>
> > Is it necessary to check this earlier?
>
> Yes, see above.
>
> > If you get this error, you just need to install the tool.
> > Then, you can re-run the incremental build.
>
> Actually, I'd prefer the build to fail early so that machine can
> continue with the next build.
>
> > BTW, this patch has a drawback.
> >
> > [1] Enable CONFIG_KERNEL_LZ4 on the system
> >     without lz4c installed
> >
> > [2] Run 'make' and you will get the error
> >     "lz4 tool not found on this system but CONFIG_KERNEL_LZ4 enabled"
> >
> > [3] Run 'make menuconfig' and
> >     switch from CONFIG_KERNEL_LZ4 to CONFIG_KERNEL_GZIP
> >
> > [4] Run 'make' and you will still get the same error
> >     even after you have chosen to use GZIP instead of LZ4.
>
> Well, there's code in Makefile to refresh include/config/auto.conf but
> for whatever reason that make in step 4 doesn't run it.
>
> And *that* looks like a bug - if a user runs "make menuconfig" and
> .config gets updated, then include/config/auto.conf better get updated
> too. Right?

Not a bug.
include/config/auto.conf gets updates.

But the top Makefile is parsed twice
with a stale auto.conf, and with a fresh auto.conf

It is wrong to add $(error ...)
in the plain context in the top Makefile.



> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> Good mailing practices for 400: avoid top-posting and trim the reply.



-- 
Best Regards
Masahiro Yamada
