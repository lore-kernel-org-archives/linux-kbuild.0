Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20737 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbfBAKK3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 05:10:29 -0500
MIME-Version: 1.0
References: <20190121095338.8565-1-bp@alien8.de> <20190131115820.GF6749@zn.tnic>
 <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com> <20190201094217.GB31854@zn.tnic>
In-Reply-To: <20190201094217.GB31854@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Feb 2019 19:09:36 +0900
Message-ID: <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Feb 1, 2019 at 6:50 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Feb 01, 2019 at 12:06:13PM +0900, Masahiro Yamada wrote:
> > This would make the build speed slower
> > because the compiler is invoked to check those flags in every directory.
> >
> > I tested this patch with x86_64_defconfig and GCC 8.2
> > (on ubuntu 18.10 in docker)
> > but I saw no effect of this patch.
>
> Yes, because that's the .s target which is meant to be used to convert
> only a *single* .c file to assembly in order to stare at the resulting
> asm. For example:
>
> make arch/x86/kernel/cpu/common.s


I do know this, and did compare the output
from the *single* target "make arch/x86/kernel/cpu/common.s"



> It is a debugging aid - and a very basic and important one - and is not
> usually used during a normal kernel build. AFAIK.
>
> So we shouldn't worry about any slowdowns here.


Your patch does slowdown the build system extremely.


I provide the result of "perf stat" of the incremental build for you.



Without your patch:


 Performance counter stats for 'make -j8' (20 runs):

       2.721312445 seconds time elapsed
          ( +-  1.02% )



With you patch:


 Performance counter stats for 'make -j8' (20 runs):

       5.038521415 seconds time elapsed
          ( +-  0.56% )




Why should the normal build affected by the debugging aid?




One more thing, you did not answer my question.

If you are complaining about the DWARF info
enabled by CONFIG_DEBUG_INFO,
I recommend to turn off CONFIG_DEBUG_INFO.



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
