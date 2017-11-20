Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18579 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751301AbdKTPtd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 10:49:33 -0500
MIME-Version: 1.0
In-Reply-To: <CA+55aFz5DjiY=c-aaO5bApmKhyZ-rSWAY7ufR7R=brdcnuRzsA@mail.gmail.com>
References: <CAK7LNAThpT3_kEpR=m=pXh9YV27bgaytER33JadjxvaWJGWKWw@mail.gmail.com>
 <CA+55aFzo2sdQseGj1UM-tYnov25ThwRwN3YSOAu44f63JRZuPQ@mail.gmail.com>
 <CAK7LNARsSNGv4S4OMCjhYkLnE4B+V2OiyxudRsPk2fFCEJ+Oyg@mail.gmail.com> <CA+55aFz5DjiY=c-aaO5bApmKhyZ-rSWAY7ufR7R=brdcnuRzsA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 Nov 2017 00:48:32 +0900
Message-ID: <CAK7LNATe7K3A+sYDfsoqLnFq6-fu0=meG_77Fc8HQ5BzkBA2GQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v4.15
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,


2017-11-20 3:02 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> On Sun, Nov 19, 2017 at 2:40 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>>
>>> FWIW, I still think we should probably make the compiler versions etc
>>> available to the configuration management rather than necessarily
>>> cache them.
>>
>> Do you mean something like this?
>>
>> https://lkml.org/lkml/2016/12/9/577
>
> Yes. With the important part not being so much that particular syntax,
> but the concept of "get some config options from automation".
>
> And the most obvious thing to do would be to just initialize a "bool"
> variable by running a script where the end result is either success or
> failure.
>
> Now, the actual example:
>
>    config COMPILER_SUPPORTS_XYZ
>        bool
>        option shell="gcc -XYZ"
>
> is obviously too simplified to be realistic, because it would have to
> account for the actual compiler setup, so what you really need is not
> "just execute a shell command" but the equivalent of the Makefile
> "cc-option" function. Aes, for "known buggy versions" you might want
> to also get the actual compiler version into a config option.
>
>
>
> Even if "cc-option" is the _only_ thing you can do (and not some kind
> of "generic shell escape"), I think that would be very useful.
> Wouldn't it be nice to be able to have all those Makefile things as
> Kcconfig scripts - and be able to very naturally take them into
> account when offering people some Kconfig options?
>
> So you could do all the logic of not only testing what flags the
> compiler supports, but then use the Kconfig language to _combine_ that
> knowledge with the build options. Both in the sense of "this kernel
> config option depends on the compiler supporting flag XYZ" but also in
> the sense of "the use flag ABC depends on not only compiler support,
> but also on whether the kernel was configured for profiling" or
> whatever.
>
> Then the actual Makefile parts would be things like
>
>     CFLAGS-$(CONFIG_CC_SPLIT_DWARF) += -gsplit_dwarf
>
> because the Kconfig phase would already have all the logic for whether
> (a) gcc actually supports -gsplit-dwarf at all and (b) whether the
> user actually asked for split debug info.
>
> And we'd not have the performance issues that made that whole caching
> thing be an issue, because the actual gcc support testing would only
> happen at Kconfig time.
>
> .. it would also make the caching rules be obvious. It's just a "if
> you upgraded or changed compilers enough to be noticeable, re-do your
> config ('make oldconfig')".
>
>                Linus

OK, probably this is the right direction.

Embedded folks need to agree to give CROSS_COMPILE to the Kconfig phase.





-- 
Best Regards
Masahiro Yamada
