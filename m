Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:32936 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756286AbaEPKOr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 May 2014 06:14:47 -0400
Date: Fri, 16 May 2014 12:14:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Documentation/kbuild/makefiles.txt: Improve description
 of lib-* targets
Message-ID: <20140516101433.GB10187@ravnborg.org>
References: <20140511050252.19596.qmail@ns.horizon.com>
 <5373DE43.5010404@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5373DE43.5010404@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: George Spelvin <linux@horizon.com>, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, Michal Marek <mmarek@suse.cz>

On Wed, May 14, 2014 at 02:21:07PM -0700, Randy Dunlap wrote:
> On 05/10/2014 10:02 PM, George Spelvin wrote:
> > I had to ask on the mailing list, so save developers the bother of
> > answering the question again.  (Wanna-be kernel developers might also
> > be helped, but who cares about them?)
> > 
> > Signed-off-by: George Spelvin <linux@horizon.com>
> > ---
> > As with most documentation patches, this is also an exercise in eliciting
> > corrections by proposing a wrong answer which will be jumped on.
> 
> Hi Michal,
> 
> Any comments on this patch?
> 
> Thanks.
> 
> > 
> >  Documentation/kbuild/makefiles.txt | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> > index d567a7cc55..f6cc266163 100644
> > --- a/Documentation/kbuild/makefiles.txt
> > +++ b/Documentation/kbuild/makefiles.txt
> > @@ -237,10 +237,29 @@ more details, with real examples.
> >  	be included in a library, lib.a.
> >  	All objects listed with lib-y are combined in a single
> >  	library for that directory.
> > +
> > +	The entire kernel is then linked against these libraries,
> > +	so the linker will include the code in the final kernel only
> > +	if it is referenced somewhere.  Thus, lib-* goals may be
> > +	designed with false positives.
> > +
> >  	Objects that are listed in obj-y and additionally listed in
> >  	lib-y will not be included in the library, since they will
> >  	be accessible anyway.
> > -	For consistency, objects listed in lib-m will be included in lib.a.
> > +
> > +	For consistency, objects listed in lib-m will be included
> > +	in lib.a, but this will probably not do what you want.

So maybe we should catch this and error out?

	Sam
