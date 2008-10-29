Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:51689 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753847AbYJ2V3e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 17:29:34 -0400
Date: Wed, 29 Oct 2008 22:29:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: KBUILD: do not include arch/<ARCH>/include/asm in find-sources twice.
Message-ID: <20081029212928.GA24474@uranus.ravnborg.org>
References: <1225200985.12607.186.camel@zakaz.uk.xensource.com> <20081029190707.GD22105@uranus.ravnborg.org> <1225309873.5267.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1225309873.5267.10.camel@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: linux-kbuild@vger.kernel.org

On Wed, Oct 29, 2008 at 07:51:13PM +0000, Ian Campbell wrote:
> On Wed, 2008-10-29 at 20:07 +0100, Sam Ravnborg wrote:
> > On Tue, Oct 28, 2008 at 01:36:25PM +0000, Ian Campbell wrote:
> > > Architectures which have moved their includes to arch/<ARCH>/include
> > > now list the headers twice in the source listing used by "make
> > > cscope" and friends, causing those tools to list symbols twice.
> > > 
> > > Skipping these files in the ALLSOURCE_ARCHS pass rather than removing
> > > the ALLINCLUDE_ARCHS pass preserves the semantics of the later.
> > > 
> > > Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: linux-kbuild@vger.kernel.org
> > > 
> > > diff -r a613b893f5b5 Makefile
> > > --- a/Makefile	Mon Oct 27 10:29:49 2008 +0000
> > > +++ b/Makefile	Tue Oct 28 13:33:04 2008 +0000
> > > @@ -1435,7 +1435,8 @@
> > >  define find-sources
> > >          ( for arch in $(ALLSOURCE_ARCHS) ; do \
> > >  	       find $(__srctree)arch/$${arch} $(RCS_FIND_IGNORE) \
> > > -	            -name $1 -print; \
> > > +		    -wholename $(__srctree)arch/$${arch}/include/asm -type d -prune \
> > > +	            -o -name $1 -print; \
> > >  	  done ; \
> > >  	  find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE) \
> > >  	       -name $1 -print; \
> > > 
> > 
> > Hi Ian.
> > 
> > I would much rather prefer to see a patch that
> > - support the platforms of arm and others
> 
> How do you mean?
> 
>         $ ls arch/arm/include/
>         asm/
> 
> so it'll work as well for arm as it does for any other architecture.

fyi - I have applied your patch to kbuild-fixes.

I hope this stuff can be simplified one day.
I continue to see a steady stream of patches dealing with tags and cscope.

Maybe the right thing to do is to just move it all out in a shell
script so we do not clutter the makefile with all this.

	Sam
