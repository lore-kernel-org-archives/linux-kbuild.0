Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:34880 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751152Ab2GRG4Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jul 2012 02:56:16 -0400
Date: Wed, 18 Jul 2012 06:56:15 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] scripts/package/builddeb: upgrade to current practices
Message-ID: <20120718065615.GW28778@vostochny.stro.at>
References: <1342547874.5129.2.camel@henna.lan>
 <20120717193951.GA15208@burratino>
 <CAPZXPQc02=6FnTb_RmgfpW+A4=N_huZW1FUYdjJ=Nt0Y3pqZ+A@mail.gmail.com>
 <20120717212305.GV28778@vostochny.stro.at>
 <CAPZXPQfBPXaRtK3QdY_PA=3GRrUz9+y3aU-2AvedvTwn8tOnqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPZXPQfBPXaRtK3QdY_PA=3GRrUz9+y3aU-2AvedvTwn8tOnqg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?iso-8859-1?Q?Martin-=C9ric?= Racine <martin-eric.racine@iki.fi>
Cc: Jonathan Nieder <jrnieder@gmail.com>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On Wed, Jul 18, 2012 at 02:19:25AM +0300, Martin-Éric Racine wrote:
> 2012/7/18 maximilian attems <max@stro.at>:
> > On Tue, Jul 17, 2012 at 10:46:23PM +0300, Martin-Éric Racine wrote:
> >> 2012/7/17 Jonathan Nieder <jrnieder@gmail.com>:
> >> >>
> >> >>  Package: $fwpackagename
> >> >>  Architecture: all
> >> >> +Conflicts: firmware-linux-free, firmware-linux-nonfree
> >> >> +Provides: firmware-linux-free, firmware-linux-nonfree
> >> >> +Replaces: firmware-linux-free, firmware-linux-nonfree
> >> >
> >> > I assume you mean Breaks+Replaces.  Do the files actually overlap,
> >> > or is this change being overly cautious?  I would expect the files
> >> > not to overlap because the package build with deb-pkg puts firmware
> >> > in a versioned subdirectory "/lib/firmware/<version>".
> >>
> >> AFAIK they would overlap, hence the Conflicts.
> >
> > This is wrong and properly fixed in -next.
> 
> Exactly what is wrong with this fix? Could you tell us exactly what
> you did differently and why?

Jonathan already answered it, saying that firmwares are put
in versioned dir.

Just use git to look it up, easy:
~/src/linux-next (master %=)$ git log scripts/package/builddeb

6607ddadf93d19c7f64139f1475c342152f39fe5

Your conflict would mean to kick out the official debian firmware
packages which is not something we want!

-- 
maks
