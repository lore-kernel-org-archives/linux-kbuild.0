Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41012 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730492AbfDEQwW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Apr 2019 12:52:22 -0400
Received: by mail-pg1-f193.google.com with SMTP id f6so3367841pgs.8
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Apr 2019 09:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAQw7nPwykOEV5i+yWjkxzgf1gPa5ewFhDxbbn8XXjwFUA@mail.gmail.com>
 <20190402070858.49597-1-ndesaulniers@google.com> <CAK7LNAQGUe0h2ti6_u5=y9KUrNStESdd=D=8K3NOiE08tt022w@mail.gmail.com>
 <CAGXu5jKZUP33Kz=nDPkUSj0Ksz5FOYTuuKAxv4N6xGEtFT645A@mail.gmail.com>
In-Reply-To: <CAGXu5jKZUP33Kz=nDPkUSj0Ksz5FOYTuuKAxv4N6xGEtFT645A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Apr 2019 09:52:10 -0700
Message-ID: <CAKwvOd=eBWm6B24soOGhxtCk+TCeKqwra0_b-V6kTYDSHLOg_w@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, clang-built-linux@googlegroups.com, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathan Lynch <nathan_lynch@mentor.com>, Peter Smith <peter.smith@linaro.org>

On Fri, Apr 5, 2019 at 9:11 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Apr 5, 2019 at 3:17 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > I want to propose alternative solution.
> > Please check the attached patches.

```
My plan is to rewrite all VDSO Makefiles to use $(LD), then delete cc-ldoption.
```

I agree with that as a possible solution as well; I think it's best to
just invoke the linker directly rather than use the compiler as the
driver.  Just small nits with the 2 attached patches, but I think they
will also work for us.

Looks like there's 15 call sites across 12 files, plus Documentation/
and scripts/Kbuild.include; removing it seems feasible and I'd be
happy to help if you'd welcome the patches?

Let's start with that series of changes, but I suspect we will
ultimately need to revisit -fuse-ld=.  I was just thinking that even
my proposed patch doesn't do anything for KBUILD_HOSTCFLAGS, for
example.  I worry that bfd may still be invoked by Clang at some point
in the build.  I will try to test in an environment with no GNU
binutils.

> In the 0001 patch of arch/arm/vdso/Makefile:
> > ...
> > -VDSO_LDFLAGS += $(call cc-ldoption, -fuse-ld=bfd)
> > +ldflags-y = -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
> > +           -z max-page-size=4096 -z common-page-size=4096 \
> > +           -nostdlib -shared \
> > +           $(call ld-option, --hash-style=sysv) \

I think the vdso's should all REQUIRE --hash-style=sysv; the kselftest
for vdso's will fail otherwise.  I could always follow up with patches
for that if we didn't want to conflate changes.

> > +           $(call ld-option, --build-id) \
> > +           -T

Was it intentional to add -T standalone?  The man page for `ld` says
it needs an additional filename to follow -T.  Or rather is optional
if a -L flag is specified?

>
> I see that "-fuse-ld=bfd" is explicitly dropped here, which could
> reintroduce the problem fixed in d2b30cd4b722 ("ARM: 8384/1: VDSO:
> force use of BFD linker") (and 3473f26592c1c). Does ld.gold still
> exhibit this problem? If so, we'll need to detect gold and force bfd
> still maybe?

The arm32 vdso Makefile is an oddity in this regard.  I think what
Kees described is best.  Rather than always set the linker to bfd
(which harms linkers like lld), detect if gold is being used and if so
set the linker back to bfd.

For arm64, lld has this issue with -n,
https://github.com/ClangBuiltLinux/linux/issues/340, but I think we
can fix that in a follow up patch.  Same thoughts on --hash-style and
-T.

-- 
Thanks,
~Nick Desaulniers
