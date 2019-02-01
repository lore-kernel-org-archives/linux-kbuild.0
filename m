Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64156 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729451AbfBAKwP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 05:52:15 -0500
MIME-Version: 1.0
References: <20190121095338.8565-1-bp@alien8.de> <20190131115820.GF6749@zn.tnic>
 <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
 <20190201094217.GB31854@zn.tnic> <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
 <20190201103038.GE31854@zn.tnic>
In-Reply-To: <20190201103038.GE31854@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Feb 2019 19:51:07 +0900
Message-ID: <CAK7LNATW11-DBFZtF0j8S9KsCa1gOGcfAbfNeWm2epkb=1RnGg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Feb 1, 2019 at 7:32 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Feb 01, 2019 at 07:09:36PM +0900, Masahiro Yamada wrote:
> > I provide the result of "perf stat" of the incremental build for you.
>
> One more question: what exactly is that "incremental build" you're
> measuring with?


I meant "make" after you the full build


> Exact command line please.


$ make defconfig
$ make -j8

 [Wait until the full build finished]

$ perf stat --repeat 20 --null make -j8

 [Wait until the perf result is displayed]




> > Without your patch:
> >
> >
> >  Performance counter stats for 'make -j8' (20 runs):
> >
> >        2.721312445 seconds time elapsed
> >           ( +-  1.02% )
> >
> >
> >
> > With you patch:
> >
> >
> >  Performance counter stats for 'make -j8' (20 runs):
> >
> >        5.038521415 seconds time elapsed
> >           ( +-  0.56% )
>
> This can't be a full kernel build.
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
