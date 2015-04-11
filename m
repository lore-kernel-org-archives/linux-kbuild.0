Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:38549 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755299AbbDKT6U (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Apr 2015 15:58:20 -0400
MIME-Version: 1.0
In-Reply-To: <1428778617.17822.133.camel@x220>
References: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
	<1428701143.17822.72.camel@x220>
	<CABv5NL_uwXv=wNm7h7u_Y1FW5EsqVDdTcB6_dDXemVuVvEbCmg@mail.gmail.com>
	<1428778617.17822.133.camel@x220>
Date: Sat, 11 Apr 2015 21:58:19 +0200
Message-ID: <CABv5NL-WxZyGbf0afrqa3aL0VGL6kLj3NCPqofB0xc_AuxSNPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
From: Stefan Hengelein <stefan.hengelein@fau.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2015-04-11 20:56 GMT+02:00 Paul Bolle <pebolle@tiscali.nl>:
> On Sat, 2015-04-11 at 18:36 +0200, Stefan Hengelein wrote:
>> If you're reading the dependency list as "what do i have to enable to
>> be able to choose a value for FRAME_POINTER" and think, THUMB2_KERNEL
>> would be a good choice to leave disabled, you're going to have a bad
>> time.
>> (The second definition in arm/Kconfig.debug doesn't have a prompt and
>> the default has additional conditions)
>
> Please elaborate on "bad time".

What i meant to say, you won't get a prompt (or for mconf, won't see
it in the menu) if THUMB2_KERNEL is disabled, FRAME_POINTER will
simply be enabled when the default condition in the definition without
the prompt is satisfied.

Therefore it might be misleading to add it to the conditions.

>
>> I personally would prefer to
>> additionally find the second definition that doesn't have a prompt and
>> other dependencies instead of adding them to the first entry, but
>> that's just my personal preference.
>
> I notice myself getting rather grumpy. (That usually translates to:
> "Drop it, and revisit in a few days".) Let me explain.
>
> This is the arm64 entry:
>     config FRAME_POINTER
>             bool
>             default y
>
> This is the hexagon entry
>     config FRAME_POINTER
>             def_bool y
>
> This is the m32r entry:
>     config FRAME_POINTER
>             bool "Compile the kernel with frame pointers"
>             help
>               If you say Y here [...]
>
> And this is the sparc entry:
>     config FRAME_POINTER
>             bool
>             depends on MCOUNT
>             default y
>
> You'd expect these entries to yield really simple results when doing a
> search in menuconfig. But the results show unparseable crap[1]. (And I'm
> afraid Gregory's patch would make that even worse. Gregory: please prove
> me wrong.)

would you please define unparseable crap? the only odd thing i notice
when i call menuconfig on hexagon is a really long "Selected by: "
list

>
> So to the grumpy me it looks like either:
> - menuconfig handles these redefinitions incorrectly in its UI;
> - these redefinitions are actually complicated (as in: somehow they
> concatenate the dependencies, etc.) and we should probably disallow
> them. Because otherwise looking at a Kconfig entry tells you very little
> about what is actually going on for the architecture you're interested
> in.
>
> What is the grumpy me missing here?

Redefinitions are more of an "overwrite" than a "add conditions to the entry".
It's perfectly reasonable for architecture A to say: if these
conditions hold, i want to enable option B, not matter what the
Kconfigfile in lib/ says (like arm64 does with FRAME_POINTER, it is
always on, (depending on if there are other dependencies around it)).

Redefinitions are a little more complicated...
If you have two options with the same symbol and both have a prompt,
you will see it two times in conf. Meaning, Kconfig doesn't merge both
declarations but they are separate two different instructions,
affecting the same symbol.
With menuconfig it's the same, it will show both definitions in the
menu, they might however be in another submenu, depending on the
dependencies both definitions have.

The kconfig rules state only one definition should have a prompt, but
as you can see, m32r does violate this "rule" and it doesn't break
kconfig ;)

That's why i said i'd prefer to have both declarations printed than
adding the conditions from the second definition to the printed entry
of the first....
If the order is different, you might only see the definition without
the prompt (what happens for hexagon) and miss the second possibility
to enable the feature.


>
> [1] The hexagon entry is interesting, probably because it sources
> lib/Kconfig.debug _after_ it defined FRAME_POINTER for itself.
>


Stefan
