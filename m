Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:37125 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753125Ab0G2KJM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jul 2010 06:09:12 -0400
Message-ID: <4C515318.40706@suse.cz>
Date: Thu, 29 Jul 2010 12:08:24 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] kconfig: use long options in conf
References: <20100725213808.GA5814@merkur.ravnborg.org> <20100725214021.GD5834@merkur.ravnborg.org> <4C4EFE80.7050808@suse.cz> <20100728203622.GA32086@merkur.ravnborg.org> <4C51473A.4000605@suse.cz> <20100729093946.GA6725@merkur.ravnborg.org>
In-Reply-To: <20100729093946.GA6725@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Roman Zippel <zippel@linux-m68k.org>, Uwe Kleine-Koig <u.kleine-koenig@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>

On 29.7.2010 11:39, Sam Ravnborg wrote:
> I had in mind to deprecate randconfig in favour of allrandconfig
> to get more consitency in the names.
> But I failed to document this in the changelog.
> 
> I can submit the following as a real patch if you agree.

To me it seems like a change for the sake of change :), but if you like
to have the targets named all*config consistenly, I'm OK with it.

Michal
