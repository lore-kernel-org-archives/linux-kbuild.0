Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud6.xs4all.net ([194.109.24.28]:39151 "EHLO
	lb2-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751184AbbDMHvy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 03:51:54 -0400
Message-ID: <1428911509.11113.51.camel@x220>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
From: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 13 Apr 2015 09:51:49 +0200
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
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Stefan Hengelein <stefan.hengelein@fau.de>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Gregory,

On Sun, 2015-04-12 at 18:06 -0700, Gregory Fong wrote:
> On Sun, Apr 12, 2015 at 8:02 AM, Stefan Hengelein
> > If you have a look at the definitions, lib/Kconfig.debug is included
> > before FRAME_POINTER is defined in m32r and the output in the search
> > facility looks indeed broken
> > as one "Defined at" is missing but there are somehow Location entries
> > (-> Kernel hacking    and  -> Kernel hacking -> compile time checks
> > and [...]) for both definitions in a weird order (i think (1) and (2)
> > might indicate both definitions)
> >
> > both declarations are valid in kconfig, you have two ways of enabling
> > the same symbol, one easy without conditions and one with conditions
> > and both with the same prompt.

At least they're connected. Setting it at one location changes the other
location too.

> > The search facility shows the first one that is found, you see the
> > complicated depends on but i think the text shown might not be
> > explicit enough to clarify you don't need to satisfy these complicated
> > conditions to actually choose a value.
> >
> 
> Well, the thing is, you do need to satisfy _one_ of the set of
> conditions.  But unfortunately it's not not possible to see that from
> the search function because it prints out incomplete information.
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
> 
> As Stefan mentioned, "FRAME_POINTER is a complicated example, it is
> selected although it has dependencies or a prompt AND it is redefined
> in many architectures".  I'm pretty new to the Kconfig code, but to
> me, the multiple symbol behavior is bizarre.

I didn't yet stumble on a rationale of the multiple definition behavior.
Without knowing that rationale things look rather bizarre.

>   This is because:
> - every definition is independent---dependencies are OR'd together
> from each definition.

(Embarrassing question: where in the code does that happen?)

> - each definition with a prompt creates a new location where that
> symbol can be changed in menuconfig

At least they are connected, see above.

> - each definition _without_ a prompt that has its dependencies
> fulfilled results in the default value set in that definition being
> used unconditionally.  E.g. for FRAME_POINTER, this means that it is
> impossible to disable the option on ARM.  I have submitted a separate
> patch to try to fix that for ARM at least,
> https://lkml.org/lkml/2015/4/8/765

I didn't see that patch. It's probably closely related to what we
discuss here. Please send closely related patches as series. (Was it
perhaps intended to be the 2/2 you never sent?)

I find the arm64 entry for this symbol interesting too. Since ARM64 will
always select ARCH_WANT_FRAME_POINTERS I think there's no reason for it
to have a separate FRAME_POINTER entry in the first place. (I didn't yet
bother to look at the git history of arm64.)

> I definitely think more thought needs to be put into cleaning up the
> multiple definition behavior, as it is very confusing to follow.

Yes. For starters I think each non-central definition (ie, the
definitions in our FRAME_POINTER example that we found in arch/) needs a
comment: why was it needed, why wasn't lib/Kconfig.debug altered? See my
arm64 example why I want to know that.

Stefan, Valentin, Andreas: can your bot spot newly added multiple
definitions? If so, would it make sense to have it emit warnings when
that happens, at least for the time being?

> But
> the current behavior is flat-out wrong, as the search function does
> not actually print out the actual set of definitions or dependencies
> used by kconfig, and that is all that this patch is aiming to fix.

Personally I'm not willing to think about changing the UI without
understanding the reasons for the current behavior:
- in what case does it make sense to define a symbol twice[0]; and
- does the, well, low-level kconfig code implement those cases in a
sensible way?

Only after questions like these are answered I'll be willing to think
about the UI. (Perhaps people like Michal or Martin know the answers to
those questions. I don't.) It's great that you raised this issue, but
neither Stefan, you, nor I appear to really grok these multiple
definitions, and that needs to change first.

Thanks,


Paul Bolle

[0] Obviously this is _not_ about symbols, like 64BIT, that are defined
multiple times in various arch/ directories. A valid parse of the
Kconfig files will only encounter such symbols exactly once.

