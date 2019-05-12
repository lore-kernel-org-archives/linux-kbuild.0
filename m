Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:45488 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfELDF3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 May 2019 23:05:29 -0400
MIME-Version: 1.0
References: <20190509201925.189615-1-ndesaulniers@google.com> <20190511022458.GA7376@archlinux-i9>
In-Reply-To: <20190511022458.GA7376@archlinux-i9>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 12 May 2019 12:04:48 +0900
Message-ID: <CAK7LNARB_ds9-dF9n1jHD==JRWsnPYNGoKxLqb+FwKvTTC0bLQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add script check for cross compilation utilities
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, May 11, 2019 at 11:25 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Few comments below but nothing major, this seems to work fine as is.
>
> On Thu, May 09, 2019 at 01:19:21PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> > When cross compiling via setting CROSS_COMPILE, if the prefixed tools
> > are not found, then the host utilities are often instead invoked, and
> > produce often difficult to understand errors.  This is most commonly the
> > case for developers new to cross compiling the kernel that have yet to
> > install the proper cross compilation toolchain. Rather than charge
> > headlong into a build that will fail obscurely, check that the tools
> > exist before starting to compile, and fail with a friendly error
> > message.
>
> This part of the commit message makes it sound like this is a generic
> problem when it is actually specific to clang. make will fail on its
> own when building with gcc if CROSS_COMPILE is not properly set (since
> gcc won't be found).
>
> On a side note, seems kind of odd that clang falls back to the host
> tools when a non-host --target argument is used... (how in the world is
> that expected to work?)


I agree.
Failure is much better than falling back to host tools.


-- 
Best Regards
Masahiro Yamada
