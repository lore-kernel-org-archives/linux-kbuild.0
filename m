Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42085 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfH1XK1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 19:10:27 -0400
Received: by mail-pf1-f193.google.com with SMTP id i30so722786pfk.9
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 16:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190827103621.1073-1-yamada.masahiro@socionext.com>
 <20190827192811.GA24626@archlinux-threadripper> <CAKwvOd=7Jf13PDC9Q1FMhZUJQsq7Ggn=wRz5xpRY0YrU6tP9Kw@mail.gmail.com>
 <20190827213447.GA26954@archlinux-threadripper> <CAKwvOd=pQm7ytZSJeRzXoWwzouDADOYkO8S_+zSPtXOAO3Jc5g@mail.gmail.com>
 <CAK7LNARduZNvwQ2AJbP3NNDojM+1AACx=wRqdRz+DRSCuVMK2w@mail.gmail.com>
In-Reply-To: <CAK7LNARduZNvwQ2AJbP3NNDojM+1AACx=wRqdRz+DRSCuVMK2w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Aug 2019 16:10:15 -0700
Message-ID: <CAKwvOdkOo-6aS=Tu_QkArHK=rhK34Qe+SKJtY4sM-7YupAsCNA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: enable unused-function warnings for W= build
 with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>

On Tue, Aug 27, 2019 at 7:58 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Wed, Aug 28, 2019 at 6:56 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > Masahiro, does your patch correctly make -Wunused-function work for
> > clang at W=1?  It looks like -Wunused gets added to warning-1, but
> > then -Wno-unused-function gets added to KBUILD_CFLAGS after `warning`
> > does.  Will that work correctly?  I'd imagine that at W=1,
> > KBUILD_CFLAGS for clang will look like:
> > ... -Wunused -Wno-unused-function ...
> > which is probably not what we want?
>
> Hmm?
>
> -Wunused is added only when W=1.
>
> -Wno-unused-function is added only when W= was not passed.
>
> They do not happen at the same time.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
