Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60533 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752521AbZI1TZi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Sep 2009 15:25:38 -0400
Date: Mon, 28 Sep 2009 21:25:36 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: 32-rc1: "CROSS_COMPILE changed" message breaks compilation
Message-ID: <20090928192536.GE28514@elf.ucw.cz>
References: <20090928175605.GB28514@elf.ucw.cz> <20090928190841.GA12004@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090928190841.GA12004@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kernel list <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi!

> > After update to 2.6.32-rc1, I'm getting
> > 
> > "Makefile:197: *** CROSS_COMPILE changed from "ccache" to to "ccache ". Use "make mrproper" to fix it up. Stop.
> > 
> > Note that the message has typo in it ("to to")... What is worse, the
> > message triggers even when I try to run make mrproper. Ouch.
> 
> The massage is changed in kbuild-fixes.git - but it addresses only ARCH=
> 
> As a followup to your other mails:
> The reason to use "make mrproper" is that when ARCH or CROSS_COMPILE changes
> you have generally either decided to build for a new architecture or
> you have changed the way you build the kernel (new toolchain or whatever).
> So to clean up using "make mrproper" is perfectly justified.
> 
> The target group that uses CROSS_COMPILE to enable ccache are using
> CROSS_COMPILE is a way it is not designed for so they should expect that it
> is not a perfect match.

What is the recommended way to run ccache, then?
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
