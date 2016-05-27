Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:33734 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756572AbcE0Vw0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 May 2016 17:52:26 -0400
Date: Fri, 27 May 2016 22:52:10 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [GIT PULL] kbuild updates for v4.7-rc1
Message-ID: <20160527215210.GU14480@ZenIV.linux.org.uk>
References: <20160526203346.GA4734@pobox.suse.cz>
 <5345273.JScMX9oohG@wuerfel>
 <CA+55aFw0RN=7XZa7Kt2bcvk1a_5yAxYW1tVhr-jjCnozsf1MSw@mail.gmail.com>
 <9633365.kM71HHzq9d@wuerfel>
 <CA+55aFzQ4oe6cT5xf=3xT1d6ji2L_her8AmJxpsixFw_GavDvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+55aFzQ4oe6cT5xf=3xT1d6ji2L_her8AmJxpsixFw_GavDvg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>, =?utf-8?B?0JzQsNC60YEg0JbRg9C60L7Qsg==?= <mussitantesmortem@gmail.com>, nicolas.ferre@atmel.com, Nicolas Pitre <nicolas.pitre@linaro.org>, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>

On Fri, May 27, 2016 at 01:20:29PM -0700, Linus Torvalds wrote:

> I didn't look at the details of your patch, but I did look at several
> IS_ERR_VALUE() uses in the standard kernel, and they were basically
> all wrong. Even the ones that used it for the rigth reason (vm_brk()
> that returns a pointer or an error in an "unsigned long") had actively
> screwed up and truncated that (correct) unsigned long value to "int"
> before doing the IS_ERR_VALUE(), which made it all wrong again.
> 
> And the other users just looked entirely bogus, and were all just
> "zero or negative error code" that has nothing to do with
> IS_ERR_VALUE(). The code should just check against zero, not use that
> macro that was designed for something different.

Both gfs2 ones and the one in fs/romfs are crap.  AFS one is simply ridiculous -
        result = generic_file_write_iter(iocb, from);
        if (IS_ERR_VALUE(result)) {
                _leave(" = %zd", result);
                return result;
        }

        _leave(" = %zd", result);
        return result;
In binfmt*.c some callers are valid (vm_mmap and vm_brk values; BTW, the
code in binfmt_flat.c checks for vm_mmap returning 0, which should never
happen, AFAICS).  Most of binfmt_flat.c ones are pure cargo-culting.

net/9p/client.c ones are results of serious mistake in design of 9P.L
extensions to 9P - they assume that numeric values of E... are
architecture-independent and send them over the wire.  The uses of
IS_ERR_VALUE there are papering over that.  Badly.

A couple of sound/* ones should be simply "is negative".

netfilter ones are caused by bad calling conventions of
xt_percpu_counter_alloc().

I hadn't looked through drivers/* users, but judging by fs/, net/ and sound/,
I would expect them to be pointless garbage in the best case and red flags
for broken code in the worst.

IMO IS_ERR_VALUE() should be renamed to something less generic and be used
a lot less than it is right now.
