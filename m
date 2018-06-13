Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61321 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935219AbeFMSQa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 14:16:30 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFz7KGMcvABxJfYs719ySyt2JouDX9t0SAV4Qu9yY9tfPA@mail.gmail.com>
References: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
 <CA+55aFyxY9f9_eGv3CvA0zwzo8K5WeNbNPDFuyhtCrzRyic85A@mail.gmail.com>
 <CA+55aFy2KEzTiF=0nG8_RFoPpycaqc=n-hf-mQSbKotMzYJG-w@mail.gmail.com>
 <CAK7LNASd7Mc8eU76L24ZC0OFdUf566adNGVvX9Ou987cT3CCWw@mail.gmail.com> <CA+55aFz7KGMcvABxJfYs719ySyt2JouDX9t0SAV4Qu9yY9tfPA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Jun 2018 03:15:45 +0900
Message-ID: <CAK7LNAT4m8JgOttC5D16ALKqvMtt-6Vi4nFUdVaTMQSQPwYN-w@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for 4.18 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

2018-06-14 2:49 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> On Wed, Jun 13, 2018 at 10:29 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>> I cannot come up with a name better than CC_STACKPROTECTOR_STRONG.
>
> How about just calling it STACKPROTETOR_STRONG and leaving it at that?

Good idea!

> Make the "CC_HAVE_xyz" model for compiler feature tests, but when
> actually picking an actual option, it's not really about the compiler
> any more, except in the sense that it depends on it.

I agree.

I just respected the original naming,
but CC_ is not sensible any more.


> I guess we could leave the CC_STACKPROTECTOR option as-is, just
> because it apparently has a lot of small uses in actual code too, but
> there is absolutely nothing that uses CONFIG_CC_STACKPROTECTOR_STRONG
> outside of the actual compiler option choice (and config files)

I agree to rename CC_STACKPROTECTOR_STRONG to STACKPROTECTOR_STRONG.
But, I'd like to rename CC_STACKPROTECTOR to STACKPROTECTOR as well.

I guess 30 lines or so in the C code usage.

Could you run sed directly in your tree?



-- 
Best Regards
Masahiro Yamada
