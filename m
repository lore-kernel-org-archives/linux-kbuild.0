Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:37260 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932081AbbDMQEQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 12:04:16 -0400
MIME-Version: 1.0
In-Reply-To: <CADtm3G6FFxUWfg4KUfGCXTw1apZUFJrC2cExkmkfxD8DCHg+Uw@mail.gmail.com>
References: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
	<1428701143.17822.72.camel@x220>
	<CABv5NL_uwXv=wNm7h7u_Y1FW5EsqVDdTcB6_dDXemVuVvEbCmg@mail.gmail.com>
	<1428778617.17822.133.camel@x220>
	<CABv5NL-WxZyGbf0afrqa3aL0VGL6kLj3NCPqofB0xc_AuxSNPQ@mail.gmail.com>
	<1428783814.17822.150.camel@x220>
	<CABv5NL9LU15BN8KNqxYO+Vs1rY5KWKNkVmvQO4u-H3PCDqTUrw@mail.gmail.com>
	<1428791102.17822.175.camel@x220>
	<CABv5NL-Qtn6_etdJziUkDZZc=e8DYZfMgsMRxZjmozdG2sj7yA@mail.gmail.com>
	<CADtm3G6FFxUWfg4KUfGCXTw1apZUFJrC2cExkmkfxD8DCHg+Uw@mail.gmail.com>
Date: Mon, 13 Apr 2015 18:04:14 +0200
Message-ID: <CABv5NL_14Oefjaf=K=zJxbpajL=B0+ajY3JWYmN4B=fSqurbdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
From: Stefan Hengelein <stefan.hengelein@fau.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Gregory,
2015-04-13 3:06 GMT+02:00 Gregory Fong <gregory.0xf0@gmail.com>:
> Hi Paul and Stefan,
>
> Thanks for taking a look at this.  I think Stefan has touched upon why
> he thinks this change might (at least partially) make sense, but let
> me now try to explain the rationale behind this patch better than I
> did in the commit message.

yes, i missed where and how it was used in your commit message.

>
> On Sun, Apr 12, 2015 at 8:02 AM, Stefan Hengelein
> <stefan.hengelein@fau.de> wrote:
>>> Let's focus, for example, on m32r and FRAME_POINTER. The m32r entry for
>>> that symbol reads:
>>>         config FRAME_POINTER
>>>                 bool "Compile the kernel with frame pointers"
>>>                 help
>>>                   If you say Y here [...]
>>>
>>> 0) If one is building for m32r is that all there's to it? If so, "make
>>> menuconfig"'s search facility is serving the people building for m32r a
>>> load of crap.
>>>
>>> 1) If it's actually more complicated than that I think that anyone
>>> reading arch/m32r/Kconfig.debug is being duped. Things look simple but
>>> actually they are quite complicated. I think that's just wrong.
>>>
>>> What am I missing here?
>>
>> If you have a look at the definitions, lib/Kconfig.debug is included
>> before FRAME_POINTER is defined in m32r and the output in the search
>> facility looks indeed broken
>> as one "Defined at" is missing but there are somehow Location entries
>> (-> Kernel hacking    and  -> Kernel hacking -> compile time checks
>> and [...]) for both definitions in a weird order (i think (1) and (2)
>> might indicate both definitions)
>>
>> both declarations are valid in kconfig, you have two ways of enabling
>> the same symbol, one easy without conditions and one with conditions
>> and both with the same prompt.
>>
>> The search facility shows the first one that is found, you see the
>> complicated depends on but i think the text shown might not be
>> explicit enough to clarify you don't need to satisfy these complicated
>> conditions to actually choose a value.
>>
>
> Well, the thing is, you do need to satisfy _one_ of the set of
> conditions.  But unfortunately it's not not possible to see that from
> the search function because it prints out incomplete information.

Yes and no. You would need to satisfy "!THUMB2_KERNEL" to be able to
enable FRAME_POINTER but for the second definition to enable
FRAME_POINTER you'd still have to satisfy the conditions of the
default.
However, what you're missing here is what is printed before "Depends
on" or "Defined at".
Namely: Prompt: Compile the kernel with frame pointers

that entry suggests you will be able to see a prompt (meaning an entry
in menuconfig or conf) when "!THUMB2_KERNEL" is satisfied and that's
just wrong.

