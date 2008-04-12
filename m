Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gprs189-60.eurotel.cz ([160.218.189.60]:3893 "EHLO spitz.ucw.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753836AbYDLTHi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Apr 2008 15:07:38 -0400
Date: Sat, 12 Apr 2008 20:32:18 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: coloring stdout && stderr, small kbuild example
Message-ID: <20080412183218.GD4492@ucw.cz>
References: <E1Jjbol-0002zS-4P@flower> <1207754040.6860.7.camel@tara.firmix.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1207754040.6860.7.camel@tara.firmix.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: Oleg Verych <olecom@flower.upol.cz>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kbuild devel list <linux-kbuild@vger.kernel.org>

Hi!

> > Those boring never-ending builds...
> > 
> > Can some dualCPU power be spent, if building is interactive (i.e. sent to
> > terminal), to have them a bit colored?
> > 
> > My last rant about "colored printk()" led away from kernel developers
> > and their solutions. But now, let me share something.
> 
> I don't know if it's of any use for you but there is already
> *) color-make - http://bre.klaki.net/programs/colormake/ - and
> *) color-gcc - http://schlueters.de/colorgcc.html -
> out there.

icecc seems to do the coloring, too...

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
