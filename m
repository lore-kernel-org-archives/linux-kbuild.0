Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:57926 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752509Ab0HQCTi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 22:19:38 -0400
Date: Tue, 17 Aug 2010 04:19:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC 0/2] Factor Kconfig's prefix and package name
Message-ID: <20100817021937.GA9849@merkur.ravnborg.org>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com> <20100816123642.GA7233@merkur.ravnborg.org> <AANLkTimkEBaLs9Mx8V3_PLdj_-ioaRRo3JAjLH4MJBRd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTimkEBaLs9Mx8V3_PLdj_-ioaRRo3JAjLH4MJBRd@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Mon, Aug 16, 2010 at 09:12:18PM -0400, Arnaud Lacombe wrote:
> Hi,
> 
> On Mon, Aug 16, 2010 at 8:36 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> > 2) References to kernel + version in title in frontends
> >  - Use the (today unused) mainmenu entry to pick up the
> >    title.
> >    Consider following example:
> >
> > mainmenu "Linux kernel configuration v$KERNELVERSION"
> >
> > config KERNELVERSION
> >        string
> >        option env=KERNELVERSION
> >
> actually, this will need to be more tricky as there is not one, but 2 titles:
> 
>  - "Linux Kernel Configuration" hardcoded in zconf.c
>  - "Linux Kernel v$KERNELVERSION Configuration" in {g,m,n,q}conf.c
> 
> The first prompt does not seem to be easily discardable, and I'm not
> sure if it can be made dynamical, as we will need to make any
> substitution only when everything else will have been parsed. In any
> case I need to dig more in the code...

If you look closer you will see that the prompt in zconf.y is not used
at all.

> 
>  - Arnaud
> 
> ps: Sam, do you mind if I have a look at this ? the rephrasing and
> prefix substitution will not take that much time.

I would only be happy if you do so, any help is appreciated!

	Sam 
