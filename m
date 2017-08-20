Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:44162 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752910AbdHTNT4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Aug 2017 09:19:56 -0400
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1NXUw9oSb-YB+TGeQYd6-sNMW+S5E5FUV_0TuBGhKV_A@mail.gmail.com>
References: <596fd414.fDkQ2LPtuAl0Zq0f%akpm@linux-foundation.org> <CAK8P3a1NXUw9oSb-YB+TGeQYd6-sNMW+S5E5FUV_0TuBGhKV_A@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 20 Aug 2017 22:19:07 +0900
Message-ID: <CAK7LNAQ_1g_EJCvEv2mCa1x3oMR7uZAvPbwQxnjeKNkrtmbvxg@mail.gmail.com>
Subject: Re: + kbuild-disable-wformat-truncation-warnings-by-default.patch
 added to -mm tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, mm-commits@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable <stable@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>

Hi Arnd,


2017-07-20 16:24 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Wed, Jul 19, 2017 at 11:50 PM,  <akpm@linux-foundation.org> wrote:
>> ------------------------------------------------------
>> From: Arnd Bergmann <arnd@arndb.de>
>> Subject: kbuild: disable -Wformat-truncation warnings by default
>>
>> With x86 allmodconfig, we currently get 233 -Wformat-truncation warnings,
>> which makes the entire warnings rather useless.
>>
>> This turns off the warning by default, unless we specify W=1 or higher
>>
>> Link: http://lkml.kernel.org/r/20170714120720.906842-2-arnd@arndb.de
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>> ---
>>
>>  scripts/Makefile.extrawarn |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff -puN scripts/Makefile.extrawarn~kbuild-disable-wformat-truncation-warnings-by-default scripts/Makefile.extrawarn
>> --- a/scripts/Makefile.extrawarn~kbuild-disable-wformat-truncation-warnings-by-default
>> +++ a/scripts/Makefile.extrawarn
>> @@ -67,5 +67,8 @@ KBUILD_CFLAGS += $(call cc-disable-warni
>>  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
>>  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
>>  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
>> +else
>> +# noisy gcc-7 warnings
>> +KBUILD_CFLAGS += $(call cc-option,-Wformat-truncation=0)
>>  endif
>>  endif
>
> Hi Andrew, Linus, Greg,
>
> I noticed that Linus has made a similar patch in 4.13-rc1, commit bd664f6b3e37
> ("disable new gcc-7.1.1 warnings for now"), and it completely disables three
> warnings (format-truncation, format-overflow and int-in-bool-context).
>
> Obviously there is no point in having both, so let's talk about what we
> want for 4.13, stable-backports and for future kernels, I'll then send those
> patches. Here is my first suggestion:
>
> - enable all three warnings with "make W=1" in 4.13, but leave them
>   disabled by default.
> - backport Linus' patch, plus the follow-up for W=1 to stable kernels,
>   to allow stable kernels to build cleanly
> - backport the patches that address any other gcc-7 warnings, as
>   well as those that are not obvious false-positives to stable kernels
> - In 4.14+, use my version above and address all int-in-bool-context
>   and format-overflow warnings, but only use -Wformat-truncation
>   with make W=1.
>

Talking about 4.14+, shall we move -Wformat-truncation
from the top Makefile (always disable) to
Makefile.extrawarn (enable with W=1) ?


-- 
Best Regards
Masahiro Yamada
