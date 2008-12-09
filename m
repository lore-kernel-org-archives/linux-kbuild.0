Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:48805 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752976AbYLISCh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Dec 2008 13:02:37 -0500
Date: Tue, 9 Dec 2008 19:04:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Message-ID: <20081209180405.GA5890@uranus.ravnborg.org>
References: <20081208205814.GA22697@uranus.ravnborg.org> <20081209054528.GA1407@uranus.ravnborg.org> <Pine.LNX.4.64.0812090921310.29640@anakin> <200812091202.47150.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812091202.47150.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Dec 09, 2008 at 12:02:46PM +0100, Arnd Bergmann wrote:
> On Tuesday 09 December 2008, Geert Uytterhoeven wrote:
> > What are the other exported headers that differ?
> 
> byteorder.h, param.h, ptrace.h, setup.h, sigcontext.h, siginfo.h, signal.h
> and unistd.h.

And diffing these files for the most part it looked like
a simple job for someone with some basic m68k/m68knommu knowledge
to unify these.

That would be a natural next step when the headers
are unified. I do not see it as a prerequisite for the
merge of the header files.

	Sam
