Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:32942 "EHLO
	mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752143AbbDMBHJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Apr 2015 21:07:09 -0400
MIME-Version: 1.0
In-Reply-To: <CABv5NL-Qtn6_etdJziUkDZZc=e8DYZfMgsMRxZjmozdG2sj7yA@mail.gmail.com>
References: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
 <1428701143.17822.72.camel@x220> <CABv5NL_uwXv=wNm7h7u_Y1FW5EsqVDdTcB6_dDXemVuVvEbCmg@mail.gmail.com>
 <1428778617.17822.133.camel@x220> <CABv5NL-WxZyGbf0afrqa3aL0VGL6kLj3NCPqofB0xc_AuxSNPQ@mail.gmail.com>
 <1428783814.17822.150.camel@x220> <CABv5NL9LU15BN8KNqxYO+Vs1rY5KWKNkVmvQO4u-H3PCDqTUrw@mail.gmail.com>
 <1428791102.17822.175.camel@x220> <CABv5NL-Qtn6_etdJziUkDZZc=e8DYZfMgsMRxZjmozdG2sj7yA@mail.gmail.com>
From: Gregory Fong <gregory.0xf0@gmail.com>
Date: Sun, 12 Apr 2015 18:06:38 -0700
Message-ID: <CADtm3G6FFxUWfg4KUfGCXTw1apZUFJrC2cExkmkfxD8DCHg+Uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Hengelein <stefan.hengelein@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Paul and Stefan,

Thanks for taking a look at this.  I think Stefan has touched upon why
he thinks this change might (at least partially) make sense, but let
me now try to explain the rationale behind this patch better than I
did in the commit message.

On Sun, Apr 12, 2015 at 8:02 AM, Stefan Hengelein
<stefan.hengelein@fau.de> wrote:
>> Let's focus, for example, on m32r and FRAME_POINTER. The m32r entry for
>> that symbol reads:
>>         config FRAME_POINTER
>>                 bool "Compile the kernel with frame pointers"
>>                 help
>>                   If you say Y here [...]
>>
>> 0) If one is building for m32r is that all there's to it? If so, "make
>> menuconfig"'s search facility is serving the people building for m32r a
>> load of crap.
>>
>> 1) If it's actually more complicated than that I think that anyone
>> reading arch/m32r/Kconfig.debug is being duped. Things look simple but
>> actually they are quite complicated. I think that's just wrong.
>>
>> What am I missing here?
>
> If you have a look at the definitions, lib/Kconfig.debug is included
> before FRAME_POINTER is defined in m32r and the output in the search
> facility looks indeed broken
> as one "Defined at" is missing but there are somehow Location entries
> (-> Kernel hacking    and  -> Kernel hacking -> compile time checks
> and [...]) for both definitions in a weird order (i think (1) and (2)
> might indicate both definitions)
>
> both declarations are valid in kconfig, you have two ways of enabling
> the same symbol, one easy without conditions and one with conditions
> and both with the same prompt.
>
> The search facility shows the first one that is found, you see the
> complicated depends on but i think the text shown might not be
> explicit enough to clarify you don't need to satisfy these complicated
> conditions to actually choose a value.
>

Well, the thing is, you do need to satisfy _one_ of the set of
conditions.  But unfortunately it's not not possible to see that from
the search function because it prints out incomplete information.

This is exactly the motivation for this change.  When you search for
FRAME_POINTER, you only get information on one "Defined at", and the
only "Depends" information is from that definition.  This is clearly
incorrect, as FRAME_POINTER is defined in multiple places, so the
information printed does not cover its actual definitions or
dependencies.  The printed "Selected by" information is, however,
correct, because it actually uses the rev_dep expression.  This patch
changes the "Depends" information to be similar: it will also print
the actual expression used by kconfig used to determine whether its
direct dependencies are fulfilled.

Is this overly complicated or confusing?  Perhaps.  But it is better
than printing out an incomplete set of definitions and dependencies,
which is the current behavior.

As Stefan mentioned, "FRAME_POINTER is a complicated example, it is
selected although it has dependencies or a prompt AND it is redefined
in many architectures".  I'm pretty new to the Kconfig code, but to
me, the multiple symbol behavior is bizarre.  This is because:
- every definition is independent---dependencies are OR'd together
from each definition.
- each definition with a prompt creates a new location where that
symbol can be changed in menuconfig
- each definition _without_ a prompt that has its dependencies
fulfilled results in the default value set in that definition being
used unconditionally.  E.g. for FRAME_POINTER, this means that it is
impossible to disable the option on ARM.  I have submitted a separate
patch to try to fix that for ARM at least,
https://lkml.org/lkml/2015/4/8/765

I definitely think more thought needs to be put into cleaning up the
multiple definition behavior, as it is very confusing to follow.  But
the current behavior is flat-out wrong, as the search function does
not actually print out the actual set of definitions or dependencies
used by kconfig, and that is all that this patch is aiming to fix.

Aside: if the issue is in how this is displayed, maybe it would be
better to add in some parentheses and/or linebreaks to make it clearer
that these are distinct sets, so rather than printing

  Defined at lib/Kconfig.debug:323, arch/arm/Kconfig.debug:35
  Depends on: DEBUG_KERNEL [=y] && (CRIS || M68K || FRV || UML ||
AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) ||
ARCH_WANT_FRAME_POINTERS [=n] || !THUMB2_KERNEL [=n]

you get something more like

  Defined at lib/Kconfig.debug:323, arch/arm/Kconfig.debug:35
  Depends on:
    (DEBUG_KERNEL [=y] && (CRIS || M68K || FRV || UML || AVR32 ||
SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS
[=n]) ||
    (!THUMB2_KERNEL [=n])

which makes the logic a little bit more obvious.  (Also, sorry, the
ARM=y in the original before/after was from a separate change I was
testing.  But it doesn't affect what we get here because
THUMB_KERNEL=n anyway).  You could do this by iterating over the
associated properties rather than just printing out the dir_dep
expression of the symbol, but then you'd probably to change rev_dep to
do the same.  I don't really like this, because it doesn't match up
with what kconfig is _actually_ using (i.e. the rev_dep and dir_dep of
the associated symbol).

Best regards,
Gregory
