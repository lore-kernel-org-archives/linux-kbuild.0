Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:41530 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761478AbYEBKlg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 May 2008 06:41:36 -0400
Date: Fri, 2 May 2008 12:42:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas
Message-ID: <20080502104211.GB20741@uranus.ravnborg.org>
References: <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net> <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net> <20080501191714.GM29330@cs181133002.pp.htv.fi> <20080501213952.GA8281@uranus.ravnborg.org> <20080501220747.GV29330@cs181133002.pp.htv.fi> <52649.81.193.128.196.1209689622.squirrel@galactus.symlabs.net> <8499950a0805011848h713606e3mda5dd2aed31dfa91@mail.gmail.com> <20080502060813.GB19090@uranus.ravnborg.org> <20080502105620.GW24008@flower.upol.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080502105620.GW24008@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@flower.upol.cz>
Cc: "Sam Ravnborg (kbuild list)" <linux-kbuild@vger.kernel.org>

On Fri, May 02, 2008 at 12:56:20PM +0200, Oleg Verych wrote:
> Sam Ravnborg @ Fri, May 02, 2008 at 08:08:13AM +0200:
> > On Fri, May 02, 2008 at 02:48:58AM +0100, Oleg Verych wrote:
> > > Sam, please, tell to those guys, that shell must be `bash`, as Roman wanted.
> > 
> > No - we want to be portable across as many setups as possible.
> > So forcing us to use bash is in the long run not a good solutions.
> > 
> > We should go for the least common denominator - busy-box could be the one.
> 
> ,-- Message-ID: <Pine.LNX.4.64.0702082335150.14457@scrub.home> --
> |It would make casual kbuild hacking only even more difficult, as one has
> |to check it works with the various shells.
> `--
This is still true. But we start to see a few more people reporting issues
with non-standard Linux systems (busy-box, cygwin, sun) so there is a 
need and there is a tester base.
And any strightforward looking patches will be applied - when eventual
feedback has been incorporated.

I will not promise to check for non-linux compliance but testers are welcome.

	Sam
