Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:20905 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfG2Jjl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 05:39:41 -0400
MIME-Version: 1.0
References: <20190729091517.5334-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190729091517.5334-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Jul 2019 18:38:59 +0900
Message-ID: <CAK7LNASjXdMJG5OVz4qhyGHHLGd0uZO9ifH_iqkUqYxKD+Xn2g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: initialize CLANG_FLAGS correctly in the top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, stable <stable@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jul 29, 2019 at 6:16 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> CLANG_FLAGS is initialized by the following line:
>
>   CLANG_FLAGS     := --target=$(notdir $(CROSS_COMPILE:%-=%))
>
> ..., which is run only when CROSS_COMPILE is set.
>
> Some build targets (bindeb-pkg etc.) recurse to the top Makefile.
>
> When you build the kernel with Clang but without CROSS_COMPILE,
> the same compiler flags such as -no-integrated-as are accumulated
> into CLANG_FLAGS.
>
> If you run 'make CC=clang' and then 'make CC=clang bindeb-pkg',
> Kbuild will recompile everything needlessly due to the build command
> change.
>
> Fix this by correctly initializing CLANG_FLAGS.
>
> Fixes: 238bcbc4e07f ("kbuild: consolidate Clang compiler flags")
> Cc: <stable@vger.kernel.org> # v4.20+

This should be v5.0+

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


-- 
Best Regards
Masahiro Yamada
