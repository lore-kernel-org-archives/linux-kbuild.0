Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45725 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387668AbeKVJfV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Nov 2018 04:35:21 -0500
Date: Wed, 21 Nov 2018 14:58:49 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [kconfig-sat] Re: [ANN] init-kconfig - easy way to embrace
 Linux's kconfig
Message-ID: <20181121225849.GC4922@garbanzo.do-not-panic.com>
References: <20181004200249.GL5238@garbanzo.do-not-panic.com>
 <CAK7LNAT3NQnTtdxyz79jgoQHoUS0TxkP99yuoY-N5yALLnFO1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAT3NQnTtdxyz79jgoQHoUS0TxkP99yuoY-N5yALLnFO1A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Petr Vorel <pvorel@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Johannes Berg <johannes@sipsolutions.net>, Valentin Rothberg <valentinrothberg@gmail.com>, Vegard Nossum <vegard.nossum@oracle.com>, nbd@nbd.name, kconfig-sat@googlegroups.com

On Fri, Oct 05, 2018 at 07:48:34PM +0900, Masahiro Yamada wrote:
> Hi,
> 
> 
> 
> On Fri, Oct 5, 2018 at 5:03 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > Every now and then a project is born, and they decide to use Linux's
> > kconfig to enable configuration of their project. As it stands we *know*
> > kconfig is now used in at least over 12 different projects [0]. I myself
> > added kconfig to one as well years ago. Even research reveals that
> > kconfig has become one of the leading industrial variability modeling
> > languages [1] [2].
> >
> > What is often difficult to do though is to start off using kconfig and
> > integrating it into a project. Or updating / syncing to the latest
> > kconfig from upstream Linux.
> >
> > I had yet another need to use kconfig for another small project so
> > decided to make a clean template others can use and help keep it in sync.
> > This is a passive fork which aims to keep in sync with the Linux
> > kernel's latest kconfig to make it easier to keep up to date and to
> > enable new projects to use and embrace kconfig on their own.  The goal
> > is *not* to fork kconfig and evolve it separately, but rather keep in
> > sync with the evolution of kconfig on Linux to make it easier for
> > projects to use kconfig and also update their own kconfig when needed.
> 
> 
> Syncing kconfig files is easy

I disagree. Even as someone who has done this in the past and is an
experience developer it hasn't been a swift process by any mean.

> since the files are collected in the single place, scripts/kconfig/.

That helps, but isn't enough.

> It is true you need some efforts to introduce Kconfig in your project,
> but once established, it is just a matter of copying files
> under scripts/kconfig.

Nope, there is other random subtle work needed, a few of things which
I noted earlier before I forgot what things I had to do / change manually
which we not obvious.

> Copying stuff directly from Linux would be as easy as
> doing so from your init-kconfig.

Clearly I disagree, the idea with init-kconfig is the process of
upkeeping is done centrally, and so users really do just take that
and go.

If we want to make the process smoother upstream, then great.

> > This may also be useful if folks want to test R&D code on a smaller
> > compartamentalized codebase.
> >
> > If you find this useful and you'd like to help keep it in sync, send
> > patches my way as the kernel's kconfig evolves. The code is up on
> > gitlab [3].
> >
> > Do we want to document this option on Linux in case folks want to try
> > and embrace kconfig on their own for other projects?
> >
> > [0] http://www.eng.uwaterloo.ca/~shshe/kconfig_semantics.pdf
> > [1] http://gsd.uwaterloo.ca/sites/default/files/vm-2013-berger.pdf
> > [2] http://gsd.uwaterloo.ca/sites/default/files/ase241-berger_0.pdf
> > [3] https://gitlab.com/mcgrof/init-kconfig
> >
> >   Luis
> 
> 
> Looks like init-kconfig is trying to build some objects as demo.
> 
> obj-y = main.o
> obj-$(CONFIG_FOO) += foo.o
> obj-$(CONFIG_BAR) += bar.o
> obj-$(CONFIG_BAZ) += baz.o
> obj-$(CONFIG_ALPHA) += alpha/

Indeed, we are spoiled with our build process. Mimicing this was
actually a separate effort, and so I didn't match on par, but just
enough to demo a basic use.

> FWIW, this is something I played with some time ago.
> 
> Kbuild Skeleton
> https://github.com/masahir0y/kbuild_skeleton
> 
> It consists of some core Makefiles and Kconfig.
> 
> 
> From the time-stamp, it is already 6 years too old.
> 
> I am not sure if it is useful for people,
> if so, it is pretty easy to sync up with the latest Linux.

Groovy, indeed this is useful thanks. I still think this process can
be improved to allow perhaps both kconfig and its object makefiles magic
& dependency tracking thing be easily sharable. I however understand if
we don't want that to be a goal, there would have to be obvious gains
for it. I don't think we're there yet. Right now it would just make it
easier for enhancements to trickle out to the community and/or fixes to
bubble up, however I don't expect many people doing much kconfig hacking
outside of Linux. Perhaps the best advantage I can think for this as a
goal for us right now is to enable researchers with sandboxes, proof of
concepts, so that we can eventually get the fruits of such work.

  Luis
