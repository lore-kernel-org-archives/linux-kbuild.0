Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:56969 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753520AbYBVU6n (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Feb 2008 15:58:43 -0500
Date: Fri, 22 Feb 2008 21:58:55 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Fwd: Re: Fwd: Re: build #350 issue for v2.6.25-rc1 in drivers/i2c/busses/i2c-i801.c
Message-ID: <20080222205855.GA7711@uranus.ravnborg.org>
References: <200802222143.38643.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200802222143.38643.toralf.foerster@gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Toralf =?iso-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
Cc: linux-kbuild@vger.kernel.org

On Fri, Feb 22, 2008 at 09:43:36PM +0100, Toralf Förster wrote:
> Hello,
> 
> pls see below for an issue of KConfig which happens for isntance if randconfig selects
> CONFIG_INPUT_APANEL.

Which select a symbol with dependencies => boom!

Select is evil. We need 'requires' that could be used by the user to say "I want this".

[Comment from Randy] 
> Yes, I see this one often.  I wish someone were willing to try
> to fix it.  I've looked at the source code, but I'm not willing to
> dive deeply into it.

I hope Roman suddenly fixes it.

	Sam
