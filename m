Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728117AbgELAFS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 20:05:18 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CCFC05BD09
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2020 17:05:17 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 188so9027072lfa.10
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2020 17:05:17 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id o204sm12610320lff.64.2020.05.11.17.05.12
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 17:05:12 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id d22so2992505lfm.11
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2020 17:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200508090202.7s3kcqpvpxx32syu@butterfly.localdomain> <20200511215720.303181-1-Jason@zx2c4.com>
In-Reply-To: <20200511215720.303181-1-Jason@zx2c4.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 11 May 2020 17:04:56 -0700
Message-ID: <CAHk-=wi87j=wj0ijkYZ3WoPVkZ9Fq1U2bLnQ66nk425B5kW0Cw@mail.gmail.com>
Subject: Re: [PATCH v2] Kconfig: default to CC_OPTIMIZE_FOR_PERFORMANCE_O3 for
 gcc >= 10
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, stable <stable@vger.kernel.org>, "H.J. Lu" <hjl.tools@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Jakub Jelinek <jakub@redhat.com>, Oleksandr Natalenko <oleksandr@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, David Laight <David.Laight@aculab.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Mon, May 11, 2020 at 2:57 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> GCC 10 appears to have changed -O2 in order to make compilation time
> faster when using -flto, seemingly at the expense of performance, in
> particular with regards to how the inliner works. Since -O3 these days
> shouldn't have the same set of bugs as 10 years ago, this commit
> defaults new kernel compiles to -O3 when using gcc >= 10.

I'm not convinced this is sensible.

-O3 historically does bad things with gcc. Including bad things for
performance. It traditionally makes code larger and often SLOWER.

And I don't mean slower to compile (although that's an issue). I mean
actually generating slower code.

Things like trying to unroll loops etc makes very little sense in the
kernel, where we very seldom have high loop counts for pretty much
anything.

There's a reason -O3 isn't even offered as an option.

Maybe things have changed, and maybe they've improved. But I'd like to
see actual numbers for something like this.

Not inlining as aggressively is not necessarily a bad thing. It can
be, of course. But I've actually also done gcc bugreports about gcc
inlining too much, and generating _worse_ code as a result (ie
inlinging things that were behind an "if (unlikely())" test, and
causing the likely path to grow a stack fram and stack spills as a
result).

So just "O3 inlines more" is not a valid argument.

              Linus
