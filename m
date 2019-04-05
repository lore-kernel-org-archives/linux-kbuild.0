Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43222 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfDEQLy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Apr 2019 12:11:54 -0400
Received: by mail-vs1-f65.google.com with SMTP id i207so3784981vsd.10
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Apr 2019 09:11:53 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id y1sm18800953uai.0.2019.04.05.09.11.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2019 09:11:51 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id f22so3808276vso.7
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Apr 2019 09:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAQw7nPwykOEV5i+yWjkxzgf1gPa5ewFhDxbbn8XXjwFUA@mail.gmail.com>
 <20190402070858.49597-1-ndesaulniers@google.com> <CAK7LNAQGUe0h2ti6_u5=y9KUrNStESdd=D=8K3NOiE08tt022w@mail.gmail.com>
In-Reply-To: <CAK7LNAQGUe0h2ti6_u5=y9KUrNStESdd=D=8K3NOiE08tt022w@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 5 Apr 2019 09:11:39 -0700
Message-ID: <CAGXu5jKZUP33Kz=nDPkUSj0Ksz5FOYTuuKAxv4N6xGEtFT645A@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathan Lynch <nathan_lynch@mentor.com>

On Fri, Apr 5, 2019 at 3:17 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> I want to propose alternative solution.
> Please check the attached patches.

In both patches:
> I changed the Makefile to use $(LD) rahter than $(CC). I confirmed
> the same vdso.so.raw was still produced.

typo: rahter -> rather

In the 0001 patch of arch/arm/vdso/Makefile:
> ...
> -VDSO_LDFLAGS += $(call cc-ldoption, -fuse-ld=bfd)
> +ldflags-y = -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
> +           -z max-page-size=4096 -z common-page-size=4096 \
> +           -nostdlib -shared \
> +           $(call ld-option, --hash-style=sysv) \
> +           $(call ld-option, --build-id) \
> +           -T

I see that "-fuse-ld=bfd" is explicitly dropped here, which could
reintroduce the problem fixed in d2b30cd4b722 ("ARM: 8384/1: VDSO:
force use of BFD linker") (and 3473f26592c1c). Does ld.gold still
exhibit this problem? If so, we'll need to detect gold and force bfd
still maybe?

-- 
Kees Cook
