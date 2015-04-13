Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:37295 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752268AbbDMO5m (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 10:57:42 -0400
MIME-Version: 1.0
In-Reply-To: <1428911509.11113.51.camel@x220>
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
	<1428911509.11113.51.camel@x220>
Date: Mon, 13 Apr 2015 16:57:40 +0200
Message-ID: <CABv5NL9pwo=zxkh20NcBesthyexNLgnz5vT7r-91YVfqxo7nOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
From: Stefan Hengelein <stefan.hengelein@fau.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

>> > The search facility shows the first one that is found, you see the
>> > complicated depends on but i think the text shown might not be
>> > explicit enough to clarify you don't need to satisfy these complicated
>> > conditions to actually choose a value.
>> >
>>
>> Well, the thing is, you do need to satisfy _one_ of the set of
>> conditions.  But unfortunately it's not not possible to see that from
>> the search function because it prints out incomplete information.
>>
>> This is exactly the motivation for this change.  When you search for
>> FRAME_POINTER, you only get information on one "Defined at", and the
>> only "Depends" information is from that definition.  This is clearly
>> incorrect, as FRAME_POINTER is defined in multiple places, so the
>> information printed does not cover its actual definitions or
>> dependencies.  The printed "Selected by" information is, however,
>> correct, because it actually uses the rev_dep expression.  This patch
>> changes the "Depends" information to be similar: it will also print
>> the actual expression used by kconfig used to determine whether its
>> direct dependencies are fulfilled.
>>
>> Is this overly complicated or confusing?  Perhaps.  But it is better
>> than printing out an incomplete set of definitions and dependencies,
>> which is the current behavior.
>>
>> As Stefan mentioned, "FRAME_POINTER is a complicated example, it is
>> selected although it has dependencies or a prompt AND it is redefined
>> in many architectures".  I'm pretty new to the Kconfig code, but to
>> me, the multiple symbol behavior is bizarre.
>
> I didn't yet stumble on a rationale of the multiple definition behavior.
> Without knowing that rationale things look rather bizarre.

Well, i think i tried to explain that rationale before. An
architecture wants to enable OPTION_X independently of the definition
in lib/whatever/Kconfig and therefore independently of the conditions
defined in lib/whatever/Kconfig like it's done in ARM64. You cannot
expect the non-architecture code in lib/ or other folders to consider
the opinions of each architecture, that would end in huge discussions
and everyone to be disappointed or mad at each other. Linux is huge,
you have different maintainers for almost everything. To have an
alternative definition is not inherently wrong or useless, you just
have to know about them without a grep over the the Kconfig-files.


>> - each definition _without_ a prompt that has its dependencies
>> fulfilled results in the default value set in that definition being
>> used unconditionally.  E.g. for FRAME_POINTER, this means that it is
>> impossible to disable the option on ARM.  I have submitted a separate
>> patch to try to fix that for ARM at least,
>> https://lkml.org/lkml/2015/4/8/765
>
> I didn't see that patch. It's probably closely related to what we
> discuss here. Please send closely related patches as series. (Was it
> perhaps intended to be the 2/2 you never sent?)
>
> I find the arm64 entry for this symbol interesting too. Since ARM64 will
> always select ARCH_WANT_FRAME_POINTERS I think there's no reason for it
> to have a separate FRAME_POINTER entry in the first place. (I didn't yet
> bother to look at the git history of arm64.)

Subsystems should have the right to use X without a need to alter
definitions in lib/ or other folders...if everyone would put their own
constraints into the definition of X in lib/Kconfig.debug, you would
probably complain because the conditions could get a lot longer than
they are now ;) What would mean the conditions would be harder to
maintain, harder to gasp for newbies and a certain wild growth would
be invited.

>
>> I definitely think more thought needs to be put into cleaning up the
>> multiple definition behavior, as it is very confusing to follow.
>
> Yes. For starters I think each non-central definition (ie, the
> definitions in our FRAME_POINTER example that we found in arch/) needs a
> comment: why was it needed, why wasn't lib/Kconfig.debug altered? See my
> arm64 example why I want to know that.
>
> Stefan, Valentin, Andreas: can your bot spot newly added multiple
> definitions? If so, would it make sense to have it emit warnings when
> that happens, at least for the time being?

No, we we're currently not searching for redefinitions, but i don't
see a need to add this.


> - does the, well, low-level kconfig code implement those cases in a
> sensible way?

define sensible. i explained how kconfig is dealing with these cases
:) what did you miss?

Stefan
