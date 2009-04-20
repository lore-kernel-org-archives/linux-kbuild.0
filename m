Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:42795 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbZDTEki (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2009 00:40:38 -0400
Date: Mon, 20 Apr 2009 06:42:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [GIT] kbuild
Message-ID: <20090420044242.GA8494@uranus.ravnborg.org>
References: <20090419092555.GA19213@uranus.ravnborg.org> <20090419223959.GB12054@linux-sh.org> <20090419234501.GA6475@uranus.ravnborg.org> <alpine.LFD.2.00.0904191745390.2199@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0904191745390.2199@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Paul Mundt <lethal@linux-sh.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Russell King <rmk+lkml@arm.linux.org.uk>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@ZenIV.linux.org.uk>

On Sun, Apr 19, 2009 at 05:52:32PM -0700, Linus Torvalds wrote:
> 
> 
> On Mon, 20 Apr 2009, Sam Ravnborg wrote:
> > 
> > You will soon see a path from me where I fix sh too.
> 
> Can we do a global 'sed s:asm/asm-offsets.h:generated/asm-offsets.h:g' 
> thing too? And then get rid of the include/asm symlink?

As Al also suggest I did a one-asm-offsets.h file per arch so we
can cnvert them one by one.

> That asm-offsets.h mess is scary. I don't quite know why kvm on ia64 seems 
> to do it's own asm-offsets.h file, for example.
Will take a look.

> And arch/blackfin/Makefile 
> mentions arch/$(ARCH)/include/asm/asm-offsets.h (but does it actually do 
> one?).
Thats just a left over from older days when the arch's had to clean up after
themself.

I will try to finish something within a few days and send it out for review.

	Sam
