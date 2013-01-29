Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:64341 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753067Ab3A2Lnh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jan 2013 06:43:37 -0500
Received: from mailout-de.gmx.net ([10.1.76.30]) by mrigmx.server.lan
 (mrigmx001) with ESMTP (Nemesis) id 0Lg2yr-1UnkIG3i0Z-00pdJi for
 <linux-kbuild@vger.kernel.org>; Tue, 29 Jan 2013 12:43:35 +0100
From: Egon Alter <egon.alter@gmx.net>
Subject: Re: [RFC PATCH 0/4] Add support for LZ4-compressed kernels
Date: Tue, 29 Jan 2013 12:43:20 +0100
Message-ID: <34874167.ghObrToI03@fb07-iapwap2>
In-Reply-To: <20130129101549.GP23505@n2100.arm.linux.org.uk>
References: <1359179447-31118-1-git-send-email-kyungsik.lee@lge.com> <20130128142510.68092e10.akpm@linux-foundation.org> <20130129101549.GP23505@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, hyojun.im@lge.com, raphael.andy.lee@gmail.com, linux-kbuild@vger.kernel.org, gunho.lee@lge.com, namhyung.kim@lge.com, x86@kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nitin Gupta <nitingupta910@gmail.com>, Richard Purdie <rpurdie@openedhand.com>, Ingo Molnar <mingo@redhat.com>, Joe Millenbach <jmillenbach@gmail.com>, chan.jeong@lge.com, Kyungsik Lee <kyungsik.lee@lge.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, CE Linux Developers List <celinux-dev@lists.celinuxforum.org>, minchan.kim@lge.com

Am Dienstag, 29. Januar 2013, 10:15:49 schrieb Russell King - ARM Linux:
> On Mon, Jan 28, 2013 at 02:25:10PM -0800, Andrew Morton wrote:
> > What's this "with enabled unaligned memory access" thing?  You mean "if
> > the arch supports CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS"?  If so,
> > that's only x86, which isn't really in the target market for this
> > patch, yes?
> > 
> > It's a lot of code for a 50ms boot-time improvement.  Does anyone have
> > any opinions on whether or not the benefits are worth the cost?
> 
> Well... when I saw this my immediate reaction was "oh no, yet another
> decompressor for the kernel".  We have five of these things already.
> Do we really need a sixth?
> 
> My feeling is that we should have:
> - one decompressor which is the fastest
> - one decompressor for the highest compression ratio
> - one popular decompressor (eg conventional gzip)

the problem gets more complicated as the "fastest" decompressor usually 
creates larger images which need more time to load from the storage, e.g. a 
one MB larger image on a 10 MB/s storage (note: bootloaders often configure 
the  storage controllers in slow modes) gives 100 ms more boot time, thus 
eating the gain of a "fast decompressor".

	Egon

