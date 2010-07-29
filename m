Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:35157 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751566Ab0G2JYh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 05:24:37 -0400
Message-ID: <4C5148A5.10809@suse.cz>
Date: Thu, 29 Jul 2010 11:23:49 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] kconfig: use long options in conf
References: <20100725213808.GA5814@merkur.ravnborg.org> <20100725214021.GD5834@merkur.ravnborg.org> <4C4EFE80.7050808@suse.cz> <20100728203622.GA32086@merkur.ravnborg.org> <20100729081316.GA4990@merkur.ravnborg.org>
In-Reply-To: <20100729081316.GA4990@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Roman Zippel <zippel@linux-m68k.org>, Uwe Kleine-Koig <u.kleine-koenig@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Aristeu Rozanski <aris@redhat.com>

On 29.7.2010 10:13, Sam Ravnborg wrote:
> On Wed, Jul 28, 2010 at 10:36:22PM +0200, Sam Ravnborg wrote:
>> Hi Michal.
>>
>> I cooked up the following to introduce long options in conf.
>> But in the process I dropped the short options. Is this OK?
> 
> On top of this patch I did another two.
> They fixup the *nonint_oldconfig targets:
> 
> nonint_oldconfig:
> - renamed to listnewconfig
> - print new options to stdout (to better support redirect)
> - no longer saves a new configuration
> - does ot exist with a failure code if there is new options
> 
> loose_noninit_oldconfig:
> - renamed to oldnoconfig
> - does ot exist with a failure code if there is new options
> 
> This is a lot cleaner and much more sensible names.
> And they still support the suecase where they
> list new options and can set them to n per default.

I do not object, these new targets are only in the kbuild tree atm, so
users are not relying on them yet. And the new names indeed describe
better what they do. Aristeu?

Michal
