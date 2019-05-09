Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35317 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfEIQwK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 12:52:10 -0400
Received: by mail-pf1-f194.google.com with SMTP id t87so1631713pfa.2
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 09:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064549.1302-1-yamada.masahiro@socionext.com> <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com>
In-Reply-To: <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 9 May 2019 09:51:57 -0700
Message-ID: <CAKwvOd=cbvYyVPcGYweMbPDM5WpBtZr8tOQgHu9BJiGqoq4RDg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

> On Wed, May 8, 2019 at 11:46 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > This flag is documented in the GCC 4.6 manual, and recognized by
> > Clang as well. Let's rip off the cc-option switch.

Checked w/ godbolt w/ Clang 4 and GCC 4.6.4.
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
