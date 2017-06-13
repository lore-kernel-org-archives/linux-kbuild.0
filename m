Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:23017 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751888AbdFMKOH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 06:14:07 -0400
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0NspZv+XPSzsaXhEy3WQ6X8-fnfQf1WV+-LV0Nn9jsmw@mail.gmail.com>
References: <20170613005531.77656-1-mka@chromium.org> <20170613005531.77656-2-mka@chromium.org>
 <638b79cf-a0e8-7986-d8b4-26d3a3808ec4@suse.com> <CAK8P3a0NspZv+XPSzsaXhEy3WQ6X8-fnfQf1WV+-LV0Nn9jsmw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Jun 2017 19:13:55 +0900
Message-ID: <CAK7LNARhhp2cJw=yxJTdB0_Cs4mBkkeHmNp7B9RYne92WXBQyw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Add cc-option-no-kbuild macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Matthias Kaehlcke <mka@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

2017-06-13 17:31 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Tue, Jun 13, 2017 at 9:49 AM, Michal Marek <mmarek@suse.com> wrote:
>> On 2017-06-13 02:55, Matthias Kaehlcke wrote:
>>> cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
>>> whether an option is supported or not. This is fine for options used to
>>> build the kernel itself, however some components like the x86 boot code
>>> use a different set of flags.
>>>
>>> Add the new macro cc-option-no-kbuild which does the same as cc-option
>>> except that it has an additional parameter with the compiler options
>>> which are used instead of KBUILD_CFLAGS and KBUILD_CPPFLAGS.
>>>
>>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>>> ---
>>>  scripts/Kbuild.include | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>>> index 61f87a99bf0a..d9fdc740105f 100644
>>> --- a/scripts/Kbuild.include
>>> +++ b/scripts/Kbuild.include
>>> @@ -128,6 +128,11 @@ cc-option-yn = $(call try-run,\
>>>  cc-option-align = $(subst -functions=0,,\
>>>       $(call cc-option,-falign-functions=0,-malign-functions=0))
>>>
>>> +# cc-option-no-kbuild
>>> +# Usage: cflags-no-kbuild-y += $(call cc-option-no-kbuild,<other flags>,-march=winchip-c6,-march=i586)
>>> +cc-option-no-kbuild = $(call try-run,\
>>> +     $(CC) -Werror $(filter-out $(GCC_PLUGINS_CFLAGS),$(1)) $(2) -c -x c /dev/null -o "$$TMP",$(2),$(3))
>>
>> As this is a version of cc-option with an extrra argument, how about
>> implementing cc-option as a shorthand for cc-option-no-kbuild? It would
>> make it more obvious what cc-option-no-kbuild does differently (it's
>> probably just me, but I was unable to infer the semantics from its name).
>
> Agreed, also the hostcc-option could be based on the same I think, if we
> also make the $(CC) an argument of the low-level helper.
>

Agree.  One possible implementation:

cc-option-raw = $(call try-run,\
             $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))

cc-option = $(call cc-option-raw, $(CC), $(KBUILD_CPPFLAGS)
$(CC_OPTION_CFLAGS),\
                                                                $(1), $(2))

This will allow us to do:
hostcc-option = $(call cc-option-raw, $(HOSTCC), $(HOSTCFLAGS), $(1), $(2))



Suggestion for a better name is welcome...


-- 
Best Regards
Masahiro Yamada
