Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:38657 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1757348Ab0G2Oa1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 10:30:27 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Thu, 29 Jul 2010 07:30:17 -0700
Date: Thu, 29 Jul 2010 07:30:16 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [RFC PATCH] kconfig: use long options in conf
Message-Id: <20100729073016.ba265b59.rdunlap@xenotime.net>
In-Reply-To: <4C515318.40706@suse.cz>
References: <20100725213808.GA5814@merkur.ravnborg.org>
	<20100725214021.GD5834@merkur.ravnborg.org>
	<4C4EFE80.7050808@suse.cz>
	<20100728203622.GA32086@merkur.ravnborg.org>
	<4C51473A.4000605@suse.cz>
	<20100729093946.GA6725@merkur.ravnborg.org>
	<4C515318.40706@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Roman Zippel <zippel@linux-m68k.org>, Uwe Kleine-Koig <u.kleine-koenig@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>

On Thu, 29 Jul 2010 12:08:24 +0200 Michal Marek wrote:

> On 29.7.2010 11:39, Sam Ravnborg wrote:
> > I had in mind to deprecate randconfig in favour of allrandconfig
> > to get more consitency in the names.
> > But I failed to document this in the changelog.
> > 
> > I can submit the following as a real patch if you agree.
> 
> To me it seems like a change for the sake of change :), but if you like
> to have the targets named all*config consistenly, I'm OK with it.


Well, there are scripts that know the old name, so if it's just change
for the sake of change, let's not.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
