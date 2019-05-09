Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39339 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfEIQro (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 12:47:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id w22so1499286pgi.6
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 09:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064635.1445-1-yamada.masahiro@socionext.com>
 <CA+icZUV03ZF_FWMMyY=36-zQZPWO0YUBuSs9bjQqpmXJzVYYRA@mail.gmail.com> <CAK7LNATgQaHU+6WiMvx0AAf=9AJ5nrL8f8=SJMOCJNQNb_=X1w@mail.gmail.com>
In-Reply-To: <CAK7LNATgQaHU+6WiMvx0AAf=9AJ5nrL8f8=SJMOCJNQNb_=X1w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 9 May 2019 09:47:32 -0700
Message-ID: <CAKwvOdn7bUOeiE8LobyENmPvYGO3j7rt1N+Ht7tcDWaOBuHhdg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add some extra warning flags unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, chromeos-toolchain <chromeos-toolchain@google.com>, Android-LLVM <android-llvm@google.com>

From: Masahiro Yamada <yamada.masahiro@socionext.com>
> On Thu, May 9, 2019 at 4:11 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > BTW, is this a speedup when doing CC/LD FLAGS etc checks unconditionally?
>
> Yes.
> cc-option is somewhat costly because it invoked the compiler to
> check if the given flag is supported.
>
> So, I want to get rid of as many cc-option calls as possible.
>
>
> > Asking in general - do you have any numbers :-)?
>
> Removing a couple of cc-options does not make
> a measurable difference in general use-cases.
>
> But, this might be more beneficial for chrome OS
> because $(CC) is a wrapper and invoking it is much more expensive.

Android does too, which we plan on removing as we recently measured
the performance cost of 5% for having a Python wrapper to aid in
bisection.

Anyways, I checked these options with clang 4 and gcc 4.6.4 in godbolt.
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
