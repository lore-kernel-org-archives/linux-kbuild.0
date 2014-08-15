Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47228 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbaHOHiF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Aug 2014 03:38:05 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH v4] kconfig/symbol.c: handle choice_values that depend on 'm' symbols
In-Reply-To: <CADYTM3b6iL3xqoZTkHxbS3aUfZMywDkYekZVmGQy2TQt-4SnTA@mail.gmail.com>
	(Bin Liu's message of "Thu, 14 Aug 2014 08:54:08 -0500")
References: <ghr4asl38m.fsf@lena.gouders.net>
	<ghk3gkl32u.fsf@lena.gouders.net> <20131118180813.GB3458@free.fr>
	<CADYTM3YPscaS18KqAOkymRqWKGp4vQFsrefZNtuZddpkDoBWkg@mail.gmail.com>
	<ghd2c3h8bc.fsf@quad.gouders.net>
	<CADYTM3b6iL3xqoZTkHxbS3aUfZMywDkYekZVmGQy2TQt-4SnTA@mail.gmail.com>
Date: Fri, 15 Aug 2014 09:37:01 +0200
Message-ID: <ghwqaayzj6.fsf@quad.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bin Liu <binmlist@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Bin Liu <binmlist@gmail.com> writes:

> Dirk,
>
> On Thu, Aug 14, 2014 at 1:52 AM, Dirk Gouders <dirk@gouders.net> wrote:
>> Bin Liu <binmlist@gmail.com> writes:
>>
>>> All,
>>>
>>> On Mon, Nov 18, 2013 at 12:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>> Dirk, All,
>>>>
>>>> On 2013-11-07 15:05 +0100, Dirk Gouders spake thusly:
>>>>> If choices consist of choice_values that depend on symbols set to 'm',
>>>>> those choice_values are not set to 'n' if the choice is changed from
>>>>> 'm' to 'y' (in which case only one active choice_value is allowed).
>>>>> Those values are also written to the config file causing modules to be
>>>>> built when they should not.
>>>>>
>>>>> The following config can be used to reproduce and examine the problem;
>>>>> with the frontend of your choice set "Choice 0" and "Choice 1" to 'm',
>>>>> then set "Tristate Choice" to 'y' and save the configuration:
>>>>>
>>>>> config modules
>>>>>       boolean modules
>>>>>       default y
>>>>>       option modules
>>>>>
>>>>> config dependency
>>>>>       tristate "Dependency"
>>>>>       default m
>>>>>
>>>>> choice
>>>>>       prompt "Tristate Choice"
>>>>>       default choice0
>>>>>
>>>>> config choice0
>>>>>       tristate "Choice 0"
>>>>>
>>>>> config choice1
>>>>>       tristate "Choice 1"
>>>>>       depends on dependency
>>>>>
>>>>> endchoice
>>>>>
>>>>> This patch sets choice_values' visibility that depend on symbols set
>>>>> to 'm' to 'n' if the corresponding choice is set to 'y'.  This makes
>>>>> them disappear from the choice list and will also cause the
>>>>> choice_values' value set to 'n' in sym_calc_value() and as a result
>>>>> they are written as "not set" to the resulting .config file.
>>>>>
>>>>> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>>>> Signed-off-by: Dirk Gouders <dirk@gouders.net>
>>>>> Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>>>
>>>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>>
>>>> It will be in my tree soon. Thanks!
>>>
>>> I don't see this patch in 3.16 but 3.16 does not have the issue any
>>> more. Anyone has an idea how the issue got fixed? I am trying to find
>>> the right patch to backport.
>>
>> With the above sample kconfig I still see the issue.  How did you
>> notice the issue got fixed?
>
> I did not pay much attention on the above sample kconfig, but just
> focused on the USB gadget driver kconfig issue initially reported by
> Sebastian. I saw the issue exists in 3.14, but does not in 3.16,
> unless I messed up with my test. I will test 3.16 again some time next
> week.

Hi Bin,

I now also re-tested the initially reported steps to reproduce the
issue:

------------------------------------------------------------------------
> in USB gadget menu (that is Device Drivers ---> USB support ---> USB
> Gadget Support --->  USB Gadget Drivers) I can create a configuration
> which is "lost". Here is how to reproduce it:
> 
> - first config two gadgets as M:
>  <M>   USB Gadget Drivers
>  <M>     Audio Gadget
>  <M>     Ethernet Gadget
>  <M>     MIDI Gadget
> 
>  save config & leave
> 
> - now start menu config again and go to the same menu, now select
>   built-in:
>   <*>   USB Gadget Drivers (Ethernet Gadget
>   the ethernet gadget is chosen automatically because we can have only
>   one gadget selected.
>   save config & leave
> 
> - step three, go back to the menu and you will see that everything is
>   as it was (the <*> is ignored).
------------------------------------------------------------------------

Here, I still see the problem (I was wondering if the issue has been
solved/gone by a kconfig-file modification).

Perhaps, Sebastian could check if the problem, he reported still exists...

Dirk

>
> Regards,
> -Bin.
>
>>
>> Dirk
>>
>>>
>>> Thanks,
>>> -Bin.
>>>
>>>>
>>>> Regards,
>>>> Yann E. MORIN.
>>>>
>>>>> ---
>>>>>  scripts/kconfig/symbol.c | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>>>>> index c9a6775..06d96c9 100644
>>>>> --- a/scripts/kconfig/symbol.c
>>>>> +++ b/scripts/kconfig/symbol.c
>>>>> @@ -189,12 +189,23 @@ static void sym_validate_range(struct symbol *sym)
>>>>>  static void sym_calc_visibility(struct symbol *sym)
>>>>>  {
>>>>>       struct property *prop;
>>>>> +     struct symbol *choice_sym = NULL;
>>>>>       tristate tri;
>>>>>
>>>>>       /* any prompt visible? */
>>>>>       tri = no;
>>>>> +
>>>>> +     if (sym_is_choice_value(sym))
>>>>> +             choice_sym = prop_get_symbol(sym_get_choice_prop(sym));
>>>>> +
>>>>>       for_all_prompts(sym, prop) {
>>>>>               prop->visible.tri = expr_calc_value(prop->visible.expr);
>>>>> +             /*
>>>>> +              * choice_values with visibility 'mod' are not visible if the
>>>>> +              * corresponding choice's value is 'yes'.
>>>>> +              */
>>>>> +             if (prop->visible.tri == mod && (choice_sym && choice_sym->curr.tri == yes))
>>>>> +                     prop->visible.tri = no;
>>>>>               tri = EXPR_OR(tri, prop->visible.tri);
>>>>>       }
>>>>>       if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
>>>>> --
>>>>> 1.8.4
>>>>>
>>>>
>>>> --
>>>> .-----------------.--------------------.------------------.--------------------.
>>>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>>>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>>>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>>>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>>>> '------------------------------^-------^------------------^--------------------'
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
