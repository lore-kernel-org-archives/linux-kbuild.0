Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18226 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751189AbdJ1PAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Oct 2017 11:00:48 -0400
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=COgOc4MM7Ex1j8d_fXDuW0uUTueUEr-bL7NESB4hrWw@mail.gmail.com>
References: <20171026201744.89744-1-ndesaulniers@google.com>
 <CAK7LNASyP3x8wnvv_Eo_CbHehY5+pPjcpJFAn3fw8NAAi00GQA@mail.gmail.com> <CAKwvOd=COgOc4MM7Ex1j8d_fXDuW0uUTueUEr-bL7NESB4hrWw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 28 Oct 2017 23:59:59 +0900
Message-ID: <CAK7LNASOVBaMLTN2wiAQJzD06_HAqSCED4amqU4VXws8ZbOVEA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix linker feature test macros when cross
 compiling with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Ingo Molnar <mingo@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-28 3:28 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
> + linux-kbuild@vger.kernel.org
>
> On Fri, Oct 27, 2017 at 4:20 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> I do not like to add $(CLANG_TARGET) to a place for common helpers.
>> Instead of $(CLANG_TARGET), please add
>> $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS)
>> to cc-ldoption and ld-option.
>
> Thanks for the review.  I agree that sounds like a better option.
>
>> I have two requests next time:
>>   - please include  linux-kbuild@vger.kernel.org in your To list
>
> Sure thing. scripts/get_maintainer.pl does not recommend that list for
> this file; is there a way to explicitly add that list to the
> recommendation for that source file?

Ah, I realized MAINTAINERS does not claim the maintainership
of this file.

There are so many misc scripts
in scripts/, so I hesitate to add
scripts/* pattern to MAINTAINERS.




>>   - please base your patch on linux-kbuild/kbuild branch
>
> Will do. Do I need to note it's based off that branch? Otherwise wont
> 0-day bot complain that my patch doesn't apply/build on torvalds/linux
> ?

I am not sure in which case the 0-day bot complain about it.

Now, I applied v2.
If the bot find a problem, it will send us a report.


-- 
Best Regards
Masahiro Yamada
