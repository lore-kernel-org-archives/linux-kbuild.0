Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60439 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752747AbZI1TYd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Sep 2009 15:24:33 -0400
Date: Mon, 28 Sep 2009 21:24:30 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: 32-rc1: "CROSS_COMPILE changed" message breaks compilation
Message-ID: <20090928192430.GD28514@elf.ucw.cz>
References: <20090928175605.GB28514@elf.ucw.cz> <20090928190841.GA12004@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090928190841.GA12004@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kernel list <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Mon 2009-09-28 21:08:41, Sam Ravnborg wrote:
> On Mon, Sep 28, 2009 at 07:56:05PM +0200, Pavel Machek wrote:
> > Hi!
> > 
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

Well, if I changed $CROSS_COMPILE, but not $ARCH, I probably do not
want my .config wiped, right? Maybe I'm updating to another toolchain
or something.

> I will look into improving the message when CROSS_COMPILE changes.

Thanks.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
