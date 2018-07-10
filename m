Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:44637 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732943AbeGJS1E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jul 2018 14:27:04 -0400
Received: by mail-yw0-f196.google.com with SMTP id k18-v6so8193337ywm.11
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jul 2018 11:26:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180710042609.zie5fgrvoyusmeod@treble>
References: <1531186516-15764-1-git-send-email-yamada.masahiro@socionext.com>
 <20180710022904.e3oql2ts4qz43bzo@treble> <CAK7LNASM+81JkGu5-z8GRZ9+sRyd55gO0G0M5c54zRhE5JhE3g@mail.gmail.com>
 <20180710042609.zie5fgrvoyusmeod@treble>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 10 Jul 2018 11:26:52 -0700
Message-ID: <CAGXu5jKiPFdP-wMeH5RpRuT9RAK9v-Ce=2=tmsZVYm0Bn3A-Lw@mail.gmail.com>
Subject: Re: [PATCH v2] objtool: move libelf detection to Kconfig from Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, X86 ML <x86@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Mon, Jul 9, 2018 at 9:26 PM, Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> I wasn't a part of the -fstack-protector conversation, but I doubt it's
> the same pattern.  We're trying to phase out frame pointers, for several
> reasons.  One big reason is that they cause a general slowdown across
> the entire kernel.

My primary concern with stack-protector was that I wanted to avoid a
disconnect between what was visible in CONFIG_* and how the kernel
actually got built. i.e. a kernel config had
CONFIG_STACKPROTECTOR_STRONG, it was actually built with
-fstack-protector-strong. Having it silently downgrade to
-fstack-protector while keeping CONFIG_STACKPROTECTOR_STRONG would
lead to serious confusion.

The second issue was that I wanted the best stack protector a compiler
supported, and at the time it wasn't possible to do this from kconfig.

Masahiro fixed both of these now. :) (Thank you!)

> Since we switched the x86_64 default to the ORC unwinder, a lot of
> people have switched over.  But this patch will reverse (or at least
> slow down) that trend, because almost nobody has the libelf devel
> packaged installed by default.  So over time, it will effectively make
> frame pointers the default again in many cases.  That's exactly what we
> *don't* want to do.  It will also cause people to accidentally re-enable
> frame pointers when they thought they had ORC.

This is more like the gcc-plugins: kconfig will just not make the
plugin CONFIG_*s visible if the gcc plugin dev package is missing on
the build host. However, having or not having these isn't something
we're trying to phase in or out, so the ORC case is more like how
stack-protector was originally: fail the build if your CONFIG requires
some additional build host package.

What might be interesting is having "make *config" report certain
CONFIG_* failures with helpful text. "WARNING: missing libelf for
CONFIG_ORC..." or "Warning: missing gcc-plugin-dev for
CONFIG_GCC_PLUGINS" etc?

-Kees

-- 
Kees Cook
Pixel Security
