Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:32928 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751607AbeBWWrR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 17:47:17 -0500
Received: by mail-ua0-f194.google.com with SMTP id p12so6908748uad.0
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 14:47:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <64336784-9e2e-e049-e845-508e481880a8@infradead.org>
References: <20180223060901.4052-1-ulfalizer@gmail.com> <CAFkk2KQPjeyE-E_TW3NBwFXbE-Q2mNnn1yAFkoA5w6xLQQ9hrw@mail.gmail.com>
 <CAK7LNAQPMuWAOjUdOgxp2KdSg0MSkz4giXiX-RxUBQTaWWws=Q@mail.gmail.com>
 <CAK7LNAQg85PpqMP4u-dh-m2rmSiz5JmhnfX6=c4Mbm5EskMPxg@mail.gmail.com>
 <20180223213313.loecroholntn4iqz@huvuddator> <64336784-9e2e-e049-e845-508e481880a8@infradead.org>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 23 Feb 2018 23:47:16 +0100
Message-ID: <CAFkk2KR9RtE=9+PYOj=0Gi_YQ7-t3tQNBRQsVCXuGHr8B6-aGg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: do not write 'n' defaults to .config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>

On Fri, Feb 23, 2018 at 11:19 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 02/23/2018 01:33 PM, Ulf Magnusson wrote:
>> On Sat, Feb 24, 2018 at 12:59:51AM +0900, Masahiro Yamada wrote:
>>> 2018-02-23 22:25 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>>>> 2018-02-23 15:14 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
>>>>> On Fri, Feb 23, 2018 at 7:09 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>>>>>> === Background ===
>>>>>>
>>>>>> A "# CONFIG_FOO is not set" line is written to .config for visible
>>>>>> bool/tristate symbols with value n. The idea is to remember the user
>>>>>> selection without having to set a Makefile variable (having undefined
>>>>>> Make variables correspond to n is handy when testing them in the
>>>>>> Makefiles).
>>>>>>
>>>>>> Currently, a "# CONFIG_FOO is not set" line is also written to .config
>>>>>> for all bool/tristate symbols that get the value n through a 'default'.
>>>>>> This is inconsistent with how 'select' and 'imply' work, which only
>>>>>> write non-n symbols. It also seems redundant:
>>>>>>
>>>>>>   - If the symbol is visible and has value n, then
>>>>>>     "# CONFIG_FOO is not set" will always be written anyway.
>>>>>>
>>>>>>   - If the symbol is not visible, then "# CONFIG_FOO is not set" has no
>>>>>>     effect on it.
>>>>>>
>>>>>>   - If the symbol becomes visible later, there shouldn't be any harm in
>>>>>>     recalculating the default value at that point.
>>>>>>
>>>>>> === Changes ===
>>>>>>
>>>>>> Change sym_calc_value() to only set SYMBOL_WRITE (write to .config) for
>>>>>> non-n defaults. This reduces the size of the x86 .config on my system by
>>>>>> about 1% (due to removed "# CONFIG_FOO is not set" entries).
>>>>>>
>>>>>> One side effect of this change is making 'default n' equivalent to
>>>>>> having no explicit default. That might make it clearer to people that
>>>>>> 'default n' is redundant.
>>>>>>
>>>>>> This change only affects generated .config files and not autoconf.h:
>>>>>> autoconf.h only includes #defines for non-n bool/tristate symbols.
>>>>>>
>>>>>> === Testing ===
>>>>>>
>>>>>> The following testing was done with the x86 Kconfigs:
>>>>>>
>>>>>>  - .config files generated before and after the change were compared to
>>>>>>    verify that the only difference is some '# CONFIG_FOO is not set'
>>>>>>    entries disappearing. A couple of these were inspected manually, and
>>>>>>    most turned out to be from redundant 'default n/def_bool n'
>>>>>>    properties.
>>>>>>
>>>>>>  - The generated include/generated/autoconf.h was compared before and
>>>>>>    after the change and verified to be identical.
>>>>>>
>>>>>>  - As a sanity check, the same modification was done to Kconfiglib.
>>>>>>    The Kconfiglib test suite was then run to check for any mismatches
>>>>>>    against the output of the C implementation.
>>>>>>
>>>>>> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
>>>>>> ---
>>>>>>  scripts/kconfig/symbol.c | 3 ++-
>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>>>>>> index cca9663be5dd..02eb8b10a83c 100644
>>>>>> --- a/scripts/kconfig/symbol.c
>>>>>> +++ b/scripts/kconfig/symbol.c
>>>>>> @@ -403,9 +403,10 @@ void sym_calc_value(struct symbol *sym)
>>>>>>                         if (!sym_is_choice(sym)) {
>>>>>>                                 prop = sym_get_default_prop(sym);
>>>>>>                                 if (prop) {
>>>>>> -                                       sym->flags |= SYMBOL_WRITE;
>>>>>>                                         newval.tri = EXPR_AND(expr_calc_value(prop->expr),
>>>>>>                                                               prop->visible.tri);
>>>>>> +                                       if (newval.tri != no)
>>>>>> +                                               sym->flags |= SYMBOL_WRITE;
>>>>>>                                 }
>>>>>>                                 if (sym->implied.tri != no) {
>>>>>>                                         sym->flags |= SYMBOL_WRITE;
>>>>>> --
>>>>>> 2.14.1
>>>>>>
>>>>>
>>>>> This stuff gets pretty obscure, so please tell me if you can think of
>>>>> any practical benefits to remembering an n default as a user selection
>>>>> for non-visible symbols (which is all '# CONFIG_FOO is not set' does
>>>>> in practice). I couldn't think of anything.
>>>>>
>>>>
>>>> In the context of
>>>>
>>>> config CC_HAS_STACKPROTECTOR
>>>>        def_bool $(cc-option -fstack-protector)
>>>>
>>>>
>>>> Currently, we have 3 cases:
>>>>
>>>>  [1] CONFIG_CC_HAS_STACKPROTECTOR=y
>>>>        -> compiler flag is supported
>>>>  [2] # CONFIG_CC_HAS_STACKPROTECTOR is not set
>>>>        -> compiler flag is unsupported
>>>>  [3] Missing
>>>>        -> The symbol was hidden probably due to unmet "if ... endif"
>>>>
>>>>
>>>> With this change, [2] will be turned into [3].
>>>>
>>>> That is the only drawback I came up with.
>>>>
>>>> I am not sure how many people want to check .config
>>>> to know the compiler capability...
>>>>
>>>
>>>
>>> I thought a bit more, then probably the grammatical
>>> consistency would win.  (default n is always redundant)
>>
>> The behavior should be easy to explain in kconfig-language.txt too: A
>> missing entry means n, except visible n-valued symbols generate a
>> '# CONFIG_FOO is not set' comment just to keep track of the user's choice.
>> No weird exception for 'default'.
>>
>> That would demystify those '...is not set' lines too.
>>
>>>
>>> I want to apply this, but take a bit time
>>> in case somebody may have comments.
>>>
>>>
>>> BTW, do you want to check redundant 'default n'
>>> by checkpatch.pl ?
>>
>> Was thinking of that. Guess you could generate a warning for any of the
>> following:
>>
>>       default n
>>       default "n"
>>       default 'n'
>
> We also sometimes see:
>         default N
> :)
>

Could add a warning that looks for 'default N/M/Y' and says to use
'default n/m/y' as well, maybe (after which you'd get a new warning
telling you to get rid of the "default n"... never happy :P).

Masahiro:
Could you bump https://lkml.org/lkml/2018/2/22/935 if you're happy
with it? Maybe Joe is waiting to see if you have objections.

After that I could add some new checks.

Cheers,
Ulf
