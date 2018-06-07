Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42130 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932733AbeFGI7e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 04:59:34 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUDCtnyqydZan9Q-+hOQacWGJrrMbw4LshjYSjn2=yBjw@mail.gmail.com>
References: <1527499328-13213-1-git-send-email-yamada.masahiro@socionext.com>
 <1527499328-13213-22-git-send-email-yamada.masahiro@socionext.com> <CAMuHMdUDCtnyqydZan9Q-+hOQacWGJrrMbw4LshjYSjn2=yBjw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Jun 2018 17:58:33 +0900
Message-ID: <CAK7LNAQxS7xkqja2J5FNkRfhCtQpeKqJVsQXFggQrJT6cL_2Cw@mail.gmail.com>
Subject: Re: [PATCH v5 21/31] kconfig: show compiler version text in the top comment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Geert,


2018-06-07 17:42 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Yamada-san,
>
> On Mon, May 28, 2018 at 11:21 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> The kernel configuration phase is now tightly coupled with the compiler
>> in use.  It will be nice to show the compiler information in Kconfig.
>>
>> The compiler information will be displayed like this:
>>
>>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- config
>>   scripts/kconfig/conf  --oldaskconfig Kconfig
>>   *
>>   * Linux/arm64 4.16.0-rc1 Kernel Configuration
>>   *
>>   *
>>   * Compiler: aarch64-linux-gnu-gcc (Linaro GCC 7.2-2017.11) 7.2.1 20171011
>>   *
>>   *
>>   * General setup
>>   *
>>   Compile also drivers which will not load (COMPILE_TEST) [N/y/?]
>>
>> If you use GUI methods such as menuconfig, it will be displayed in the
>> top menu.
>>
>> This is simply implemented by using the 'comment' statement.  So, it
>> will be saved into the .config file as well.
>>
>> This commit has a very important meaning.  If the compiler is upgraded,
>> Kconfig must be re-run since different compilers have different sets
>> of supported options.
>>
>> All referenced environments are written to include/config/auto.conf.cmd
>> so that any environment change triggers syncconfig, and prompt the user
>> to input new values if needed.
>>
>> With this commit, something like follows will be added to
>> include/config/auto.conf.cmd
>>
>>   ifneq "$(CC_VERSION_TEXT)" "aarch64-linux-gnu-gcc (Linaro GCC 7.2-2017.11) 7.2.1 20171011"
>>   include/config/auto.conf: FORCE
>>   endif
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> This is now commit 21c54b774744719c ("kconfig: show compiler version text
> in the top comment") upstream.
>
> This commit broke cross-compilation for me:
>
>     $ make ARCH=m68k
>     scripts/kconfig/conf  --syncconfig Kconfig
>     scripts/kconfig/conf  --syncconfig Kconfig
>     scripts/kconfig/conf  --syncconfig Kconfig
>     scripts/kconfig/conf  --syncconfig Kconfig
>     ...
>
> with O=:
>
>       GEN     ./Makefile
>      scripts/kconfig/conf  --syncconfig Kconfig
>       GEN     ./Makefile
>     scripts/kconfig/conf  --syncconfig Kconfig
>       GEN     ./Makefile
>     scripts/kconfig/conf  --syncconfig Kconfig
>       GEN     ./Makefile
>     ...
>
> .config gained (both with/without O=):
>
>     #
>     # Compiler: gcc (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609
>     #
>
> which is definitely wrong when cross-compiling for m68k.
>
> Reverting the commit, and fixing up the conflicts, fixes the issue for me
>
> Do you have a clue?
> Thanks!


Agh, I missed the case where CROSS_COMPILE is
set by arch/$(SRCARCH)/Makefile.


I will fix it.  Thanks for the report!






-- 
Best Regards
Masahiro Yamada
