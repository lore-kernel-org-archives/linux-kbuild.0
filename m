Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:57164 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757880AbZDETsD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Apr 2009 15:48:03 -0400
Date: Sun, 5 Apr 2009 21:50:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] headerdep: fix option processing for -I
Message-ID: <20090405195006.GD24374@uranus.ravnborg.org>
References: <1238331707-23129-1-git-send-email-u.kleine-koenig@pengutronix.de> <20090329182617.GA25154@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20090329182617.GA25154@pengutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kbuild@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>

On Sun, Mar 29, 2009 at 08:26:17PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> sorry for replying to my own mail, but I found a further enhancement.
> 
> On Sun, Mar 29, 2009 at 03:01:47PM +0200, Uwe Kleine-König wrote:
> > -I takes an argument.  Without this change only a 1 is added to
> > @opt_include which is not helpful.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > Cc: Vegard Nossum <vegard.nossum@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > 
> > ---
> >  scripts/headerdep.pl |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/scripts/headerdep.pl b/scripts/headerdep.pl
> > index 97399da..536408e 100755
> > --- a/scripts/headerdep.pl
> > +++ b/scripts/headerdep.pl
> > @@ -19,7 +19,7 @@ my $opt_graph;
> >  	version	=> \&version,
> >  
> >  	all	=> \$opt_all,
> > -	I	=> \@opt_include,
> > +	"I:s"	=> \@opt_include,
> This should better be "I=s".  The difference is that with : the argument
> is optional, with = it is not.

Applied with this fix and Vegards ack.

	Sam
