Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:56780 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753493AbYGAGMX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Jul 2008 02:12:23 -0400
Date: Tue, 1 Jul 2008 08:12:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kconfig - hex are considered decimal
Message-ID: <20080701061241.GA4922@uranus.ravnborg.org>
References: <20080629115120.GA4654@uranus.ravnborg.org> <Pine.LNX.4.64.0806301404270.6791@localhost.localdomain> <20080630204032.GA29429@uranus.ravnborg.org> <Pine.LNX.4.64.0806302356340.6791@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0806302356340.6791@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Jun 30, 2008 at 11:59:42PM +0200, Roman Zippel wrote:
> Hi,
> 
> On Mon, 30 Jun 2008, Sam Ravnborg wrote:
> 
> > For now I added this patch (for previous mail).
> > This makes the configs equal so they can be compared.
> 
> Did you try changing and saving that hex value?
Yes.
- When changing I see the 0x prefix - which I consider OK for hex values
- When saving I see the 0x prefix in autoconf.h + .config

> You need a similiar logic as used for saving the header file.
> Why is it a problem, that needs immediate fixing anyway?

To keep difference minimal for .config produced by 
old style 'all*config' and new style 'all*config'.

See patches where kconfig start to use the new
method for 'all*config' targets - they are cc:ed to you
and available on linux-kbuild.
I simply started to use conf_set_all_new_symbols() and
as a result I could simplify conf.c.

And things got so simple that I dropped the patches
introducing aconf.c.

Yet TODO:

-> Give Redhat's nonint_oldconfig a closer look and see
   how to integrate this functionality
-> Give Andres Salomon patches a second look and see how to
   integrate the functionality he requires

It it does not turn out to be simple I will lilely postpone it
until I have moved.

	Sam
