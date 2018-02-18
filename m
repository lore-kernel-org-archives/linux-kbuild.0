Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:34083 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751374AbeBRNkt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 08:40:49 -0500
Received: by mail-vk0-f68.google.com with SMTP id z190so2281699vkg.1
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Feb 2018 05:40:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFkk2KT8r8=ovH32zSU4k=SKnj-9zPGec10G4yAQP7o1frXQBg@mail.gmail.com>
References: <cover.1518826148.git.erosca@de.adit-jv.com> <0ed37972989a9ba7a8b50777bd60ea8f46495a2a.1518826148.git.erosca@de.adit-jv.com>
 <CAFkk2KT8gQz+wmMagq-v4zLX7XuZ6MahN8KQ6SqtaAMRo5o7sA@mail.gmail.com>
 <20180218110702.GA26185@example.com> <20180218130246.eqfa46eswut5xwmv@huvuddator>
 <CAFkk2KRvy+jNphg2oFTofRZGCuRKgYy8z3+f9dNopfwftW=K6Q@mail.gmail.com> <CAFkk2KT8r8=ovH32zSU4k=SKnj-9zPGec10G4yAQP7o1frXQBg@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 18 Feb 2018 14:40:47 +0100
Message-ID: <CAFkk2KQ9FZOBULCRVR=8DJs7sPGfkp5Uv5COCGvUAsoVstPqTg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] kconfig: Print reverse dependencies in groups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, Feb 18, 2018 at 2:35 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> On Sun, Feb 18, 2018 at 2:19 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>> On Sun, Feb 18, 2018 at 2:02 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>>> On Sun, Feb 18, 2018 at 12:07:02PM +0100, Eugeniu Rosca wrote:
>>>> If expr_print_newline is renamed to expr_print_{select,revdep}, then
>>>> I still face the need of expr_print_newline. So, I kept the *newline()
>>>> function in place and came up with below solution to aggregate
>>>> duplicated code. Please, let me know if it looks OK to you (btw, it
>>>> creates a slightly higher --stat compared to current solution).
>>>>
>>>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>>>> index 48b99371d276..a6316e5681d9 100644
>>>> --- a/scripts/kconfig/expr.c
>>>> +++ b/scripts/kconfig/expr.c
>>>> @@ -1189,6 +1189,34 @@ expr_print_newline(struct expr *e,
>>>>       expr_print(e, fn, data, prevtoken);
>>>>  }
>>>>
>>>> +static void
>>>> +expr_print_revdep(struct expr *e,
>>>> +               void (*fn)(void *, struct symbol *, const char *),
>>>> +               void *data,
>>>> +               int prevtoken,
>>>> +               enum print_type type)
>>>> +{
>>>> +     switch (type) {
>>>> +     case PRINT_REVDEP_ALL:
>>>> +             expr_print_newline(e, fn, data, prevtoken);
>>>> +             break;
>>>> +     case PRINT_REVDEP_YES:
>>>> +             if (expr_calc_value(e) == yes)
>>>> +                     expr_print_newline(e, fn, data, prevtoken);
>>>> +             break;
>>>> +     case PRINT_REVDEP_MOD:
>>>> +             if (expr_calc_value(e) == mod)
>>>> +                     expr_print_newline(e, fn, data, prevtoken);
>>>> +             break;
>>>> +     case PRINT_REVDEP_NO:
>>>> +             if (expr_calc_value(e) == no)
>>>> +                     expr_print_newline(e, fn, data, prevtoken);
>>>> +             break;
>>>> +     default:
>>>> +             break;
>>>> +     }
>>>> +}
>>>> +
>>>
>>> I think it's fine to have a separate expr_print_newline() function
>>> still. Getting rid of the repetition still makes it more readable to me.
>>>
>>> Maybe you could do something like this if you want to eliminate
>>> expr_print_newline() though. AFAICS, it isn't used outside
>>> expr_print_revdep().
>>>
>>>         static void
>>>         expr_print_revdep(struct expr *e,
>>>                           void (*fn)(void *, struct symbol *, const char *),
>>>                           void *data,
>>>                           int prevtoken,
>>>                           enum print_type type)
>>>         {
>>>                 if (type == PRINT_REVDEP_ALL                              ||
>>>                     type == PRINT_REVDEP_YES && expr_calc_value(e) == yes ||
>>>                     type == PRINT_REVDEP_MOD && expr_calc_value(e) == mod ||
>>>                     type == PRINT_REVDEP_NO  && expr_calc_value(e) == no) {
>>>
>>>                         fn(data, NULL, "\n - ");
>>>                         expr_print(e, fn, data, prevtoken);
>>>                 }
>>>         }
>>>
>>>
>>> Could turn that into a switch over 'type' and set a 'print_revdep' flag
>>> which is checked at the end too, if you'd prefer that:
>>>
>>>         switch (type) {
>>>         ...
>>>         case PRINT_REVDEP_YES:
>>>                 print_revdep = (expr_calc_value(e) == yes);
>>>                 break;
>>>         ...
>>>         }
>>>
>>>         if (print_revdep) {
>>>                 fn(data, NULL, "\n - ");
>>>                 expr_print(e, fn, data, prevtoken);
>>>         }
>>>
>>>
>>> Or return early:
>>>
>>>         case PRINT_REVDEP_YES:
>>>                 if (expr_calc_value(e) != yes)
>>>                         return;
>>>                 break;
>>>         ...
>>>         }
>>>
>>>         fn(data, NULL, "\n - ");
>>>         expr_print(e, fn, data, prevtoken);
>>>
>>>
>>> The original version is already fine by me though. The 'if' version
>>> seems pretty direct too.
>>>
>>> Cheers,
>>> Ulf
>>
>> Hmm... was thinking that you could get rid of 'print_type' and just
>> pass a tristate value for a moment too. There's PRINT_NORMAL and
>> PRINT_REVDEP_ALL to deal with as well though, so it'd get messy.
>>
>> Cheers,
>> Ulf
>
> One last bikeshedding: Could factor out just the check into a function
> and do something like this in __expr_print():
>
>         if (select_has_type(e, type))
>                 expr_print_newline(e, fn, data, prevtoken);
>
> Having a function that's just one big 'if' feels slightly silly,
> though it's not horrible here either IMO.

Referring to this version that is:

        static void
        expr_print_revdep(struct expr *e,
                          void (*fn)(void *, struct symbol *, const char *),
                          void *data,
                          int prevtoken,
                          enum print_type type)
        {
                if (type == PRINT_REVDEP_ALL                              ||
                    type == PRINT_REVDEP_YES && expr_calc_value(e) == yes ||
                    type == PRINT_REVDEP_MOD && expr_calc_value(e) == mod ||
                    type == PRINT_REVDEP_NO  && expr_calc_value(e) == no) {

                        fn(data, NULL, "\n - ");
                        expr_print(e, fn, data, prevtoken);
                }
        }

Cheers,
Ulf
