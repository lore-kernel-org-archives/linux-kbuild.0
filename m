Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.zx2c4.com ([192.95.5.64]:35809 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727886AbgELAoD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 20:44:03 -0400
MIME-Version: 1.0
References: <20200508090202.7s3kcqpvpxx32syu@butterfly.localdomain>
 <20200511215720.303181-1-Jason@zx2c4.com> <CAHk-=wi87j=wj0ijkYZ3WoPVkZ9Fq1U2bLnQ66nk425B5kW0Cw@mail.gmail.com>
In-Reply-To: <CAHk-=wi87j=wj0ijkYZ3WoPVkZ9Fq1U2bLnQ66nk425B5kW0Cw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 May 2020 18:43:48 -0600
Message-ID: <CAHmME9pXnYurszyvX8FAYHbMysknpegUSF1g2wZPdBybxD-xZQ@mail.gmail.com>
Subject: Re: [PATCH v2] Kconfig: default to CC_OPTIMIZE_FOR_PERFORMANCE_O3 for
 gcc >= 10
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, stable <stable@vger.kernel.org>, "H.J. Lu" <hjl.tools@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Jakub Jelinek <jakub@redhat.com>, Oleksandr Natalenko <oleksandr@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, David Laight <David.Laight@aculab.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Mon, May 11, 2020 at 6:05 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> There's a reason -O3 isn't even offered as an option.
>
> Maybe things have changed, and maybe they've improved. But I'd like to
> see actual numbers for something like this.
>
> Not inlining as aggressively is not necessarily a bad thing. It can
> be, of course. But I've actually also done gcc bugreports about gcc
> inlining too much, and generating _worse_ code as a result (ie
> inlinging things that were behind an "if (unlikely())" test, and
> causing the likely path to grow a stack fram and stack spills as a
> result).
>
> So just "O3 inlines more" is not a valid argument.

Alright. It might be possible to produce some benchmarks, and then
isolate the precise inlining parameter that makes the difference, and
include that for gcc-10. But you made a compelling argument in that
old gcc bug report about not going down the finicky rabbit hole of gcc
inlining switches that seem to change meaning between releases, which
is persuasive.

The other possibility would be if -O3 actually isn't bad like it used
to be and the codegen is markedly better, alongside some numbers to
back it up. I'm not presently making that argument and don't have
those numbers, but perhaps others who were interested in this patch
for other reasons do have strong arguments there and want to chime in.
Otherwise, no problem dropping this.
