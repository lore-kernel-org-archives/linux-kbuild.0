Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:37229 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932130AbeFHIWn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 04:22:43 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR5f+ZU+W9hUZJW+78rATsUjmgSnq31f-iZkMgPEhaoBw@mail.gmail.com>
References: <1527499328-13213-1-git-send-email-yamada.masahiro@socionext.com>
 <1527499328-13213-22-git-send-email-yamada.masahiro@socionext.com>
 <CAMuHMdUDCtnyqydZan9Q-+hOQacWGJrrMbw4LshjYSjn2=yBjw@mail.gmail.com>
 <CAK7LNAQxS7xkqja2J5FNkRfhCtQpeKqJVsQXFggQrJT6cL_2Cw@mail.gmail.com> <CAK7LNAR5f+ZU+W9hUZJW+78rATsUjmgSnq31f-iZkMgPEhaoBw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jun 2018 10:22:41 +0200
Message-ID: <CAMuHMdV9U1-3NsojpAZROAJsKSyun=RzFt6CqGAHwW3KHqi5kA@mail.gmail.com>
Subject: Re: [PATCH v5 21/31] kconfig: show compiler version text in the top comment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Yamada-san,

On Fri, Jun 8, 2018 at 9:04 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-06-07 17:58 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> 2018-06-07 17:42 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
>>> On Mon, May 28, 2018 at 11:21 AM, Masahiro Yamada
>>> <yamada.masahiro@socionext.com> wrote:
>>>> The kernel configuration phase is now tightly coupled with the compiler
>>>> in use.  It will be nice to show the compiler information in Kconfig.

[...]

>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>>
>>> This is now commit 21c54b774744719c ("kconfig: show compiler version text
>>> in the top comment") upstream.
>>>
>>> This commit broke cross-compilation for me:
>>>
>>>     $ make ARCH=m68k
>>>     scripts/kconfig/conf  --syncconfig Kconfig
>>>     scripts/kconfig/conf  --syncconfig Kconfig
>>>     scripts/kconfig/conf  --syncconfig Kconfig
>>>     scripts/kconfig/conf  --syncconfig Kconfig
>>>     ...
>>>
>>> with O=:
>>>
>>>       GEN     ./Makefile
>>>      scripts/kconfig/conf  --syncconfig Kconfig
>>>       GEN     ./Makefile
>>>     scripts/kconfig/conf  --syncconfig Kconfig
>>>       GEN     ./Makefile
>>>     scripts/kconfig/conf  --syncconfig Kconfig
>>>       GEN     ./Makefile
>>>     ...
>>>
>>> .config gained (both with/without O=):
>>>
>>>     #
>>>     # Compiler: gcc (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609
>>>     #
>>>
>>> which is definitely wrong when cross-compiling for m68k.
>>>
>>> Reverting the commit, and fixing up the conflicts, fixes the issue for me
>>>
>>> Do you have a clue?
>>> Thanks!
>>
>>
>> Agh, I missed the case where CROSS_COMPILE is
>> set by arch/$(SRCARCH)/Makefile.
>>
>>
>> I will fix it.  Thanks for the report!
>
> I posted a patch.
> https://patchwork.kernel.org/patch/10453685/
>
> I hope it will fix your problem.

Yes it has. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
