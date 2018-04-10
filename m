Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29957 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751624AbeDJDQQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Apr 2018 23:16:16 -0400
MIME-Version: 1.0
In-Reply-To: <CAGXu5jJCpDtVcFckLzeTg=Du0TWL=KGUH1_k2LSbv8PTONQ2Mw@mail.gmail.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
 <1522128575-5326-12-git-send-email-yamada.masahiro@socionext.com>
 <CAGXu5j+F1GXNE9T3vOo+Sq+GfX2Cy5a8tFU--qVBJwaJkt=s6Q@mail.gmail.com>
 <CAK7LNAScTUhpvgnNzuOGZ2ueh-d4R4r=v5wzOGsd+pYn+MF-rQ@mail.gmail.com> <CAGXu5jJCpDtVcFckLzeTg=Du0TWL=KGUH1_k2LSbv8PTONQ2Mw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 10 Apr 2018 12:15:30 +0900
Message-ID: <CAK7LNATULgbS6mxYJUumnkVZU_1LhQwS0jL=v_=HAjtRiF12yA@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] stack-protector: test compiler capability in
 Kconfig and drop AUTO mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

2018-04-10 0:04 GMT+09:00 Kees Cook <keescook@chromium.org>:
> On Mon, Apr 9, 2018 at 1:54 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> 2018-03-28 20:18 GMT+09:00 Kees Cook <keescook@chromium.org>:
>>> On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
>>> <yamada.masahiro@socionext.com> wrote:
>>>> diff --git a/arch/Kconfig b/arch/Kconfig
>>>> index 8e0d665..b42378d 100644
>>>> --- a/arch/Kconfig
>>>> +++ b/arch/Kconfig
>>>> @@ -535,13 +535,13 @@ config HAVE_CC_STACKPROTECTOR
>>>>         bool
>>>>         help
>>>>           An arch should select this symbol if:
>>>> -         - its compiler supports the -fstack-protector option
>>>
>>> Please leave this note: it's still valid. An arch must still have
>>> compiler support for this to be sensible.
>>>
>>
>> No.
>>
>> "its compiler supports the -fstack-protector option"
>> is tested by $(cc-option -fstack-protector)
>>
>> ARCH does not need to know the GCC support level.
>
> That's not correct: if you enable stack protector for a kernel
> architecture that doesn't having it enabled, it's unlikely for the
> resulting kernel to boot. An architecture must handle the changes that
> the compiler introduces when adding -fstack-protector (for example,
> having the stack protector canary value defined, having the failure
> function defined, handling context switches changing canaries, etc).
>



It is still hard to understand this.


When we "its compiler supports the -fstack-protector option",
we have two meanings

[1] the stack protector feature is implemented in GCC source code.

[2] -fstack-protector is recognized as a valid option in the GCC being used.
    This can be tested by $(cc-option -fstack-protector)

I guess you were talking about [1], where as I [2].
Is this correct?


Does [2] happen only after [1] happens?
Or, are they independent?

If there is a case where GCC recognizes -fstack-protector,
but not implemented?


For x86, there are cases where the option is recognized but not working.
That's why we have
scripts/gcc-x86_{32,64}-has-stack-protector.sh

Generally, if GCC accepts -fstack-protector as a valid option,
we expect "it is working".

I wonder why we need additional information about the compiler
even after $(cc-option -fstack-protector) succeeds.


This is just a matter of comment.

Can you clarify your problem?




> resulting kernel to boot. An architecture must handle the changes that
> the compiler introduces when adding -fstack-protector (for example,
> having the stack protector canary value defined, having the failure
> function defined, handling context switches changing canaries, etc).
>

All of these are talking about the kernel side implementation.
So, it is included in the following comment I am still keeping.

  - it has implemented a stack canary (e.g. __stack_chk_guard)



-- 
Best Regards
Masahiro Yamada
