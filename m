Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728332AbgELAJl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 20:09:41 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24684C061A0E
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2020 17:09:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l19so11593821lje.10
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2020 17:09:41 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id l25sm12293113lfh.71.2020.05.11.17.09.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 17:09:37 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id l19so11593708lje.10
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2020 17:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200508090202.7s3kcqpvpxx32syu@butterfly.localdomain>
 <20200511215720.303181-1-Jason@zx2c4.com> <CAHk-=wi87j=wj0ijkYZ3WoPVkZ9Fq1U2bLnQ66nk425B5kW0Cw@mail.gmail.com>
In-Reply-To: <CAHk-=wi87j=wj0ijkYZ3WoPVkZ9Fq1U2bLnQ66nk425B5kW0Cw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 11 May 2020 17:09:20 -0700
Message-ID: <CAHk-=wioWmE+Xy+RfVpc3q9EMh4NhqPVvWZp5=GqtoU6nZfxcA@mail.gmail.com>
Subject: Re: [PATCH v2] Kconfig: default to CC_OPTIMIZE_FOR_PERFORMANCE_O3 for
 gcc >= 10
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, stable <stable@vger.kernel.org>, "H.J. Lu" <hjl.tools@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Jakub Jelinek <jakub@redhat.com>, Oleksandr Natalenko <oleksandr@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, David Laight <David.Laight@aculab.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Mon, May 11, 2020 at 5:04 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Not inlining as aggressively is not necessarily a bad thing. It can
> be, of course. But I've actually also done gcc bugreports about gcc
> inlining too much, and generating _worse_ code as a result (ie
> inlinging things that were behind an "if (unlikely())" test, and
> causing the likely path to grow a stack fram and stack spills as a
> result).

In case people care, the bugzilla case I mentioned is this one:

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=49194

with example code on why it's actively wrong to inline.

Obviously, in the kernel, we can fix the obvious cases with "noinline"
and "always_inline", but those take care of the outliers.  Having a
compiler that does reasonably well by default is a good thing, and
that very much includes *not* inlining mindlessly.

                  Linus
