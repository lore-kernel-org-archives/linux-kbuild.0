Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:33366 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752746AbZBOLj7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Feb 2009 06:39:59 -0500
Date: Sun, 15 Feb 2009 12:41:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] KBUILD: Create the source symlink earlier in the objdir
Message-ID: <20090215114149.GB31771@uranus.ravnborg.org>
References: <20090110035613.GA7225@basil.nowhere.org> <20090215103659.GC31088@uranus.ravnborg.org> <20090215111608.GE26292@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090215111608.GE26292@one.firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Feb 15, 2009 at 12:16:08PM +0100, Andi Kleen wrote:
> > diff --git a/Makefile b/Makefile
> > index 22d7584..76ee131 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -388,6 +388,7 @@ PHONY += outputmakefile
> >  # separate output directory. This allows convenient use of make in the
> >  # output directory.
> >  outputmakefile:
> > +	$(Q)ln -fsn $(srctree) source
> >  ifneq ($(KBUILD_SRC),)
> 
> Haven't tried it, but
> doesn't that create the symlink in the non separate objdir case too
> because it's outside the ifneq?
Yep - thanks for spotting it!

	Sam
