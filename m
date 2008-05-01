Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:50580 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751299AbYEAVjT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 17:39:19 -0400
Date: Thu, 1 May 2008 23:39:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas
Message-ID: <20080501213952.GA8281@uranus.ravnborg.org>
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net> <20080501120616.GY29330@cs181133002.pp.htv.fi> <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net> <20080501163453.GF29330@cs181133002.pp.htv.fi> <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net> <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net> <20080501191714.GM29330@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080501191714.GM29330@cs181133002.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: sampo@symlabs.com, linux-kbuild@vger.kernel.org

On Thu, May 01, 2008 at 10:17:14PM +0300, Adrian Bunk wrote:
> On Thu, May 01, 2008 at 07:10:42PM +0200, sampo@symlabs.com wrote:
> > Adrian Bunk wrote:
> >...
> > >> > - the output of "sed --version"
> > >>
> > >> sed --version
> > >> GNU sed version 4.1.5-boot
> > >>...
> > >
> > > Where does this "4.1.5-boot" version come from?
> > > Is this some stripped down version of sed?
> > 
> > Interesting question. I do use busybox as my userland for most purposes,
> > but in case of sed I believe it really is the gnu sed.
> > 
> > which sed
> > /usr/bin/sed
> > /usr/bin/sed --version
> > GNU sed version 4.1.5-boot
> >...
> > sampo@jin:/aino/linux 0$ /bin/sed --version
> > This is not GNU sed version 4.0
> > 
> > The former, which is gnu sed, should be picked up by PATH. The latter
> > which appears to be picked by make, is the busybox sed. The gnu sed was
> > compiled by me for my own distro, hence -boot label, but has not been
> > stripped down in any way.
> 
> Thanks, that explains your problems.
> 
> > > If you run
> > >
> > >   sed -ne "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /*
> > > \3 */:; s:->::; p;}" < asm-offsets.s
> > >
> >...
> > > with your asm-offsets.s file and this sed, does the result contain
> > >
> > >   IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)  #
> > >
> > > or
> > >
> > >   #define IA32_SIGCONTEXT_ax 44 /* offsetof(struct sigcontext, ax)
> > > # */
> > 
> > The latter. Which one is correct? Is asm-offsets.h the output of
> > the above command? Please confirm.
> 
> The sed script transform the former to the latter.
> You had the untransformed former which isn't valid code and therefore 
> failed to compile.
> 
> > Since on command line it seems to work fine,
> > but in make time it bombs, I suspect make somehow manages to find
> > the busybox sed, which verifiably produces output
> >... 
> > Thus this is probably a PATH issue of some sort. I will investigate,
> > but will not delay this response.
> > 
> > Of course as a mild feature request, please fix the sed parts to
> > be more tolerant of lesser seds.
> 
> Either more tolerant (which might be non-trivial since there are more 
> sed usages in the kernel).
> 
> Or at least fail with a clear error message.
> 
> @Sam:
> In case you didn't follow this discussion:
> Sampo ran into the problem that the toplevel Kbuild file called a 
> non-GNU sed resulting in a broken asm-offsets.h.

Do we know why it picked up the busy box version?
Because from the commandline it was the correct sed - and I do not
know that make should do different.

	Sam
