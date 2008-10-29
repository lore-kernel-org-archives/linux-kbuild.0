Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mtaout01-winn.ispmail.ntl.com ([81.103.221.47]:37651 "EHLO
	mtaout01-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753415AbYJ2Tvb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 15:51:31 -0400
From: Ian Campbell <ijc@hellion.org.uk>
In-Reply-To: <20081029190707.GD22105@uranus.ravnborg.org>
References: <1225200985.12607.186.camel@zakaz.uk.xensource.com>
	 <20081029190707.GD22105@uranus.ravnborg.org>
Content-Type: text/plain
Date: Wed, 29 Oct 2008 19:51:13 +0000
Message-Id: <1225309873.5267.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: KBUILD: do not include arch/<ARCH>/include/asm in find-sources
	twice.
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, 2008-10-29 at 20:07 +0100, Sam Ravnborg wrote:
> On Tue, Oct 28, 2008 at 01:36:25PM +0000, Ian Campbell wrote:
> > Architectures which have moved their includes to arch/<ARCH>/include
> > now list the headers twice in the source listing used by "make
> > cscope" and friends, causing those tools to list symbols twice.
> > 
> > Skipping these files in the ALLSOURCE_ARCHS pass rather than removing
> > the ALLINCLUDE_ARCHS pass preserves the semantics of the later.
> > 
> > Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: linux-kbuild@vger.kernel.org
> > 
> > diff -r a613b893f5b5 Makefile
> > --- a/Makefile	Mon Oct 27 10:29:49 2008 +0000
> > +++ b/Makefile	Tue Oct 28 13:33:04 2008 +0000
> > @@ -1435,7 +1435,8 @@
> >  define find-sources
> >          ( for arch in $(ALLSOURCE_ARCHS) ; do \
> >  	       find $(__srctree)arch/$${arch} $(RCS_FIND_IGNORE) \
> > -	            -name $1 -print; \
> > +		    -wholename $(__srctree)arch/$${arch}/include/asm -type d -prune \
> > +	            -o -name $1 -print; \
> >  	  done ; \
> >  	  find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE) \
> >  	       -name $1 -print; \
> > 
> 
> Hi Ian.
> 
> I would much rather prefer to see a patch that
> - support the platforms of arm and others

How do you mean?

        $ ls arch/arm/include/
        asm/

so it'll work as well for arm as it does for any other architecture.

All this patch does is stop the ALLSOURCE_ARCH loop from covering files
which are also picked up by the ALLINCLUDE_ARCH loop. Including those
files twice is a regression from before the headers got moved.

> - uses the fact that all arch have their header files moved
>   to arch/$ARCH/include
>   [Ignore the archs that are lacking behind]

in that case you would simply also remove the :
		test -e $(__srctree)include/asm-$${arch} && \
                 find $(__srctree)include/asm-$${arch} $(RCS_FIND_IGNORE) \
                    -name $1 -print; \
from the ALLINCLUDE_ARCHS loop.

> And if we could simplify this "find file" list on top of that it would be extra bonus.

Unless you want to get rid of the distinction between ALLINCLUDE_ARCHS
and ALLSOURCE_ARCHS I don't think it can get any simpler. If you did
want to get rid of that distinction then it would simply be a case of
removing the ALLINCLUDE_ARCHS loop and ignoring this patch.

Ian.
-- 
Ian Campbell

Perhaps they will have to outlaw sending random lists of words.  fee fie
foe foo [sic]
		-- Larry Wall in <199710311916.LAA19760@wall.org>

