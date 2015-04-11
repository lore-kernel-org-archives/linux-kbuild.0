Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:43180 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751292AbbDKS5C (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Apr 2015 14:57:02 -0400
Message-ID: <1428778617.17822.133.camel@x220>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
From: Paul Bolle <pebolle@tiscali.nl>
Date: Sat, 11 Apr 2015 20:56:57 +0200
In-Reply-To: <CABv5NL_uwXv=wNm7h7u_Y1FW5EsqVDdTcB6_dDXemVuVvEbCmg@mail.gmail.com>
References: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
	 <1428701143.17822.72.camel@x220>
	 <CABv5NL_uwXv=wNm7h7u_Y1FW5EsqVDdTcB6_dDXemVuVvEbCmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Hengelein <stefan.hengelein@fau.de>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, 2015-04-11 at 18:36 +0200, Stefan Hengelein wrote:
> If you're reading the dependency list as "what do i have to enable to
> be able to choose a value for FRAME_POINTER" and think, THUMB2_KERNEL
> would be a good choice to leave disabled, you're going to have a bad
> time.
> (The second definition in arm/Kconfig.debug doesn't have a prompt and
> the default has additional conditions)

Please elaborate on "bad time".

> I personally would prefer to
> additionally find the second definition that doesn't a prompt and
> other dependencies instead of adding them to the first entry, but
> that's just my personal preference.

I notice myself getting rather grumpy. (That usually translates to:
"Drop it, and revisit in a few days".) Let me explain.

This is the arm64 entry:
    config FRAME_POINTER
            bool
            default y

This is the hexagon entry
    config FRAME_POINTER
            def_bool y

This is the m32r entry:
    config FRAME_POINTER
            bool "Compile the kernel with frame pointers"
            help
              If you say Y here [...]

And this is the sparc entry:
    config FRAME_POINTER
            bool
            depends on MCOUNT
            default y

You'd expect these entries to yield really simple results when doing a
search in menuconfig. But the results show unparseable crap[1]. (And I'm
afraid Gregory's patch would make that even worse. Gregory: please prove
me wrong.)

So to the grumpy me it looks like either:
- menuconfig handles these redefinitions incorrectly in its UI;
- these redefinitions are actually complicated (as in: somehow they
concatenate the dependencies, etc.) and we should probably disallow
them. Because otherwise looking at a Kconfig entry tells you very little
about what is actually going on for the architecture you're interested
in.

What is the grumpy me missing here?


Paul Bolle

[1] The hexagon entry is interesting, probably because it sources
lib/Kconfig.debug _after_ it defined FRAME_POINTER for itself.

