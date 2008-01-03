Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:58430 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751030AbYACUrL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Jan 2008 15:47:11 -0500
Date: Thu, 3 Jan 2008 21:47:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [REPOST] kbuild: support mercurial in setlocalversion
Message-ID: <20080103204712.GF21227@uranus.ravnborg.org>
References: <20071128215543.GL17088@fc.hp.com> <20071128221323.GA20709@uranus.ravnborg.org> <20071212193410.GB8592@fc.hp.com> <20071212194513.GA3778@uranus.ravnborg.org> <20071228212627.GI29917@fc.hp.com> <20071231125517.GB21871@uranus.ravnborg.org> <20080103200819.GA13725@fc.hp.com> <20080103201730.GB13725@fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080103201730.GB13725@fc.hp.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Aron Griffis <aron@hp.com>
Cc: linux-kbuild@vger.kernel.org

On Thu, Jan 03, 2008 at 03:17:30PM -0500, Aron Griffis wrote:
> Aron Griffis wrote:  [Thu Jan 03 2008, 03:08:19PM EST]
> > Sam Ravnborg wrote:  [Mon Dec 31 2007, 07:55:17AM EST]
> > > On Fri, Dec 28, 2007 at 04:26:28PM -0500, Aron Griffis wrote:
> > > > Sam Ravnborg wrote:  [Wed Dec 12 2007, 02:45:13PM EST]
> > > > > On Wed, Dec 12, 2007 at 02:34:10PM -0500, Aron Griffis wrote:
> > > > > > Hi Sam,
> > > > > > 
> > > > > > Any progress on this?  I don't think I see it in a tree yet, but
> > > > > > I could be looking in the wrong place.
> > > > > >
> > > > > Very slowly going through my mailbox - it is not in yet but
> > > > > that will happen in the weekend.
> > > > 
> > > > Sam, I don't mean to nag but I posted this patch 1.5 months ago now
> > > > with regular queries since then.  Do you expect to apply it soon?
> > >
> > > Soory for the delay.
> > > Fixed whitespace isuee and applied.
> > 
> > I saw it at
> > http://git.kernel.org/?p=linux/kernel/git/sam/kbuild.git;a=summary
> > a few days ago, but now it's gone...  What happened?
> 
> Oh, I guess it's back now...  Sorry, maybe I'm just confused.

I just rebased kbuild.git on top of latest linus.git.
I do this now and then to catch any merge conflicts before it hits -mm.

	Sam
