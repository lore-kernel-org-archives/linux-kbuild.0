Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35315 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752507AbbIWPsL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 11:48:11 -0400
Date: Wed, 23 Sep 2015 17:48:09 +0200
From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: [PATCH] kbuild: document recursive dependency limitation /
 resolution
Message-ID: <20150923154809.GC18173@wotan.suse.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <55B938EA.2080402@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55B938EA.2080402@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, pebolle@tiscali.nl, herbert@gondor.apana.org.au, tiwai@suse.de, yann.morin.1998@free.fr, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc

On Wed, Jul 29, 2015 at 01:34:50PM -0700, Randy Dunlap wrote:
> On 07/29/15 13:09, Luis R. Rodriguez wrote:
> > +
> > +Kconfig recursive dependency limitations
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +If you've hit the Kconfig error: "recursive dependency detected" you've run
> > +into a recursive dependency issue with Kconfig. Kconfig does not do recursive
> > +dependency resolution, this has a few implications for Kconfig file writers. In
> 
> maybe                 s/,/;/

Fixed.

> > +practice it means that for instance if a driver A selects a few kconfig symbols
> > +another driver B which selects any of these symbols cannot negate any of the
> > +symbols the driver A selected.  Because of this current limitation developers
> > +who run into this type of recursive dependency issue have two diverging
> > +options:
> > +
> > +  a) Either swap all "select FOO" to "depends on FOO" or,
> > +  b) Change the offending "depends on FOO" to "select FOO"
> > +
> > +Kconfig's limitations can be addressed by implementing a SAT solver for it,
> > +but until then, Kconfig is limitted to require developers to use one of
> 
>                               limited
> 

I've re-written this section, thanks for the review.

  Luis
