Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:34429 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729589AbfICPjs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 11:39:48 -0400
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <20190828055425.24765-2-yamada.masahiro@socionext.com> <20190828182017.GB127646@archlinux-threadripper>
 <CAKwvOd=r5Y8hQQBeKZ6zAokPdyeT2AVKFsdviTvwV5AyDQQHrw@mail.gmail.com>
 <CA+icZUWmmC7CruvXx6U0cdXMLaMWJadU=T61E0om1rOuW3==pw@mail.gmail.com> <CA+icZUXX6YG7=4n60A3_HiTYE0SkNXd8yr4-pqfOsqg66QvXzw@mail.gmail.com>
In-Reply-To: <CA+icZUXX6YG7=4n60A3_HiTYE0SkNXd8yr4-pqfOsqg66QvXzw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 4 Sep 2019 00:39:07 +0900
Message-ID: <CAK7LNAQLM2RXELr=WY7O8UEHx3EQZKeQdfZ_Ko4wTTPe0ZrqHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: allow Clang to find unused static inline
 functions for W=1 build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Sven Schnelle <svens@stackframe.org>, Xiaozhou Liu <liuxiaozhou@bytedance.com>, clang-built-linux <clang-built-linux@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>

On Fri, Aug 30, 2019 at 6:52 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Just as a sidenote:
>
> From [PATCH v2] kbuild: enable unused-function warnings for W= build with Clang:
>
> "Per the documentation [1], -Wno-unused-function will also disable
> -Wunneeded-internal-declaration, which can help find bugs like
> commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
> I added -Wunneeded-internal-declaration to address it.
>
> If you contribute to code clean-up, please run "make CC=clang W=1"
> and check -Wunused-function warnings. You will find lots of unused
> functions."

This information is unrelated to this version,
so I dropped it.


> Isn't that missing in your double?
>
> - Sedat -
>
> [1] https://lkml.org/lkml/2019/8/27/729



-- 
Best Regards
Masahiro Yamada
