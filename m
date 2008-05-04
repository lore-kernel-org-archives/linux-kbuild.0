Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:48700 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752012AbYEDICh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 04:02:37 -0400
Date: Sun, 4 May 2008 11:01:37 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [2.6 patch] kconfig-language.txt: remove bogus hint
Message-ID: <20080504080137.GF5838@cs181133002.pp.htv.fi>
References: <20080503231535.GY5838@cs181133002.pp.htv.fi> <20080504061741.GA14784@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080504061741.GA14784@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-kbuild@vger.kernel.org

On Sun, May 04, 2008 at 08:17:41AM +0200, Sam Ravnborg wrote:
> On Sun, May 04, 2008 at 02:15:35AM +0300, Adrian Bunk wrote:
> > This kconfig construct described here is required in a different and 
> > much more complicated situation.
> Please elaborate...

In the hint C is described as a tristate.

But you need this idiom only when A is a tristate and C is a bool.

Understanding when to apply this idiom requiers an understanding that we 
use bool for two quite different cases:
- non-modular driver and
- enable feature in driver,
and the semantics bool's have in kconfig (e.g. select has the 
semantics for the former case and dependencies have the semantics
for the latter case, which does not sound logical but seems to actually 
cover most use cases).

> 	Sam
> 
> > 
> > For the use case the hint claimed it would be a simple dependency is 
> > enough.
> > 
> > Signed-off-by: Adrian Bunk <bunk@kernel.org>
> > 
> > ---
> > 8e3fd4a5e77c9cd1b52989cd72e984b47ad426b4 diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
> > index 00b950d..c412c24 100644
> > --- a/Documentation/kbuild/kconfig-language.txt
> > +++ b/Documentation/kbuild/kconfig-language.txt
> > @@ -377,27 +377,3 @@ config FOO
> >  
> >  limits FOO to module (=m) or disabled (=n).
> >  
> > -
> > -Build limited by a third config symbol which may be =y or =m
> > -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > -A common idiom that we see (and sometimes have problems with) is this:
> > -
> > -When option C in B (module or subsystem) uses interfaces from A (module
> > -or subsystem), and both A and B are tristate (could be =y or =m if they
> > -were independent of each other, but they aren't), then we need to limit
> > -C such that it cannot be built statically if A is built as a loadable
> > -module.  (C already depends on B, so there is no dependency issue to
> > -take care of here.)
> > -
> > -If A is linked statically into the kernel image, C can be built
> > -statically or as loadable module(s).  However, if A is built as loadable
> > -module(s), then C must be restricted to loadable module(s) also.  This
> > -can be expressed in kconfig language as:
> > -
> > -config C
> > -	depends on A = y || A = B
> > -
> > -or for real examples, use this command in a kernel tree:
> > -
> > -$ find . -name Kconfig\* | xargs grep -ns "depends on.*=.*||.*=" | grep -v orig
> > -
> > 

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

