Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gprs189-60.eurotel.cz ([160.218.189.60]:2176 "EHLO spitz.ucw.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757021AbYEXV1D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 24 May 2008 17:27:03 -0400
Date: Sat, 24 May 2008 23:26:29 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH] kconfig: introduce KCONFIG_* symbols for .c files
Message-ID: <20080524212628.GA4040@ucw.cz>
References: <20080524192540.GA28067@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080524192540.GA28067@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, Jeremy Fitzhardinge <jeremy@goop.org>

Hi!

> One line smaller and we follow the normal flow in the program.
> The code is always build but we do not waste space as gcc will
> do proper code-elimination for us.
> 
> Today this is not possible because kconfig will only
> define CONFIG_FOO if selected and FOO is not a module.
> 
> The following patch implement a new set of defines in
> the KCONFIG_* namespace.

Could we s/KCONFIG_/CFG_/g ?

CONFIG_ is long enough already, and K there is very maningless.....


							Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
