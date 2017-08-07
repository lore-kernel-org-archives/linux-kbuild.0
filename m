Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:42931 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751390AbdHGBBv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Aug 2017 21:01:51 -0400
MIME-Version: 1.0
In-Reply-To: <20170802164650.GG84665@google.com>
References: <20170721215657.81631-1-mka@chromium.org> <20170802164650.GG84665@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 7 Aug 2017 10:01:41 +0900
Message-ID: <CAK7LNAQY6eWiD=JVFbKtEoq2pdLhGJc18OfP97GkyVuFUoAEpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Add macros cc-option-3 and __cc-option-3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>

Hi Matthias,

Sorry for my late reply.

2017-08-03 1:46 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> El Fri, Jul 21, 2017 at 02:56:56PM -0700 Matthias Kaehlcke ha dit:
>
>> The macro cc-option receives two parameters (the second may be empty). It
>> returns the first parameter if it is a valid compiler option, otherwise
>> the second one. It is not evaluated if the second parameter is a valid
>> compiler option. This seems to be fine in virtually all cases, however
>> there are scenarios where the second paramater needs to be evaluated too,
>> and an empty value (or a third option) should be returned if it is not
>> valid.
>>
>> The macro cc-option-3 receives three parameters and returns parameter 1
>> or 2 (in this order) if one of them is found to be a valid compiler
>> option, and otherwise paramater 3. The macro __cc-option-3 works
>> analogously.
>
> Any comment on this?
>
> Thanks
>
> Matthias
>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>>  scripts/Kbuild.include | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> index dd8e2dde0b34..dc83635f2317 100644
>> --- a/scripts/Kbuild.include
>> +++ b/scripts/Kbuild.include
>> @@ -113,6 +113,11 @@ as-instr = $(call try-run,\
>>  __cc-option = $(call try-run,\
>>       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
>>
>> +# __cc-option-3
>> +# Usage: MY_CFLAGS += $(call __cc-option-3,$(CC),$(MY_CFLAGS),\
>> +#    -mpreferred-stack-boundary=2,-mstack-alignment=4,)
>> +__cc-option-3 = $(call __cc-option,$(1),$(2),$(3),$(call __cc-option,$(1),$(2),$(4),$(5)))
>> +
>>  # Do not attempt to build with gcc plugins during cc-option tests.
>>  # (And this uses delayed resolution so the flags will be up to date.)
>>  CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
>> @@ -123,6 +128,10 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
>>  cc-option = $(call __cc-option, $(CC),\
>>       $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
>>
>> +# cc-option-3
>> +# Usage: cflags-y += $(call cc-option-3,-mpreferred-stack-boundary=3,-mstack-alignment=8,)
>> +cc-option-3 = $(call cc-option,$(1),$(call cc-option,$(2),$(3)))


I do not like this macro much for the following reasons:


[1]
I guess your motivation is to evaluate the second option,
not receive the third option.

If this is the demand, I thought it might be nicer to
change cc-option to always evaluate the second option.

(I do no have a good idea for the implementation.)


[2]

cc-option-3 = $(call cc-option,$(1),$(call cc-option,$(2),$(3)))

evaluates the inner $(call cc-option,) first.

This works a bit differently from our expectation.


For example, let's consider the following case.

 $(call cc-option-3,-Oz,-Os,-O2)


I think we generally expect -Oz, -Os are tested in this order.
(If -Oz is supported by the compiler, the test for -Os will be skipped.)


In fact, cc-option-3 tests  -Os, -Oz in this order
because inner cc-option is evaluated before the outer one.
The test for -Os may or may not be necessary.

I do not have a good idea to improve this...





-- 
Best Regards
Masahiro Yamada
