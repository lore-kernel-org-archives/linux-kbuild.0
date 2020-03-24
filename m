Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42229 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgCXRdq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 13:33:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id h8so9361885pgs.9
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 10:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-12-masahiroy@kernel.org>
 <CAKwvOdkj3dDNcbY4hwyManfviPdFoBooJJmFOAKL2YJCZNuhtA@mail.gmail.com> <CAHmME9pV93Zey2=XghxzThTHbZarFrnxwnGatXHyQjevPf7R=g@mail.gmail.com>
In-Reply-To: <CAHmME9pV93Zey2=XghxzThTHbZarFrnxwnGatXHyQjevPf7R=g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Mar 2020 10:33:32 -0700
Message-ID: <CAKwvOdmw5G+4F9eiZYK3JDHvnraDjGBPT+1hu=62Kc28PDa0Rw@mail.gmail.com>
Subject: Re: [PATCH 11/16] x86: probe assembler capabilities via kconfig
 instead of makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Herbert Xu <herbert@gondor.apana.org.au>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 24, 2020 at 10:17 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Mar 24, 2020 at 11:01 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Can 11 just be rebased with 8 dropped?
>
> 8 adds comments to one place. 11 moves them to another place, while
> doing other things.
>
> Your desire is to skip the first step? I guess there's no problem with
> this, but I'm curious to learn why.

Before this series, there's no comments. After, the comments are in
arch/x86/Kconfig.assembler. Don't waste reviewers time by having other
patches in the set that move them around for fun. Just add them to the
final destination.

-- 
Thanks,
~Nick Desaulniers
