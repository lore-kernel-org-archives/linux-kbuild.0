Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37095 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751711AbeEEBgw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 May 2018 21:36:52 -0400
MIME-Version: 1.0
In-Reply-To: <CAGXu5jLWGzGERGTVppVn1zXP9kNPURryukeU8Cfy-SwfZpyDSg@mail.gmail.com>
References: <1523595999-27433-1-git-send-email-yamada.masahiro@socionext.com>
 <1523595999-27433-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNATV==PWHd2M63X+SMchRoTqtbnnSFSZM1bQnjCRfRrRKg@mail.gmail.com> <CAGXu5jLWGzGERGTVppVn1zXP9kNPURryukeU8Cfy-SwfZpyDSg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 5 May 2018 10:35:58 +0900
Message-ID: <CAK7LNAQbNXNOzpY9gdv8xcjKDqYvOoLNTHA16zoH3Sx4W6ZZ1A@mail.gmail.com>
Subject: Re: [PATCH 01/30] gcc-plugins: fix build condition of SANCOV plugin
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-05-05 1:21 GMT+09:00 Kees Cook <keescook@chromium.org>:
> On Fri, May 4, 2018 at 7:21 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Hi Kees,
>>
>>
>> 2018-04-13 14:06 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>>> Since commit d677a4d60193 ("Makefile: support flag
>>> -fsanitizer-coverage=trace-cmp"), you miss to build the SANCOV
>>> plugin under some circumstances.
>>>
>>>   CONFIG_KCOV=y
>>>   CONFIG_KCOV_ENABLE_COMPARISONS=y
>>>   Your compiler does not support -fsanitize-coverage=trace-pc
>>>   Your compiler does not support -fsanitize-coverage=trace-cmp
>>>
>>> Under this condition, $(CFLAGS_KCOV) is not empty but contains a
>>> space, so the following ifeq-conditional is false.
>>>
>>>     ifeq ($(CFLAGS_KCOV),)
>>>
>>> Then, scripts/Makefile.gcc-plugins misses to add sancov_plugin.so to
>>> gcc-plugin-y while the SANCOV plugin is necessary as an alternative
>>> means.
>>>
>>> Fixes: d677a4d60193 ("Makefile: support flag -fsanitizer-coverage=trace-cmp")
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> ---
>>
>>
>> I am planning to queue this up to the fixes branch
>> since this is a bug fix.
>>
>> Do you have any comment on this?
>
> Looks fine to me; thanks!
>
> Acked-by: Kees Cook <keescook@chromium.org>
>
> -Kees
>
>>



Applied to linux-kbuild/fixes.



-- 
Best Regards
Masahiro Yamada
