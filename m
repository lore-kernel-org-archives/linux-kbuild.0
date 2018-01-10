Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:38402 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932139AbeAJHSH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 02:18:07 -0500
MIME-Version: 1.0
In-Reply-To: <070e7d03-b1a7-430f-709b-bb5fe9e2a0a3@intel.com>
References: <20171219012656.23728-1-marc.herbert@intel.com>
 <CAK7LNAR8HedCgZAk1fY9rA8HERh5weQCjWXkP2SXuhzRRWVhVQ@mail.gmail.com> <070e7d03-b1a7-430f-709b-bb5fe9e2a0a3@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 10 Jan 2018 16:17:21 +0900
Message-ID: <CAK7LNASR8Qmo85FGr0wW-4t2_uTmDZVSituLLuRm73_+Qqstmw@mail.gmail.com>
Subject: Re: [PATCH] Remove silentoldconfig from "make help"; fix
 kconfig/conf's help
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marc Herbert <Marc.Herbert@intel.com>
Cc: Thiago Macieira <thiago.macieira@intel.com>, Josh Triplett <josh@joshtriplett.org>, Guenter Roeck <groeck@google.com>, Wayne Boyer <wayne.boyer@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2018-01-06 7:21 GMT+09:00 Marc Herbert <Marc.Herbert@intel.com>:
> On 04/01/2018 09:21, Masahiro Yamada wrote:
>> (+CC Michal's new address)
>>
>> 2017-12-19 10:26 GMT+09:00 Marc Herbert <marc.herbert@intel.com>:
>>> As explained by Michal Marek at https://lkml.org/lkml/2011/8/31/189
>>> silentoldconfig has become a misnomer. It has become an internal
>>> interface and "oldconfig" is just as silent now.
>>
>>
>> Hmm, I'd like to be sure about your intention.
>
> My main intention is to stop advertising the now internal silentoldconfig
> target in the user interface. A secondary goal is to provide an accurate
> background information in the commit message.

OK.


>> "oldconfig" is not silent.  (nor is silentoldconfig).
>> When it finds a new symbol, it will show a dialog
>> to ask users to input a value.
>>
>> "olddefconfig" is really silent
>> because it automatically sets new symbols to default.
>
> I think "silent" is typically missing well-defined semantics (another appeal
> to remove "silentoldconfig" from the user interface...) and I'm not sure
> "silent" ever meant "non-interactive" as you just described here. I think
> silent just meant "quiet(er)" here.

I imagined "silent" meant "non-interactive" at first,
but, you are right, Michal probably referred to this word "quiet(er)".


> This commit message was purely based on Michal's message that I'm
> referencing. He wrote there: "... nowadays oldconfig is silent as well"
>
> I can change that part of the commit message to:
>
> | As explained by Michal Marek at https://lkml.org/lkml/2011/8/31/189
> | silentoldconfig has become a misnomer. It has become an internal
> | interface and "oldconfig" is just as QUIET now.


Sounds good.

(but, currently, there is a slight difference of quiet level
between oldconfig and silentoldconfig)

See below.


> ... or to anything else you prefer.
>
>
>> If you drop silentoldconfig help,
>> the "Same as silentoldconfig" is not sensible.
>> You need to update this line, too.
>
>> I think "Same as oldconfig but ..." will be OK.
>
> Agreed, thank you! I will also search for other occurrences.
>
>
>> What do you mean by "oldconfig used to be more verbose" ?
>> Did oldconfig change its behavior?
>>
>> Unless I am missing something, the current behavior of "oldconfig" has
>> been the same at least since the beginning of the git era.
>
> Again that's what Michal's message claimed in 2011. I don't know to which
> even older era he was referring to.
>
> It was already quite time consuming to understand and verify the subtle
> nuances of the current state (which luckily still matches what Michal
> reported 7 years ago), so for the even older past I just deferred to Michal.
>
> Now I just checked out v2.6.12-rc2 (2005) and it looks like Michal was
> right: oldconfig was much more verbose then; it was dumping the entire
> .config file on stdout.

You and Michal are right.

It is commit cd9140e1e73a ("kconfig: make oldconfig is now less chatty").


I took a closer look at this.

Currently, oldconfig is a little bit more verbose than silentoldconfig,
but it should not be.  I'd like to fix it.

I attached a test case in my patch
https://patchwork.kernel.org/patch/10154095/

At the end of its git-log,
I attached deeper analysis of the history of oldconfig.
Please check it out if you are interested.


> If you prefer I can keep referring to Michal's message but without
> paraphrasing it at all; sticking to the description of the current
> behaviours and not mentioning any possible past behaviour and saving all of
> us the time spent doing archeology. Just let me know, thx!

Sounds good to me.  (I recorded the backgound in my patch, anyway...)

I leave the detail of the commit log up to you.



> +       printf("  --silentoldconfig       Similar to oldconfig but:\n"
> +              "                            - no re-formatting of .config when nothing's missing\n"
> +              "                            - generates configuration in include/{generated/,config/}\n"
> +              "                          (oldconfig used to be more verbose)\n");

How about "Similar to oldconfig but, generates configuration ..." ?

I'd like to drop the following description.

"no re-formatting of .config when nothing's missing"
   This is very subtle difference, less important.
   It may not be stable in the future.


"(oldconfig used to be more verbose)"
   The historical background is git.
   If people are interested in archeology,
   they would be able to do it by "git log", "git blame", etc.
   We are generally interested in the current behavior.



-- 
Best Regards
Masahiro Yamada
