Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:48712 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbfBALEZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 06:04:25 -0500
MIME-Version: 1.0
References: <20190121095338.8565-1-bp@alien8.de> <20190131115820.GF6749@zn.tnic>
 <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
 <20190201094217.GB31854@zn.tnic> <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
 <20190201102332.GD31854@zn.tnic>
In-Reply-To: <20190201102332.GD31854@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Feb 2019 20:03:43 +0900
Message-ID: <CAK7LNARQbJH_cScJ+feCSCFGbHr+EiaKcYLLxsvVn+WVCOoRbg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Feb 1, 2019 at 7:25 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Feb 01, 2019 at 07:09:36PM +0900, Masahiro Yamada wrote:
> > Why should the normal build affected by the debugging aid?
>
> Hmm, ok, so then that target really is being used during the normal
> build. I don't know why yet so I'll have to do some more staring.
>
> > One more thing, you did not answer my question.
> >
> > If you are complaining about the DWARF info
> > enabled by CONFIG_DEBUG_INFO,
> > I recommend to turn off CONFIG_DEBUG_INFO.
>
> Yes but I don't want to be changing .config just so that I can look at
> the asm output.


Generally speaking, the build system should do what was
requested by a set of CONFIG options.

If you want to turn off DWARF info,
you should disable the corresponding CONFIG.


If you want to tweak the behavior from the command line,
KCFLAGS is available though.


make arch/x86/kernel/cpu/common.s KCFLAGS="-gno-as-locview-support
-fno-dwarf2-cfi-asm -feliminate-unused-debug-symbols
-gno-statement-frontiers"



> I'll think about a better solution.
>
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
