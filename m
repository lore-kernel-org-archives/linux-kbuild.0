Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36421 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754489AbbDKQg3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Apr 2015 12:36:29 -0400
MIME-Version: 1.0
In-Reply-To: <1428701143.17822.72.camel@x220>
References: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
	<1428701143.17822.72.camel@x220>
Date: Sat, 11 Apr 2015 18:36:27 +0200
Message-ID: <CABv5NL_uwXv=wNm7h7u_Y1FW5EsqVDdTcB6_dDXemVuVvEbCmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
From: Stefan Hengelein <stefan.hengelein@fau.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2015-04-10 23:25 GMT+02:00 Paul Bolle <pebolle@tiscali.nl>:
> [Removed Yann. Added the people that I hope might actually understand
> what this is all about.]
>
> On Wed, 2015-04-08 at 16:56 -0700, Gregory Fong wrote:
>> get_symbol_str() was assuming that symbols would only have a single
>> property for the purpose of printing define and depends information.
>> This is not true, and one current example is FRAME_POINTER which is
>> both in lib/Kconfig.debug and arch/arm/Kconfig.debug.
>>
>> In order to print out the correct Defined and Depends info, iterate
>> over all properties associated with the given symbol, similarly to was
>> done for selects.  And for depends, rather than iterating over the
>> property, just use the direct dependency expression.
>>
>> CONFIG_FRAME_POINTER text, before:
>>   Defined at lib/Kconfig.debug:323
>>   Depends on: DEBUG_KERNEL [=y] && (ARM [=y] || CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS [=n]
>>
>> After:
>>   Defined at lib/Kconfig.debug:323, arch/arm/Kconfig.debug:35
>>   Depends on: DEBUG_KERNEL [=y] && (ARM [=y] || CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS [=n] || !THUMB2_KERNEL [=n]
>
> Note that there are currently six places where FRAME_POINTER is defined:
>     arch/arm/Kconfig.debug:35:config FRAME_POINTER
>     arch/arm64/Kconfig.debug:5:config FRAME_POINTER
>     arch/hexagon/Kconfig:40:config FRAME_POINTER
>     arch/m32r/Kconfig.debug:13:config FRAME_POINTER
>     arch/sparc/Kconfig.debug:19:config FRAME_POINTER
>     lib/Kconfig.debug:323:config FRAME_POINTER
>
> Anyhow, does anyone dare to state that the After: line above describes
> FRAME_POINTER for arm correctly? (Of course, I could dive in the semi
> documented kconfig code myself. But that might mean that Gregory will be
> waiting for feedback for quite some time.)
>

With my current knowledge of kconfig i would say: depends on what the
output of this is used for.
If you're reading the dependency list as "what do i have to enable to
be able to choose a value for FRAME_POINTER" and think, THUMB2_KERNEL
would be a good choice to leave disabled, you're going to have a bad
time.
(The second definition in arm/Kconfig.debug doesn't have a prompt and
the default has additional conditions)

If it should just point out, FRAME_POINTER could be enabled, the
"After Depends on:" is right. However, the conditions for the Default
in the second definition still would have to be satisfied.


If the whole list of kconfig menus is dumped, i'd expect there to be a
second print:
Defined at arch/arm/Kconfig.debug:35
Depends on: !THUMB2_KERNEL [=n]


After doing some reading:
the function is used in the search and help function for mconf to
print the dependencies and, at least in my output, did include a
Prompt statement. i'd say to add "!THUMB2_KERNEL" to the dependency
could be misleading! however the second definition of the symbol is
not hit by a search for FRAME_POINTER. I personally would prefer to
additionally find the second definition that doesn't a prompt and
other dependencies instead of adding them to the first entry, but
that's just my personal preference.


Stefan


>> Removes now-unused function get_symbol_prop().
>
> It might be better to do that in a separate patch.
>
>> Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
>> ---
>>  scripts/kconfig/menu.c | 35 +++++++++++++++--------------------
>>  1 file changed, 15 insertions(+), 20 deletions(-)
>>
>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index 72c9dba..da482ff 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -601,18 +601,6 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>>  }
>>
>>  /*
>> - * get property of type P_SYMBOL
>> - */
>> -static struct property *get_symbol_prop(struct symbol *sym)
>> -{
>> -     struct property *prop = NULL;
>> -
>> -     for_all_properties(sym, prop, P_SYMBOL)
>> -             break;
>> -     return prop;
>> -}
>> -
>> -/*
>>   * head is optional and may be NULL
>>   */
>>  void get_symbol_str(struct gstr *r, struct symbol *sym,
>> @@ -637,15 +625,22 @@ void get_symbol_str(struct gstr *r, struct symbol *sym,
>>       for_all_prompts(sym, prop)
>>               get_prompt_str(r, prop, head);
>>
>> -     prop = get_symbol_prop(sym);
>> -     if (prop) {
>> -             str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
>> +     hit = false;
>> +     for_all_properties(sym, prop, P_SYMBOL) {
>> +             if (!hit) {
>> +                     str_append(r, "  Defined at ");
>> +                     hit = true;
>> +             } else
>> +                     str_append(r, ", ");
>> +             str_printf(r, _("%s:%d"), prop->menu->file->name,
>>                       prop->menu->lineno);
>> -             if (!expr_is_yes(prop->visible.expr)) {
>> -                     str_append(r, _("  Depends on: "));
>> -                     expr_gstr_print(prop->visible.expr, r);
>> -                     str_append(r, "\n");
>> -             }
>> +     }
>> +     if (hit)
>> +             str_append(r, "\n");
>> +     if (!expr_is_yes(sym->dir_dep.expr)) {
>> +             str_append(r, _("  Depends on: "));
>> +             expr_gstr_print(sym->dir_dep.expr, r);
>> +             str_append(r, "\n");
>>       }
>>
>>       hit = false;
>
> Thanks,
>
>
> Paul Bolle
>
