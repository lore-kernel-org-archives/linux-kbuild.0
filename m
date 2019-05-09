Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46126 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfEIRBd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 13:01:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id bi2so1418754plb.13
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 10:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
 <20190509114824.25866-1-natechancellor@gmail.com> <CA+icZUUN7cVXnkUv9DzYC7voys_CS=DJDm19EeYSWPyQwVdXVw@mail.gmail.com>
In-Reply-To: <CA+icZUUN7cVXnkUv9DzYC7voys_CS=DJDm19EeYSWPyQwVdXVw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 9 May 2019 10:01:21 -0700
Message-ID: <CAKwvOdkofHbT0qTvEkevvKUmzw5Ex5AD0wm+u4KYm7-HHMrnow@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Don't try to add '-fcatch-undefined-behavior' flag
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Arnd Bergmann <arnd@arndb.de>, Alexander Potapenko <glider@google.com>

> On Thu, May 9, 2019 at 1:49 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > This is no longer a valid option in clang, it was removed in 3.5, which
> > we don't support.
> >
> > https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4

lol, good catch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> >
>
> Cool.
>
> Can you test with -mglobal-merge (inverted -mno-global-merge) which is
> default for Clang?

Looks like these were added in r234668 in 2015, which would've been
Clang 3.6.2, according to:
http://releases.llvm.org/

I'd be fine with dropping the option check there.

There's a few here (-Qunused-arguments) that don't need cc-option
checks.  I recommend someone audit all of them, rather than send a
bunch of little patches.
-- 
Thanks,
~Nick Desaulniers
