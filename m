Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:59094 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752363AbYFUWKw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Jun 2008 18:10:52 -0400
Date: Sun, 22 Jun 2008 00:11:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Support arch/$ARCH/include in kbuild
Message-ID: <20080621221137.GD12279@uranus.ravnborg.org>
References: <20080621220703.GA12279@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080621220703.GA12279@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>

> 
> Patches are on top of kbuild-next.git and follows.

Just to make it crystal clear.
These patches are for comment and I will await feedback before
pushing to kbuild-next.git (and thus -next).


And archs are not forced to move their header files now.
They can wait until it fits their schedule.

	Sam
