Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:37211 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753841AbdFWASm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 20:18:42 -0400
Received: by mail-it0-f41.google.com with SMTP id m47so474776iti.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2017 17:18:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+55aFwyDj21NDiQExue-z19NwZ7N4HmFV-ACKENSXhj1ETOyA@mail.gmail.com>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
 <2680957.ot0HfIkH6p@wuerfel> <CAGXu5jJpBiffFhdQ+sjwWeeWOnpEkz4JQyH8VwmVCWP3TzXmLQ@mail.gmail.com>
 <CA+55aFwyDj21NDiQExue-z19NwZ7N4HmFV-ACKENSXhj1ETOyA@mail.gmail.com>
From: Kees Cook <keescook@google.com>
Date: Thu, 22 Jun 2017 17:18:40 -0700
Message-ID: <CAGXu5jKSp=T+ZixQyc3f5Lhj3x5xRsq_UDE+8dB4yKL_-N+E4Q@mail.gmail.com>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

*thread necromancy*

On Fri, Dec 9, 2016 at 11:40 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Dec 9, 2016 at 11:12 AM, Kees Cook <keescook@google.com> wrote:
>> I'm starting to wonder if we need to expose the compiler version to
>> Kconfig so that "all*config" builds for earlier compiler will
>> automatically leave things like plugins off. But I have no idea what
>> the right approach for that might be.
>
> We had some broken mock-up of a config option that did a "system()"
> call to do some shell scripting for filling in config options (ie turn
> a fail/pass into false/true boolean automatically with something like
>
>    config COMPILER_SUPPORTS_XYZ
>        bool
>        option shell="gcc -XYZ"
>
> The idea is really solid: move a lot of the nasty ad-hoc runtime
> testing in the Makefiles to the configuration stage. I would seriously
> like to see this, so that we could replace the stupid
>
>   CFLAGS_KCOV     := $(call cc-option,-fsanitize-coverage=trace-pc,)
>
> with just nicer thing (ok, that's a bad example, but some of the other
> cc-option cases are really pretty fundamental to kernel configuration,
> and it really matters whether the compiler supports something or not).
>
> The main problem was actually that we don't have good infrastructure
> for passing in the compiler environment etc to kbuild.
>
> I forgot who did that mock-up (and what the exact syntax was), but it
> was pretty simple.

Yeah, agreed; I would love this for much more than just gcc plugins.
I'd rather that compiler-specific things were Kconfig-sane with
discoverable reasons for a Kconfig being unavailable.

Does anyone on the kbuild list remember where this mock-up was? I
haven't been able to find anything from searches (besides this thread
itself), and getting some ideas on how to approach it would be nice.
The way the .config file gets magically reloaded seems like solving
this could be very weird.

Thanks,

-Kees

-- 
Kees Cook
Pixel Security
