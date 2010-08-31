Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:44731 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756766Ab0HaLal (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Aug 2010 07:30:41 -0400
Date: Tue, 31 Aug 2010 13:30:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC] kbuild: use getopt_long(), not its _only() variant
Message-ID: <20100831113040.GA14669@merkur.ravnborg.org>
References: <1282579284-20102-1-git-send-email-lacombar@gmail.com> <20100831112353.GB18142@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100831112353.GB18142@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Aug 31, 2010 at 01:23:53PM +0200, Michal Marek wrote:
> On Mon, Aug 23, 2010 at 12:01:24PM -0400, Arnaud Lacombe wrote:
> > NetBSD lacks getopt_long_only() whereas getopt_long() works just fine.
> > 
> > Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> > ---
> >  scripts/kconfig/conf.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> > index 5b7c86e..ecb16c0 100644
> > --- a/scripts/kconfig/conf.c
> > +++ b/scripts/kconfig/conf.c
> > @@ -466,7 +466,7 @@ int main(int ac, char **av)
> >  	bindtextdomain(PACKAGE, LOCALEDIR);
> >  	textdomain(PACKAGE);
> >  
> > -	while ((opt = getopt_long_only(ac, av, "", long_opts, NULL)) != -1) {
> > +	while ((opt = getopt_long(ac, av, "", long_opts, NULL)) != -1) {
> >  		input_mode = (enum input_mode)opt;
> >  		switch (opt) {
> >  		case silentoldconfig:
> 
> scripts/kconfig/Makefile uses the two-dash notation, so
> getopt_long_only() really isn't necessary. Applied to
> kbuild-2.6.git#kconfig.

Seems I forgot to do so - I had meant to ack this patch.

Thanks,
	Sam
