Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53348 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfH3Jwi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Aug 2019 05:52:38 -0400
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <20190828055425.24765-2-yamada.masahiro@socionext.com> <20190828182017.GB127646@archlinux-threadripper>
 <CAKwvOd=r5Y8hQQBeKZ6zAokPdyeT2AVKFsdviTvwV5AyDQQHrw@mail.gmail.com> <CA+icZUWmmC7CruvXx6U0cdXMLaMWJadU=T61E0om1rOuW3==pw@mail.gmail.com>
In-Reply-To: <CA+icZUWmmC7CruvXx6U0cdXMLaMWJadU=T61E0om1rOuW3==pw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 30 Aug 2019 11:52:24 +0200
Message-ID: <CA+icZUXX6YG7=4n60A3_HiTYE0SkNXd8yr4-pqfOsqg66QvXzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: allow Clang to find unused static inline
 functions for W=1 build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Sven Schnelle <svens@stackframe.org>, Xiaozhou Liu <liuxiaozhou@bytedance.com>, clang-built-linux <clang-built-linux@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>

Just as a sidenote:

From [PATCH v2] kbuild: enable unused-function warnings for W= build with Clang:

"Per the documentation [1], -Wno-unused-function will also disable
-Wunneeded-internal-declaration, which can help find bugs like
commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
I added -Wunneeded-internal-declaration to address it.

If you contribute to code clean-up, please run "make CC=clang W=1"
and check -Wunused-function warnings. You will find lots of unused
functions."

Isn't that missing in your double?

- Sedat -

[1] https://lkml.org/lkml/2019/8/27/729
