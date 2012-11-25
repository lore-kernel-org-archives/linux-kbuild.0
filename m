Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:55095 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753387Ab2KYUkZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 25 Nov 2012 15:40:25 -0500
Date: Sun, 25 Nov 2012 21:40:19 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] scripts/kconfig: allow setting the root-menu label
	from environment
Message-ID: <20121125204019.GA11106@merkur.ravnborg.org>
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr> <1353542766-24422-4-git-send-email-yann.morin.1998@free.fr> <20121123183211.GB10586@merkur.ravnborg.org> <201211232221.45291.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201211232221.45291.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Fri, Nov 23, 2012 at 10:21:44PM +0100, Yann E. MORIN wrote:
> Sam, All,
> 
> On Friday 23 November 2012 Sam Ravnborg wrote:
> > On Thu, Nov 22, 2012 at 01:06:06AM +0100, Yann E. MORIN wrote:
> > > Currently, the root-menu label is hard-coded in the kconfig frontends
> > > executables. This means that two projects that use kconfig and want
> > > to display different root-menu labels can not share the same kconfig
> > > frontends.
> > > 
> > > Instead of hard-coding the label in the frontends, handle it the same
> > > we handle the CONFIG_ prefix:
> > >   - get the root-menu label from the environment if present
> > >   - allow to set it at build time (eg. -DROOTMENU='"Root menu label"')
> > >   - fallback to a hard-coded default
> > 
> > I have note paid attention to these CONFIG_ patches - and only now
> > I took a short look at this set and I am not soo hapy
> > that we start to introduce a lot a environment variables for all this stuff.
> > 
> > (A lot in this context is two).
> 
> Note that we already make heavy use of environment variables in the kconfig
> frontends; from Documentation/kbuild/kconfig.txt:
>     KCONFIG_ALLCONFIG
>     KCONFIG_AUTOHEADER
>     KCONFIG_NOSILENTUPDATE
>     KCONFIG_OVERWRITECONFIG

Common for all of these is that they change the behaviour of the fronendts
concerning their inputs etc.
But none of them change the behaviour so the output become useless.
Also common for these is that they are optional.
If they are not specified kconfig will work as usual and the generated
output will be just fine.

>     KCONFIG_CONFIG
>     KCONFIG_AUTOCONFIG
>     KCONFIG_TRISTATE

These are used for non-default file loactions...

> > Could we instead introduce two reserved symbols like this:
> > 
> > config KCONFIG_ROOT_MENU
> > 	string
> > 	default "My own super duper root menu"
> 
> For the root-menu label, no need to add such a specific symbol, as
> we already have the 'mainmenu' directive that sets the root-menu
> label, eg.:
>     mainmenu "My own super duper root menu"

Had forgoten about this - why is it that we do not use this, but invent
an environment variable?


> 
> > config KCONFIG_SYMBOL_PREFIX
> > 	string
> > 	default "SAM_"
> 
> I am a bit uneasy adding magic in the kconfig language to drive the
> behavior of the frontends.
> 
> To me, it makes more sense to drive the frontends using environment
> variables.

Using magic kconfig symbols to decide for core functionality is IMO
a nice way to do so. I never liked (and still do not like) how environment
variables are used to adjust the front-end behaviour.
The real reason why we use environment variables is that we cannot
specify options for kconfig when we invoke make.

I long time ago played with the though that the kernel build should
be started with a shell script named "kbuild" to give us this added flexibility.
But I gave up as I back then did not have any real good reason to do so.

	Sam

