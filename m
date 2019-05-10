Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36509 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfEJNyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 09:54:13 -0400
MIME-Version: 1.0
References: <20190509064455.1173-1-yamada.masahiro@socionext.com> <CA+icZUX_AgZdH5Z+1+k+oVdYSo7vqzeJsGPndb_Sa8VOSk_yOg@mail.gmail.com>
In-Reply-To: <CA+icZUX_AgZdH5Z+1+k+oVdYSo7vqzeJsGPndb_Sa8VOSk_yOg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 May 2019 22:53:14 +0900
Message-ID: <CAK7LNAS+FQqQZ0RfW8e6mxabUOq9YVk=eEEztmN-+BHnTmDa_w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 9, 2019 at 4:06 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, May 9, 2019 at 8:45 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > We do not support old Clang versions. Upgrade your clang version
> > if any of these flags is unsupported.
> >
> > Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> > except -fcatch-undefined-behavior.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Looks good to me.
>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> Just as sidenote:
> I experimented with a snapshot version of clang-9 and lld-9 and could
> build, link and boot on bare-metal with '-mglobal-merge' on
> Debian/buster AMD64.


The comment says
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the
whitelisted names.
 # See modpost pattern 2

So, it seems it is just a matter of modpost,
but I am not sure enough.

This flag has been here since the initial support.
(61163efae02040f66a95c8ed17f4407951ba58fa)


Perhaps, we should review clang flags one by one again?




> But forgot to document in [1].
>
> [1] https://github.com/ClangBuiltLinux/linux/issues/431



-- 
Best Regards
Masahiro Yamada
