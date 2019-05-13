Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39262 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729326AbfEMSEO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 May 2019 14:04:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id w22so7156313pgi.6
        for <linux-kbuild@vger.kernel.org>; Mon, 13 May 2019 11:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190509201925.189615-1-ndesaulniers@google.com>
 <20190511022458.GA7376@archlinux-i9> <CAK7LNARB_ds9-dF9n1jHD==JRWsnPYNGoKxLqb+FwKvTTC0bLQ@mail.gmail.com>
In-Reply-To: <CAK7LNARB_ds9-dF9n1jHD==JRWsnPYNGoKxLqb+FwKvTTC0bLQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 May 2019 11:04:02 -0700
Message-ID: <CAKwvOd=+h8oxyRwPPoHajXM_JicfZ3YV2rhw6Ee06xh5=82fEw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add script check for cross compilation utilities
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Hines <srhines@google.com>

On Sat, May 11, 2019 at 8:05 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Sat, May 11, 2019 at 11:25 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Few comments below but nothing major, this seems to work fine as is.
> >
> > On Thu, May 09, 2019 at 01:19:21PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> > > When cross compiling via setting CROSS_COMPILE, if the prefixed tools
> > > are not found, then the host utilities are often instead invoked, and
> > > produce often difficult to understand errors.  This is most commonly the
> > > case for developers new to cross compiling the kernel that have yet to
> > > install the proper cross compilation toolchain. Rather than charge
> > > headlong into a build that will fail obscurely, check that the tools
> > > exist before starting to compile, and fail with a friendly error
> > > message.
> >
> > This part of the commit message makes it sound like this is a generic
> > problem when it is actually specific to clang. make will fail on its
> > own when building with gcc if CROSS_COMPILE is not properly set (since
> > gcc won't be found).
> >
> > On a side note, seems kind of odd that clang falls back to the host
> > tools when a non-host --target argument is used... (how in the world is
> > that expected to work?)
>
>
> I agree.
> Failure is much better than falling back to host tools.

It was probably assumed that the default case is usually not cross
compilation.  But I think we can add a check to Clang's driver where
`if target_triple != host_triple then don't invoke host tools`.

-- 
Thanks,
~Nick Desaulniers