I don't know if it is difficult to achieve but i would prefer to have
something like:

Symbol: FRAME_POINTER
Type: boolean
(1) Defined at lib/Kconfig.debug:323
    Prompt: Compile the kernel with frame pointers
       Location:
          -> Kernel hacking
            -> Compile-time checks and compiler options
    Depends on: DEBUG_KERNEL [=y] && (CRIS || M68K || FRV || UML || AVR32 ...
    Selected by: ....

(2) Defined at arch/arm/Kconfig.debug:35
    Depends on: !THUMB2_KERNEL


when you try menuconfig for m32r you'll see 2 prompt entries, to
locations, one depends on. That implies you already see multiple
definitions when these multiple definitions have prompts, but
definitions without a prompt are missed or intentionally left out
because you can't influence them from menuconfig either way. (so see
what the second definition does, you'd have a look at
arch/arm/Kconfig.debug:35)

>
> This is exactly the motivation for this change.  When you search for
> FRAME_POINTER, you only get information on one "Defined at", and the
> only "Depends" information is from that definition.  This is clearly
> incorrect, as FRAME_POINTER is defined in multiple places, so the
> information printed does not cover its actual definitions or
> dependencies.  The printed "Selected by" information is, however,
> correct, because it actually uses the rev_dep expression.  This patch
> changes the "Depends" information to be similar: it will also print
> the actual expression used by kconfig used to determine whether its
> direct dependencies are fulfilled.
>
> Is this overly complicated or confusing?  Perhaps.  But it is better
> than printing out an incomplete set of definitions and dependencies,
> which is the current behavior.

You're right, but "it's a little bit better than before and could be
misinterpreted in other ways" is not a good reason to merge a patch
imho.

>
> As Stefan mentioned, "FRAME_POINTER is a complicated example, it is
> selected although it has dependencies or a prompt AND it is redefined
> in many architectures".  I'm pretty new to the Kconfig code, but to
> me, the multiple symbol behavior is bizarre.  This is because:
> - every definition is independent---dependencies are OR'd together
> from each definition.
> - each definition with a prompt creates a new location where that
> symbol can be changed in menuconfig
> - each definition _without_ a prompt that has its dependencies
> fulfilled results in the default value set in that definition being
> used unconditionally.  E.g. for FRAME_POINTER, this means that it is
> impossible to disable the option on ARM.  I have submitted a separate
> patch to try to fix that for ARM at least,
> https://lkml.org/lkml/2015/4/8/765

that's actually not true, you still would have to satisfy the
conditions for the default, but i'm not sure how easy you could
disable or enable the features in the default conditions without
missing something you need.

>
> I definitely think more thought needs to be put into cleaning up the
> multiple definition behavior, as it is very confusing to follow.  But
> the current behavior is flat-out wrong, as the search function does
> not actually print out the actual set of definitions or dependencies
> used by kconfig, and that is all that this patch is aiming to fix.
>
> Aside: if the issue is in how this is displayed, maybe it would be
> better to add in some parentheses and/or linebreaks to make it clearer
> that these are distinct sets, so rather than printing
>
>   Defined at lib/Kconfig.debug:323, arch/arm/Kconfig.debug:35
>   Depends on: DEBUG_KERNEL [=y] && (CRIS || M68K || FRV || UML ||
> AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) ||
> ARCH_WANT_FRAME_POINTERS [=n] || !THUMB2_KERNEL [=n]
>
> you get something more like
>
>   Defined at lib/Kconfig.debug:323, arch/arm/Kconfig.debug:35
>   Depends on:
>     (DEBUG_KERNEL [=y] && (CRIS || M68K || FRV || UML || AVR32 ||
> SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS
> [=n]) ||
>     (!THUMB2_KERNEL [=n])
>
> which makes the logic a little bit more obvious.   You could do this by iterating over the
> associated properties rather than just printing out the dir_dep
> expression of the symbol, but then you'd probably to change rev_dep to
> do the same.  I don't really like this, because it doesn't match up
> with what kconfig is _actually_ using (i.e. the rev_dep and dir_dep of
> the associated symbol).

I guess that wouldn't help, especially...how would you determine to
add a newline before (!THUMB_KERNEL)  and not before
ARCH_WANT_FRAME_POINTERS? And it doesn't point out the condition is
originating in another definition.

Stefan
