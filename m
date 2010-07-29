Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48568 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755629Ab0G2JSh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 05:18:37 -0400
Message-ID: <4C51473A.4000605@suse.cz>
Date: Thu, 29 Jul 2010 11:17:46 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] kconfig: use long options in conf
References: <20100725213808.GA5814@merkur.ravnborg.org> <20100725214021.GD5834@merkur.ravnborg.org> <4C4EFE80.7050808@suse.cz> <20100728203622.GA32086@merkur.ravnborg.org>
In-Reply-To: <20100728203622.GA32086@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Roman Zippel <zippel@linux-m68k.org>, Uwe Kleine-Koig <u.kleine-koenig@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>

On 28.7.2010 22:36, Sam Ravnborg wrote:
> Hi Michal.
> 
> I cooked up the following to introduce long options in conf.
> But in the process I dropped the short options. Is this OK?

Nice! I would probably name the option and the enum value for randconfig
simply --randconfig to not introduce new names (the scripts/kconfig/conf
call is displayed to the user).


> Usign the same name in conf.c as used as make target really
> helped the readability.

Indeed.

Michal
