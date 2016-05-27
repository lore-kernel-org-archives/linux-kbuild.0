Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:57598 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755997AbcE0VhH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 May 2016 17:37:07 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] kbuild updates for v4.7-rc1
Date: Fri, 27 May 2016 23:36:51 +0200
Message-ID: <6059647.tYvRSTXOxn@wuerfel>
In-Reply-To: <CA+55aFzQ4oe6cT5xf=3xT1d6ji2L_her8AmJxpsixFw_GavDvg@mail.gmail.com>
References: <20160526203346.GA4734@pobox.suse.cz> <9633365.kM71HHzq9d@wuerfel> <CA+55aFzQ4oe6cT5xf=3xT1d6ji2L_her8AmJxpsixFw_GavDvg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.com>, =?utf-8?B?0JzQsNC60YEg0JbRg9C60L7Qsg==?= <mussitantesmortem@gmail.com>, nicolas.ferre@atmel.com, Nicolas Pitre <nicolas.pitre@linaro.org>, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>

On Friday, May 27, 2016 1:20:29 PM CEST Linus Torvalds wrote:
> On Fri, May 27, 2016 at 1:04 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > In fact, the patch that I have in my private tree that was hiding the
> > warning for me on x86 is one that removes all instances of IS_ERR_VALUE()
> > with arguments other than 'unsigned long', see http://pastebin.com/uYa2mkgC
> > for reference.
> 
> Please just send me that patch, we need to do this (and then add a
> cast to pointer (and back to unsigned long) in IS_ERR_VALUE() so that
> we get warnings for when that macro is mis-used.

Ok, I've tried to come up with a summary of what happened so far
on this, and sent the patch your way, leaving out the modified
IS_ERR_VALUE() definition for the moment.

I've added the people on Cc whose drivers had the most invasive
changes.

> I didn't look at the details of your patch, but I did look at several
> IS_ERR_VALUE() uses in the standard kernel, and they were basically
> all wrong.

Yes, that matches what we found earlier this year when Andrzej Hajda
did some work on fixing the worst problems he found.

	Arnd

