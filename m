Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:28929 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751898AbeFMR3j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 13:29:39 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFy2KEzTiF=0nG8_RFoPpycaqc=n-hf-mQSbKotMzYJG-w@mail.gmail.com>
References: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
 <CA+55aFyxY9f9_eGv3CvA0zwzo8K5WeNbNPDFuyhtCrzRyic85A@mail.gmail.com> <CA+55aFy2KEzTiF=0nG8_RFoPpycaqc=n-hf-mQSbKotMzYJG-w@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Jun 2018 02:28:36 +0900
Message-ID: <CAK7LNASd7Mc8eU76L24ZC0OFdUf566adNGVvX9Ou987cT3CCWw@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for 4.18 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

2018-06-14 1:03 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> On Wed, Jun 13, 2018 at 8:55 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Wed, Jun 13, 2018 at 7:47 AM Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>> >
>> > Please pull more Kbuild updates.
>>
>> Pulled. However, I notice a few oddities.
>
> Oh, and one actual bug: "make oldconfig" doesn't work right.
>
> I used to have
>
>   CONFIG_HAVE_CC_STACKPROTECTOR=y
>   # CONFIG_CC_STACKPROTECTOR_NONE is not set
>   # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
>   # CONFIG_CC_STACKPROTECTOR_STRONG is not set
>   CONFIG_CC_STACKPROTECTOR_AUTO=y
>
> which means that since my compiler supports -fstack-protector-strong,
> I should get CONFIG_CC_STACKPROTECTOR_STRONG.
>
> But that's not at all what I get. I get
>
>   CONFIG_HAVE_CC_STACKPROTECTOR=y
>   CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
>   CONFIG_CC_STACKPROTECTOR=y
>   # CONFIG_CC_STACKPROTECTOR_STRONG is not set
>   CONFIG_CC_HAS_SANE_STACKPROTECTOR=y
>
> ie CONFIG_CC_STACKPROTECTOR_STRONG basically went away.
>
> The reason for that is that it takes the *old* value of
> CONFIG_CC_STACKPROTECTOR_STRONG, which was "no", but that's wrong.
>
> The meaning of the config option has changed, but it took the default
> from the old meaning, and decided that I shouldn't get strong stack
> protection any more.
>
> This is a pretty dangerous silent change.
>
>                Linus


Sorry, I did not notice this case.


I cannot come up with a name better than CC_STACKPROTECTOR_STRONG.


Another solution might be,
to add _AUTO back again for the backward-compatibility.


config CC_STACKPROTECTOR_AUTO
       bool "Stack Protector Auto (backward compatibility)"
       select CC_STACKPROTECTOR_STRONG if $(cc-option,-fstack-protector-strong)
       select CC_STACKPROTECTOR if $(cc-option,-fstack-protector)
       depends on HAVE_CC_STACKPROTECTOR
       help
         This option is here to not break "make oldconfig". If the old .config
         file enabled CC_STACKPROTECTOR_AUTO, CC_STACKPROTECTOR_STRONG should
         be enabled when compiler supports it.
         This will be removed after v4.19.



If a user previously chose _AUTO
and the compiler supports -fstack-protector-strong,
CC_STACKPROTECTOR_STRONG is forcibly enabled.

Of course, this is ugly.
I do not want to carry it for a long time
even if we decide this is necessary.

-- 
Best Regards
Masahiro Yamada
