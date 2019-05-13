Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25654 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfEMCYM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:24:12 -0400
MIME-Version: 1.0
References: <20190509064549.1302-1-yamada.masahiro@socionext.com>
 <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com> <CAKwvOd=cbvYyVPcGYweMbPDM5WpBtZr8tOQgHu9BJiGqoq4RDg@mail.gmail.com>
In-Reply-To: <CAKwvOd=cbvYyVPcGYweMbPDM5WpBtZr8tOQgHu9BJiGqoq4RDg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 11:23:31 +0900
Message-ID: <CAK7LNATJWiMsH0pVXcURxYndiqydrMuQiz=XXoANsE-vAAmL4A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Fri, May 10, 2019 at 1:52 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> > On Wed, May 8, 2019 at 11:46 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > > This flag is documented in the GCC 4.6 manual, and recognized by
> > > Clang as well. Let's rip off the cc-option switch.
>
> Checked w/ godbolt w/ Clang 4 and GCC 4.6.4.
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> --
> Thanks,
> ~Nick Desaulniers

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
