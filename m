Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:22941 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfBAL64 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 06:58:56 -0500
MIME-Version: 1.0
References: <20190121095338.8565-1-bp@alien8.de> <20190131115820.GF6749@zn.tnic>
 <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
 <20190201094217.GB31854@zn.tnic> <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
 <20190201103038.GE31854@zn.tnic> <20190201103648.GF31854@zn.tnic>
In-Reply-To: <20190201103648.GF31854@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Feb 2019 20:58:13 +0900
Message-ID: <CAK7LNAQ4juLxrdMoPumQQ-96fMorf+wfAqkNxq1X1k=0i_R4vQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Feb 1, 2019 at 7:38 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Feb 01, 2019 at 11:30:38AM +0100, Borislav Petkov wrote:
> > This can't be a full kernel build.
>
> So I did this:
>
> $(obj)/%.s: $(src)/%.c FORCE
>         @echo "HERE\n"
>         $(call if_changed_dep,cc_s_c)
>
> and did a full kernel build with my .config. I got exactly *three*
> "HERE"s in the build log.
>
> So pls explain in more detail how you're measuring that slowdown.


Variables assigned with ':=' are evaluated just on parsing Makefile.

The scripts/Makefile.build is parsed over and over again,
so the compiler is invoked hundreds times to test these four options
even when you are not actually building any new objects.

It is mitigated by replacing ':=' with '=',
but they are still evaluated multiple times when generating asm-offset.

Frankly, you cannot use cc-option in scripts/Makefile.build


Your next question might be,
"Is it OK to implement this in the top Makefile?"

It would be better, but I am not convinced to do it.



-- 
Best Regards
Masahiro Yamada
