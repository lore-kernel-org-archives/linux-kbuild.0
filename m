Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:37448 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753064AbeDIPES (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Apr 2018 11:04:18 -0400
Received: by mail-vk0-f66.google.com with SMTP id r19so4952682vkf.4
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Apr 2018 08:04:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAScTUhpvgnNzuOGZ2ueh-d4R4r=v5wzOGsd+pYn+MF-rQ@mail.gmail.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
 <1522128575-5326-12-git-send-email-yamada.masahiro@socionext.com>
 <CAGXu5j+F1GXNE9T3vOo+Sq+GfX2Cy5a8tFU--qVBJwaJkt=s6Q@mail.gmail.com> <CAK7LNAScTUhpvgnNzuOGZ2ueh-d4R4r=v5wzOGsd+pYn+MF-rQ@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 9 Apr 2018 08:04:16 -0700
Message-ID: <CAGXu5jJCpDtVcFckLzeTg=Du0TWL=KGUH1_k2LSbv8PTONQ2Mw@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] stack-protector: test compiler capability in
 Kconfig and drop AUTO mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

On Mon, Apr 9, 2018 at 1:54 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-03-28 20:18 GMT+09:00 Kees Cook <keescook@chromium.org>:
>> On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> diff --git a/arch/Kconfig b/arch/Kconfig
>>> index 8e0d665..b42378d 100644
>>> --- a/arch/Kconfig
>>> +++ b/arch/Kconfig
>>> @@ -535,13 +535,13 @@ config HAVE_CC_STACKPROTECTOR
>>>         bool
>>>         help
>>>           An arch should select this symbol if:
>>> -         - its compiler supports the -fstack-protector option
>>
>> Please leave this note: it's still valid. An arch must still have
>> compiler support for this to be sensible.
>>
>
> No.
>
> "its compiler supports the -fstack-protector option"
> is tested by $(cc-option -fstack-protector)
>
> ARCH does not need to know the GCC support level.

That's not correct: if you enable stack protector for a kernel
architecture that doesn't having it enabled, it's unlikely for the
resulting kernel to boot. An architecture must handle the changes that
the compiler introduces when adding -fstack-protector (for example,
having the stack protector canary value defined, having the failure
function defined, handling context switches changing canaries, etc).

-Kees

-- 
Kees Cook
Pixel Security
