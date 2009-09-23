Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39383 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754192AbZIWHRH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2009 03:17:07 -0400
Date: Wed, 23 Sep 2009 09:16:41 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [patch 11/18] kconfig CROSS_COMPILE option
Message-ID: <20090923071641.GA8565@elf.ucw.cz>
References: <200909181949.n8IJnVSB019127@imap1.linux-foundation.org> <20090919090241.GA25877@merkur.ravnborg.org> <20090919121950.A599F2728@magilla.sf.frob.com> <20090919131316.GA26044@merkur.ravnborg.org> <20090919234823.12E5E13BA3@magilla.sf.frob.com> <20090920103108.GA26667@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090920103108.GA26667@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roland McGrath <roland@redhat.com>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

Hi!

> > > Another approach would be to ask kbuild for
> > > this information so we do not expose various filenames to the
> > > outer world.
> > 
> > For shell scripts and makefiles, running a command like make and retrieving
> > its output via pipe is de rigueur.  But for some other programs it might be
> > substantially less hassle to just read plain files.  That's what I was
> > thinking, anyway.  (I only really think that $ARCH is something that anyone
> > would want to fetch before they'd run make anyway, and I guess $SUBARCH in
> > the case of ARCH=um, but not $CROSS_COMPILE.)
> > 
> > > This is analogous to the way we ask for
> > > kernelrelease and kernelversion these days.
> > 
> > Except that include/config/kernel.release is there for all to see (when
> > referring to /lib/modules/.../build directory, e.g.), so perhaps some
> > people are in fact using that.
> 
> So when I move that file to include/generated I will break users script silently - sigh.
> 
> Revised patch following your guidelines below.
> Does this look better to you?

Well.. having that option in .config, so it can be easily transported
between trees (as proposed originally) would be even nicer, but I
guess this is better than nothing.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
