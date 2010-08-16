Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:40174 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023Ab0HPR1A (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 13:27:00 -0400
Date: Mon, 16 Aug 2010 19:26:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC 1/2] kbuild: genericizes package name
Message-ID: <20100816172658.GA7881@merkur.ravnborg.org>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com> <1281934457-4225-2-git-send-email-lacombar@gmail.com> <4C692795.1020907@suse.cz> <4C692DC0.7020002@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C692DC0.7020002@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Aug 16, 2010 at 02:23:28PM +0200, Michal Marek wrote:
> Dne 16.8.2010 13:57, Michal Marek napsal(a):
> > Dne 16.8.2010 06:54, Arnaud Lacombe napsal(a):
> >> -	sym = sym_lookup("KERNELVERSION", 0);
> >> +	sym = sym_lookup("PROJECTVERSION", 0);
> > 
> > The required change to the top-level Makefile is missing. I suggest you
> > rather replace "KERNELVERSION" with a macro defaulting to
> > "KERNELVERSION", so that we don't have to change it in the Makefile and
> > other scripts.
> 
> Maybe a cleaner way would be to use the same syntax as for
> DEFCONFIG_LIST or MODULES, i.e. mark KERNELVERSION specially in the
> Kconfig file:
> 
> config KERNELVERSION
>     string
>     option version env=
> 
> and then look for a symbol with this property in kconfig.

I liked my proposal better - but alas that require some kconfig changes.
I would be glad to receive your opinion on the suggested changes before
putting too much time on it.

Note: I have not touced upon the "how do external projects build kconfig".
I dunno yet what to do there and I consider the other topics more relevant
as this will help existing users that have already solved the build stuff.

	Sam
