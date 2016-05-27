Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:32857 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756387AbcE0RXC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 May 2016 13:23:02 -0400
MIME-Version: 1.0
In-Reply-To: <5345273.JScMX9oohG@wuerfel>
References: <20160526203346.GA4734@pobox.suse.cz>
	<CA+55aFzQxws_ipKZhV9cFrJdV8CvKy=m9AxGe5cjM=FYceNbZQ@mail.gmail.com>
	<5345273.JScMX9oohG@wuerfel>
Date: Fri, 27 May 2016 10:23:00 -0700
Message-ID: <CA+55aFw0RN=7XZa7Kt2bcvk1a_5yAxYW1tVhr-jjCnozsf1MSw@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild updates for v4.7-rc1
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, mussitantesmortem@gmail.com, nicolas.ferre@atmel.com, Nicolas Pitre <nicolas.pitre@linaro.org>, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>

On Fri, May 27, 2016 at 5:33 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>
>
> gcc can not always figure out which code is only used in an error
> condition an assignment to indirect argument is only done after the
> use of IS_ERR() catches errors. In gfs2, this results in a warning
> about correct code:

I figured out why gcc warns.

The code is correct, but gcc isn't able to tell that, because when we
return "int" for the error case from get_leaf_nr(), gcc thinks that
that *could* be a zero.

This code:

        if (IS_ERR(hash))
                return PTR_ERR(hash);

is obviously "return non-zero" to a kernel developer (because that's
how our error codes work), but to a compiler that "return PTR_ERR()"
ends up casting a "long" to an "int" return value.

And the compiler thinks that while the "long" was clearly non-zero and
negative, the "int" it cast things to might be zero.

Yes, a very smart compiler might have figured out that the
IS_ERR_VALUE check also means that the value will be non-zero in "int"
as well, but that actually takes value range analysis, not just "we
already ttested it".

And yes, the error goes away if I turn the "int" into "long" into the
affected codepaths.

I'm not entirely happy about your patch, because I think it makes the
code worse. You fix it by effectively making gcc test the resulting
value after the type conversion. I'd really prefer to figure out some
way to let gcc actually understand this error handling model. Because
it's not just the warning, it also generates unnecessary double tests
(first comparing a 64-bit value against the error range, and then
comparing the truncated 32-bit error code against zero).

Making errors be "long" does fix not just the warning but also the
code generation. But we've traditionally used "int" for error returns,
even though the system call path then again turns it into "long" (for
somewhat related reasons, actually - we want to make sure that the
"int" error code is valid in all 64 bits).

So we *could* just start encouraging people to use "long" for error
handling. It would fix warnings and improve the results. But let me
think about this a bit more.

                    Linus
