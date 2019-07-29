Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43191 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfG2QVq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 12:21:46 -0400
Received: by mail-pl1-f194.google.com with SMTP id 4so20713434pld.10
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2019 09:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190729091517.5334-1-yamada.masahiro@socionext.com> <20190729160412.GA100132@archlinux-threadripper>
In-Reply-To: <20190729160412.GA100132@archlinux-threadripper>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Jul 2019 09:21:33 -0700
Message-ID: <CAKwvOdnU8tLQ=wYAKs9Fy+3c2e_NmKL6H4kRKsRxH=sv16+8cQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: initialize CLANG_FLAGS correctly in the top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, "# 3.4.x" <stable@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>

On Mon, Jul 29, 2019 at 9:04 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Jul 29, 2019 at 06:15:17PM +0900, Masahiro Yamada wrote:
> > CLANG_FLAGS is initialized by the following line:
> >
> >   CLANG_FLAGS     := --target=$(notdir $(CROSS_COMPILE:%-=%))
> >
> > ..., which is run only when CROSS_COMPILE is set.
> >
> > Some build targets (bindeb-pkg etc.) recurse to the top Makefile.
> >
> > When you build the kernel with Clang but without CROSS_COMPILE,
> > the same compiler flags such as -no-integrated-as are accumulated
> > into CLANG_FLAGS.
> >
> > If you run 'make CC=clang' and then 'make CC=clang bindeb-pkg',
> > Kbuild will recompile everything needlessly due to the build command
> > change.
> >
> > Fix this by correctly initializing CLANG_FLAGS.
> >
> > Fixes: 238bcbc4e07f ("kbuild: consolidate Clang compiler flags")
> > Cc: <stable@vger.kernel.org> # v4.20+
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
