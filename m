Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:54067 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753465Ab2D2N3S (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Apr 2012 09:29:18 -0400
Date: Sun, 29 Apr 2012 15:29:16 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: jobserver disabled for make tar*-pkg
Message-ID: <20120429132916.GO27374@one.firstfloor.org>
References: <20120429082542.GM27374@one.firstfloor.org> <20120429094426.GA7859@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120429094426.GA7859@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kbuild@vger.kernel.org

> > iff --git a/scripts/package/Makefile b/scripts/package/Makefile
> > index 87bf080..212ee19 100644
> > --- a/scripts/package/Makefile
> > +++ b/scripts/package/Makefile
> > @@ -105,8 +105,8 @@ clean-dirs += $(objtree)/debian/
> >  # tarball targets
> >  # ---------------------------------------------------------------------------
> >  tar%pkg: FORCE
> > -       $(MAKE) KBUILD_SRC=
> > -       $(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
> > +       +$(MAKE) KBUILD_SRC=
> > +       +$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
> >  
> >  clean-dirs += $(objtree)/tar-install/
> 
> For the following comamnd:
> 
>     make O=o -j8 tar-pkg
> 
> your patch fixed the annoying warning?!?

I still see the warning even with the patch :-(

Hmm, I use a separate objdir. Could that be related?

-Andi


-- 
ak@linux.intel.com -- Speaking for myself only.
