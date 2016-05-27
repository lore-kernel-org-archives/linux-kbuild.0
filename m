Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:61887 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756279AbcE0UFf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 May 2016 16:05:35 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] kbuild updates for v4.7-rc1
Date: Fri, 27 May 2016 22:04:26 +0200
Message-ID: <9633365.kM71HHzq9d@wuerfel>
In-Reply-To: <CA+55aFw0RN=7XZa7Kt2bcvk1a_5yAxYW1tVhr-jjCnozsf1MSw@mail.gmail.com>
References: <20160526203346.GA4734@pobox.suse.cz> <5345273.JScMX9oohG@wuerfel> <CA+55aFw0RN=7XZa7Kt2bcvk1a_5yAxYW1tVhr-jjCnozsf1MSw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.com>, mussitantesmortem@gmail.com, nicolas.ferre@atmel.com, Nicolas Pitre <nicolas.pitre@linaro.org>, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>

On Friday, May 27, 2016 10:23:00 AM CEST Linus Torvalds wrote:
> On Fri, May 27, 2016 at 5:33 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> >
> > gcc can not always figure out which code is only used in an error
> > condition an assignment to indirect argument is only done after the
> > use of IS_ERR() catches errors. In gfs2, this results in a warning
> > about correct code:
> 
> I figured out why gcc warns.
> 
> The code is correct, but gcc isn't able to tell that, because when we
> return "int" for the error case from get_leaf_nr(), gcc thinks that
> that *could* be a zero.
> 
> This code:
> 
>         if (IS_ERR(hash))
>                 return PTR_ERR(hash);
> 
> is obviously "return non-zero" to a kernel developer (because that's
> how our error codes work), but to a compiler that "return PTR_ERR()"
> ends up casting a "long" to an "int" return value.
> 
> And the compiler thinks that while the "long" was clearly non-zero and
> negative, the "int" it cast things to might be zero.

Exactly, this was my conclusion back in January when I did the 67893f12e537
patch that fixed it for 32-bit architectures: gcc cannot figure out
that 'if (IS_ERR(ptr))' and the '!err' check are equivalent but it
does manage to find 'IS_ERR(ptr)' and 'IS_ERR_VAL(PTR_ERR(ptr))'
are the same, across multiple inlined functions.

> Yes, a very smart compiler might have figured out that the
> IS_ERR_VALUE check also means that the value will be non-zero in "int"
> as well, but that actually takes value range analysis, not just "we
> already ttested it".
> 
> And yes, the error goes away if I turn the "int" into "long" into the
> affected codepaths.
> 
> I'm not entirely happy about your patch, because I think it makes the
> code worse. You fix it by effectively making gcc test the resulting
> value after the type conversion. I'd really prefer to figure out some
> way to let gcc actually understand this error handling model. Because
> it's not just the warning, it also generates unnecessary double tests
> (first comparing a 64-bit value against the error range, and then
> comparing the truncated 32-bit error code against zero).

I see what you mean. On 32-bit ARM, we get the double compare for any
of the versions, while on 64-bit x86, the current version in mainline
is the worst, while the original code (with the warning) and the version
after my second patch still need the second comparison against zero.

> Making errors be "long" does fix not just the warning but also the
> code generation. But we've traditionally used "int" for error returns,
> even though the system call path then again turns it into "long" (for
> somewhat related reasons, actually - we want to make sure that the
> "int" error code is valid in all 64 bits).
> 
> So we *could* just start encouraging people to use "long" for error
> handling. It would fix warnings and improve the results. But let me
> think about this a bit more.
>
On Friday, May 27, 2016 11:28:48 AM CEST Linus Torvalds wrote:
> It doesn't help that gfs2 is using the IS_ERR_VALUE() macro on an
> "int", whih is bogus to begin with. It happens to *work*, but by the
> time you've cast an error pointer to "int", you've lost enough bits
> that "IS_ERR_VALUE()" isn't a valid thing to do. You should just check
> against zero (possibly against negative).
>
> But fixing that and just checking against a non-zero int doesn't
> actually fix the warning.

Right, removing the IS_ERR_VALUE() gets us back to the state before
my original patch, and we get the warning on all architectures, and
we certainly don't want to promote the use of IS_ERR_VALUE() further
because of the problems you mention with unsigned types that are
shorter than 'long'.

In fact, the patch that I have in my private tree that was hiding the
warning for me on x86 is one that removes all instances of IS_ERR_VALUE()
with arguments other than 'unsigned long', see http://pastebin.com/uYa2mkgC
for reference.

	Arnd
