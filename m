Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:47211 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754602AbYEDTb7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 15:31:59 -0400
Date: Sun, 4 May 2008 21:32:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kconfig - a suggestion how to fix the select issue
Message-ID: <20080504193234.GB23846@uranus.ravnborg.org>
References: <20080504071041.GA15315@uranus.ravnborg.org> <481E0E76.3060900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481E0E76.3060900@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rene Herman <rene.herman@gmail.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Sun, May 04, 2008 at 09:28:54PM +0200, Rene Herman wrote:
> On 04-05-08 09:10, Sam Ravnborg wrote:
> 
> >Today we have two ways to express/solve dependencies.
> >
> >Top-down we have "depends on"
> >and bottom up we have "select".
> >
> >The "depends on" dependencies at the same
> >time impact the visibility of a symbol.
> >A symbol with "depends on" not satisfied are not
> >visible and thus not shown in menuconfig.
> 
> I've always really disliked the visibility thing. I believe it's not really 
> the core issue here but regardless of anything else, could we not "grey 
> out" non-selectable options with its helpt text still available? That's 
> much more the standard UI paradigm.

Works in xconfig - but last I tried I failed to enable it in menuconfig.
It should be doable I just failed to see how.

And as my linux time-share for this month is already almost consumed
I will not find time to look at it :-(

	Sam
