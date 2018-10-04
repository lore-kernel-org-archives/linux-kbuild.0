Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58459 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727526AbeJEDg0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Oct 2018 23:36:26 -0400
Date: Thu, 4 Oct 2018 13:41:18 -0700
From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [kconfig-sat] [ANN] init-kconfig - easy way to embrace Linux's
 kconfig
Message-ID: <20181004204117.GA10640@localhost>
References: <20181004200249.GL5238@garbanzo.do-not-panic.com>
 <20181004200859.GA10237@localhost>
 <20181004203950.GN5238@garbanzo.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181004203950.GN5238@garbanzo.do-not-panic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Petr Vorel <pvorel@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Johannes Berg <johannes@sipsolutions.net>, Valentin Rothberg <valentinrothberg@gmail.com>, Vegard Nossum <vegard.nossum@oracle.com>, Felix Fietkau <nbd@nbd.name>, kconfig-sat@googlegroups.com

On Thu, Oct 04, 2018 at 01:39:50PM -0700, Luis Chamberlain wrote:
> On Thu, Oct 04, 2018 at 01:09:00PM -0700, Josh Triplett wrote:
> > On Thu, Oct 04, 2018 at 01:02:49PM -0700, Luis Chamberlain wrote:
> > > Every now and then a project is born, and they decide to use Linux's
> > > kconfig to enable configuration of their project. As it stands we *know*
> > > kconfig is now used in at least over 12 different projects [0]. I myself
> > > added kconfig to one as well years ago. Even research reveals that
> > > kconfig has become one of the leading industrial variability modeling
> > > languages [1] [2].
> > > 
> > > What is often difficult to do though is to start off using kconfig and
> > > integrating it into a project. Or updating / syncing to the latest
> > > kconfig from upstream Linux.
> > > 
> > > I had yet another need to use kconfig for another small project so
> > > decided to make a clean template others can use and help keep it in sync.
> > > This is a passive fork which aims to keep in sync with the Linux
> > > kernel's latest kconfig to make it easier to keep up to date and to
> > > enable new projects to use and embrace kconfig on their own.  The goal
> > > is *not* to fork kconfig and evolve it separately, but rather keep in
> > > sync with the evolution of kconfig on Linux to make it easier for
> > > projects to use kconfig and also update their own kconfig when needed.
> > 
> > Is there a *fundamental* reason that we couldn't have this *be* Linux
> > kconfig, whether pulled in by submodule or regular merges, and avoid
> > having any divergence at all?
> 
> The structure of kconfig in Linux would have to be changed to make
> adoption and sync easier. If that is a goal we wish to embrace, I'm
> all for it.

I would *love* to see Kconfig in Linux evolved to be more easily reused.
