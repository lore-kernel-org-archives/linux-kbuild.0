Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f196.google.com ([209.85.213.196]:33346 "EHLO
	mail-ig0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756572AbcE0UUa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 May 2016 16:20:30 -0400
MIME-Version: 1.0
In-Reply-To: <9633365.kM71HHzq9d@wuerfel>
References: <20160526203346.GA4734@pobox.suse.cz>
	<5345273.JScMX9oohG@wuerfel>
	<CA+55aFw0RN=7XZa7Kt2bcvk1a_5yAxYW1tVhr-jjCnozsf1MSw@mail.gmail.com>
	<9633365.kM71HHzq9d@wuerfel>
Date: Fri, 27 May 2016 13:20:29 -0700
Message-ID: <CA+55aFzQ4oe6cT5xf=3xT1d6ji2L_her8AmJxpsixFw_GavDvg@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild updates for v4.7-rc1
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, =?UTF-8?B?0JzQsNC60YEg0JbRg9C60L7Qsg==?= <mussitantesmortem@gmail.com>, nicolas.ferre@atmel.com, Nicolas Pitre <nicolas.pitre@linaro.org>, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>

On Fri, May 27, 2016 at 1:04 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>
> In fact, the patch that I have in my private tree that was hiding the
> warning for me on x86 is one that removes all instances of IS_ERR_VALUE()
> with arguments other than 'unsigned long', see http://pastebin.com/uYa2mkgC
> for reference.

Please just send me that patch, we need to do this (and then add a
cast to pointer (and back to unsigned long) in IS_ERR_VALUE() so that
we get warnings for when that macro is mis-used.

I didn't look at the details of your patch, but I did look at several
IS_ERR_VALUE() uses in the standard kernel, and they were basically
all wrong. Even the ones that used it for the rigth reason (vm_brk()
that returns a pointer or an error in an "unsigned long") had actively
screwed up and truncated that (correct) unsigned long value to "int"
before doing the IS_ERR_VALUE(), which made it all wrong again.

And the other users just looked entirely bogus, and were all just
"zero or negative error code" that has nothing to do with
IS_ERR_VALUE(). The code should just check against zero, not use that
macro that was designed for something different.

                Linus
