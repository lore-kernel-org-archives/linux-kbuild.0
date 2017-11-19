Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:29405 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbdKSMll (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Nov 2017 07:41:41 -0500
MIME-Version: 1.0
In-Reply-To: <CA+55aFzo2sdQseGj1UM-tYnov25ThwRwN3YSOAu44f63JRZuPQ@mail.gmail.com>
References: <CAK7LNAThpT3_kEpR=m=pXh9YV27bgaytER33JadjxvaWJGWKWw@mail.gmail.com>
 <CA+55aFzo2sdQseGj1UM-tYnov25ThwRwN3YSOAu44f63JRZuPQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 19 Nov 2017 21:40:51 +0900
Message-ID: <CAK7LNARsSNGv4S4OMCjhYkLnE4B+V2OiyxudRsPk2fFCEJ+Oyg@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v4.15
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus


2017-11-18 11:01 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> Oh, and I forgot to ask..
>
> On Fri, Nov 17, 2017 at 9:22 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>> One of the most remarkable improvements in this cycle is, Kbuild is
>> now able to cache the result of shell commands.
>
> I see the "limit it to 500 lines", but I don't see any real coherency.

The limit is 1000 lines.
If your cache file exceeds 1000 lines,
it will be cut down to 500 lines at the next invocation of build.

I used two values 1000 and 500
so that the cache shrink operation is not triggered every time.


> So I take it that if you upgrade your gcc version, you may need to
> blow this cache away manually?

Right.  This is a limitation of this feature.
But, this limitation has existed since before.

When you upgrade your gcc,
you need to do "make clean" anyway to blow all *.o files
so that all objects are re-compiled by the new gcc.

Kbuild stores build commands in .*.cmd files,
but it cannot notice the compiler upgrade.



> Or is there something subtle going on that I've missed?
>
> FWIW, I still think we should probably make the compiler versions etc
> available to the configuration management rather than necessarily
> cache them.


Do you mean something like this?

https://lkml.org/lkml/2016/12/9/577



At first, I thought it was allowed to use a different compiler
for external modules than the one compiled the kernel.
But, Greg said we do not support that case.

Then, the runtime test of compiler capabilities is pointless,
so I think it is a possible solution.
CONFIG_CC_STACKPROTECTOR_AUTO will even more mess up the top Makefile.
https://patchwork.kernel.org/patch/9981173/


-- 
Best Regards
Masahiro Yamada
