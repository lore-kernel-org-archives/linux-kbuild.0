Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44135 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752461AbbBCAHc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Feb 2015 19:07:32 -0500
Date: Mon, 2 Feb 2015 21:07:43 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH] tools: unbreak 'make tools/*'
Message-ID: <20150203000743.GI3101@kernel.org>
References: <1422506856-28631-1-git-send-email-computersforpeace@gmail.com>
 <20150202234309.GB3992@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150202234309.GB3992@ld-irv-0074>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>

Em Mon, Feb 02, 2015 at 03:43:09PM -0800, Brian Norris escreveu:
> Ping?

Thanks for submitting the patch, its just that I am busy at the moment,
preparing for travel, I will process this patch eventually.

- Arnaldo
 
> On Wed, Jan 28, 2015 at 08:47:36PM -0800, Brian Norris wrote:
> > The following targets should be supported from the top-level source
> > directory, but were broken by commit 7e1c04779efd ("kbuild: Use relative
> > path for $(objtree)"):
> > 
> >  $ make tools/
> >  $ make tools/perf
> >  $ make O=$(BUILDDIR) tools/perf
> > 
> > The tools/ and tools/% targets are passing the top-level build directory
> > as an O= argument, so we need a full path, not a relative one, as the
> > $(O) variable will be reinterpreted by the sub-makefile.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Michal Marek <mmarek@suse.cz>
> > ---
> >  Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 95a0e827ecd3..59033c8bf93a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1496,11 +1496,11 @@ image_name:
> >  # Clear a bunch of variables before executing the submake
> >  tools/: FORCE
> >  	$(Q)mkdir -p $(objtree)/tools
> > -	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(objtree) subdir=tools -C $(src)/tools/
> > +	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(CURDIR) subdir=tools -C $(src)/tools/
> >  
> >  tools/%: FORCE
> >  	$(Q)mkdir -p $(objtree)/tools
> > -	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(objtree) subdir=tools -C $(src)/tools/ $*
> > +	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(CURDIR) subdir=tools -C $(src)/tools/ $*
> >  
> >  # Single targets
> >  # ---------------------------------------------------------------------------
> > -- 
> > 2.3.0.rc1
> > 
