Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36619 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbgCZR1q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 13:27:46 -0400
Received: by mail-pg1-f194.google.com with SMTP id j29so3219628pgl.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 10:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-2-masahiroy@kernel.org>
 <CAKwvOd=AXnAjoa0iOhPc4S49ZpDDX9BYB-BZQc=6Z0dygVYLPA@mail.gmail.com> <CAK7LNATXz=x7M-HOfWLf1fc_km5qBYa5u1i3Bj30C7aoJPGjSA@mail.gmail.com>
In-Reply-To: <CAK7LNATXz=x7M-HOfWLf1fc_km5qBYa5u1i3Bj30C7aoJPGjSA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 26 Mar 2020 10:27:33 -0700
Message-ID: <CAKwvOdmGLmbghDAguisUZFUvGiBQVnfEogAFCtXaDLPxOLVYmA@mail.gmail.com>
Subject: Re: [PATCH 01/16] lib/raid6/test: fix build on distros whose /bin/sh
 is not bash
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Herbert Xu <herbert@gondor.apana.org.au>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jim Kukunas <james.t.kukunas@linux.intel.com>, NeilBrown <neilb@suse.de>, Yuanhan Liu <yuanhan.liu@linux.intel.com>

On Wed, Mar 25, 2020 at 11:49 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Mar 25, 2020 at 1:36 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Tue, Mar 24, 2020 at 1:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > You can test raid6 library code from user-space, like this:
> > >
> > >   $ cd lib/raid6/test
> > >   $ make
> > >
> > > The command in $(shell ...) function is evaluated by /bin/sh by default.
> > > (or, you can change the default shell by setting 'SHELL' in Makefile)
> > >
> > > Currently '>&/dev/null' is used to sink both stdout and stderr. Because
> > > this code is bash-ism, it only works when /bin/sh is a symbolic link to
> > > bash (this is the case on RHEL etc.)
> > >
> > > This does not work on Ubuntu where /bin/sh is a symbolic link to dash.
> > >
> > > I see lots of
> > >
> > >   /bin/sh: 1: Syntax error: Bad fd number
> > >
> > > and
> > >
> > >   warning "your version of binutils lacks ... support"
> > >
> > > Replace it with portable '>/dev/null 2>&1'.
> > >
> > > Fixes: 4f8c55c5ad49 ("lib/raid6: build proper files on corresponding arch")
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> > > ---
> > >
> > >  lib/raid6/test/Makefile | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
> > > index 3ab8720aa2f8..b9e6c3648be1 100644
> > > --- a/lib/raid6/test/Makefile
> > > +++ b/lib/raid6/test/Makefile
> > > @@ -35,13 +35,13 @@ endif
> > >  ifeq ($(IS_X86),yes)
> > >          OBJS   += mmx.o sse1.o sse2.o avx2.o recov_ssse3.o recov_avx2.o avx512.o recov_avx512.o
> > >          CFLAGS += $(shell echo "pshufb %xmm0, %xmm0" |         \
> > > -                    gcc -c -x assembler - >&/dev/null &&       \
> > > +                    gcc -c -x assembler - >/dev/null 2>&1 &&   \
> > >                      rm ./-.o && echo -DCONFIG_AS_SSSE3=1)
> > >          CFLAGS += $(shell echo "vpbroadcastb %xmm0, %ymm1" |   \
> > > -                    gcc -c -x assembler - >&/dev/null &&       \
> > > +                    gcc -c -x assembler - >/dev/null 2>&1 &&   \
> > >                      rm ./-.o && echo -DCONFIG_AS_AVX2=1)
> > >         CFLAGS += $(shell echo "vpmovm2b %k1, %zmm5" |          \
> > > -                   gcc -c -x assembler - >&/dev/null &&        \
> > > +                   gcc -c -x assembler - >/dev/null 2>&1 &&    \
> >
> > These should all use $(CC) rather than hardcode gcc.
>
>
> Right, I had noticed this.
>
> We often fall between
> "let's fix this too while we are here"
> vs
> "do not do multiple things in a single patch"
>
>
> If we replace gcc -> $(CC),
> we also need to touch line 51 for consistency:
>
>        gcc -c -x c - >/dev/null && rm ./-.o && echo yes)
>
> ..., which is not our main interest now.
>
> So, I leave it to a follow-up patch
> if somebody has interest in it.

Haha, ok, no worries.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
