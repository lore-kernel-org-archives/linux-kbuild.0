Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45399 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255AbZI1SJA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Sep 2009 14:09:00 -0400
Date: Mon, 28 Sep 2009 20:08:56 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: 32-rc1: "CROSS_COMPILE changed" message breaks compilation
Message-ID: <20090928180856.GB26439@elf.ucw.cz>
References: <20090928175605.GB28514@elf.ucw.cz> <20090928180304.GA26439@elf.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090928180304.GA26439@elf.ucw.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel list <linux-kernel@vger.kernel.org>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Mon 2009-09-28 20:03:04, Pavel Machek wrote:
> On Mon 2009-09-28 19:56:05, Pavel Machek wrote:
> > Hi!
> > 
> > After update to 2.6.32-rc1, I'm getting
> > 
> > "Makefile:197: *** CROSS_COMPILE changed from "ccache" to to "ccache ". Use "make mrproper" to fix it up. Stop.
> > 
> > Note that the message has typo in it ("to to")... What is worse, the
> > message triggers even when I try to run make mrproper. Ouch.
> 
> Ouch, the advice it tells me ("run mrproper") is quite evil -- it
> kills .config which takes quite some effort to generate :-(.
> 
> Plus mrproper does not really fix it up. Even after removing all
> traces of CCACHE, it now complains that ccachegcc is not found.

No, it does not work as intended. I need "ccache " as a
cross-compiler, and system fails to understand that, even if I rm
include/generated/kernel.* (which seems like much better advice than
make mrproper!)
								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
