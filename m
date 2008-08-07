Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:60949 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755706AbYHGM0Z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Aug 2008 08:26:25 -0400
Date: Thu, 7 Aug 2008 10:18:10 +0100
From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: [GIT PULL] kbuild fixes
Message-ID: <20080807091810.GB14078@flint.arm.linux.org.uk>
References: <20080806202738.GA20066@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080806202738.GA20066@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Denis ChengRq <crquan@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, Randy Dunlap <randy.dunlap@oracle.com>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Aug 06, 2008 at 10:27:38PM +0200, Sam Ravnborg wrote:
> Please pull following kbuild related fixes.
> 
> o Fix "make O=..." builds for arm
> o update to for newer cscope
> o patch-kernel fix (but I doubt it has many uses)
> o small Kconfig clean-up

Note that I've also merged your tree into mine, so I can test my
further asm-arm renames with something that works.  So far, it's
looking good, thanks.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
