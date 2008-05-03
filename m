Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:52757 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751038AbYECVss (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 May 2008 17:48:48 -0400
Date: Sat, 3 May 2008 23:49:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
Message-ID: <20080503214922.GB24283@uranus.ravnborg.org>
References: <20080429183531.GB19652@uranus.ravnborg.org> <200805010640.33973.zippel@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200805010640.33973.zippel@linux-m68k.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@codemonkey.org.uk>, Roland McGrath <roland@redhat.com>, Andres Salomon <dilinger@queued.net>

Hi Roman.

> The patch I've seen for the last point put it into conf.c, which is the wrong 
> place for it. For this sort of thing we should create a small query tool, 
> which then can export all sorts of information.
> If we silence the defconfig output (which IMO is a good thing, as I don't 
> think anyone looked at the output seriously for a long time and the current 
> behaviour has purely historical reasons), it would also open up the 
> possibility to separate it from conf.c.

aconf is now ready to take care of defconfig, randconfig and all*config.
That leaves us with two simple tasks for conf.c:
config and oldconfig

[silentoldconfig is gone as oldconfig is 'silent' now].

aconf can take a base config for all the targets and avoids being
clever where to locate it. (Read: does not use DEFCONFIG_LIST).

I dunno if this is what you had in mind but I certainly like the result.
A cleaned up set of patches will soon hit the kbuild list.

> This also fits into an idea I'm playing with to extend the .config format like 
> this:
> 
> %defaultmode: mod
> CONFIG_FOO=n
> 
I understand the solution that you describe but I fail to see the
usefulness of it.
Can I request you to elaborate a bit more how you see it used.
I can give it a shot if I see it solving a real issue.

> Basically this could replace "make allmodconfig KCONFIG_ALLCONFIG=..." and the 
> current way to produce an allmodconfig would be replaced by a dedicated 
> function.
This part I did not understand either. I am aware of the current behaviour
but do not get the "dedicated function" thing.

Thanks in advance,

	Sam
