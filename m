Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f193.google.com ([209.85.213.193]:34548 "EHLO
	mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755243AbcE0S2t (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 May 2016 14:28:49 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFw0RN=7XZa7Kt2bcvk1a_5yAxYW1tVhr-jjCnozsf1MSw@mail.gmail.com>
References: <20160526203346.GA4734@pobox.suse.cz>
	<CA+55aFzQxws_ipKZhV9cFrJdV8CvKy=m9AxGe5cjM=FYceNbZQ@mail.gmail.com>
	<5345273.JScMX9oohG@wuerfel>
	<CA+55aFw0RN=7XZa7Kt2bcvk1a_5yAxYW1tVhr-jjCnozsf1MSw@mail.gmail.com>
Date: Fri, 27 May 2016 11:28:48 -0700
Message-ID: <CA+55aFwOg7b80YesMZFXCU1tDS9kk5jBrOJ4+CsQZT7474uRhw@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild updates for v4.7-rc1
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, =?UTF-8?B?0JzQsNC60YEg0JbRg9C60L7Qsg==?= <mussitantesmortem@gmail.com>, nicolas.ferre@atmel.com, Nicolas Pitre <nicolas.pitre@linaro.org>, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>

On Fri, May 27, 2016 at 10:23 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This code:
>
>         if (IS_ERR(hash))
>                 return PTR_ERR(hash);
>
> is obviously "return non-zero" to a kernel developer (because that's
> how our error codes work), but to a compiler that "return PTR_ERR()"
> ends up casting a "long" to an "int" return value.

It doesn't help that gfs2 is using the IS_ERR_VALUE() macro on an
"int", whih is bogus to begin with. It happens to *work*, but by the
time you've cast an error pointer to "int", you've lost enough bits
that "IS_ERR_VALUE()" isn't a valid thing to do. You should just check
against zero (possibly against negative).

But fixing that and just checking against a non-zero int doesn't
actually fix the warning.

              Linus
