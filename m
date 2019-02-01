Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:34410 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728478AbfBAKap (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 05:30:45 -0500
Date: Fri, 1 Feb 2019 11:30:38 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Message-ID: <20190201103038.GE31854@zn.tnic>
References: <20190121095338.8565-1-bp@alien8.de>
 <20190131115820.GF6749@zn.tnic>
 <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
 <20190201094217.GB31854@zn.tnic>
 <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Feb 01, 2019 at 07:09:36PM +0900, Masahiro Yamada wrote:
> I provide the result of "perf stat" of the incremental build for you.

One more question: what exactly is that "incremental build" you're
measuring with?

Exact command line please.

> Without your patch:
> 
> 
>  Performance counter stats for 'make -j8' (20 runs):
> 
>        2.721312445 seconds time elapsed
>           ( +-  1.02% )
> 
> 
> 
> With you patch:
> 
> 
>  Performance counter stats for 'make -j8' (20 runs):
> 
>        5.038521415 seconds time elapsed
>           ( +-  0.56% )

This can't be a full kernel build.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
