Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:56385 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgFPDXL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jun 2020 23:23:11 -0400
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
 <1590226253.lnkg0jun9x.astroid@bobo.none> <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
 <CABCJKufaMU1z-s4S+dHhg0iCyVynLGwsFJgYnYyiBaR=mZt-8w@mail.gmail.com>
In-Reply-To: <CABCJKufaMU1z-s4S+dHhg0iCyVynLGwsFJgYnYyiBaR=mZt-8w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Jun 2020 12:22:20 +0900
Message-ID: <CAK7LNARbZhoaA=Nnuw0=gBrkuKbr_4Ng_Ei57uafujZf7Xazgw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

On Tue, Jun 16, 2020 at 6:47 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Sat, May 23, 2020 at 8:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi Nicholas,
> > (+CC: Sam Ravnborg)
> >
> >
> > On Sat, May 23, 2020 at 7:06 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> > >
> > > Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> > > > + Michael, and PPC ML.
> > > >
> > > > They may know something about the reason of failure.
> > >
> > > Because the linker can't put branch stubs within object code sections,
> > > so when you incrementally link them too large, the linker can't resolve
> > > branches into other object files.
> >
> >
> > Ah, you are right.
> >
> > So, this is a problem not only for PPC
> > but also for ARM (both 32 and 64 bit), etc.
> >
> > ARM needs to insert a veneer to jump far.
> >
> > Prior to thin archive, we could not compile
> > ARCH=arm allyesconfig because
> > drivers/built-in.o was too large.
> >
> > This patch gets us back to the too large
> > incremental object situation.
> >
> > With my quick compile-testing,
> > ARCH=arm allyesconfig
> > and ARCH=arm64 allyesconfig are broken.
>
> Thanks for looking into this! Clang doesn't appear to have this issue
> with LTO because it always enables both -ffunction-sections and
> -fdata-sections. I confirmed that -ffunction-sections also fixes arm64
> allyesconfig with this patch. While I'm fine with reusing vmlinux.o
> only with LTO, how would you feel about enabling -ffunction-sections
> in the kernel by default?


I am OK if it works.

Please do compile tests for some architectures.
(especially, ARCH=powerpc defconfig, and ARCH=arm(64) allyesconfig)


Thank you.




-- 
Best Regards
Masahiro Yamada
