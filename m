Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19545 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQSBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 13:01:41 -0500
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 00HI1L4N031520
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Jan 2020 03:01:22 +0900
Received: by mail-vs1-f46.google.com with SMTP id x18so15380739vsq.4
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jan 2020 10:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20200115115249.27774-1-ilie.halip@gmail.com> <CAKwvOdkdD9VF1k==G4vMeo4bBLarYz8gPvWfv6+N2kejeoXfjA@mail.gmail.com>
In-Reply-To: <CAKwvOdkdD9VF1k==G4vMeo4bBLarYz8gPvWfv6+N2kejeoXfjA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 18 Jan 2020 03:00:44 +0900
Message-ID: <CAK7LNAQ1pS0nK7JoUbgOn0aMtaYH69XukjNELZNxTtV_iMmR1Q@mail.gmail.com>
Subject: Re: [RFC PATCH] lib: move memcat_p.o to obj-y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Ilie Halip <ilie.halip@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Fri, Jan 17, 2020 at 7:30 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Jan 15, 2020 at 3:53 AM Ilie Halip <ilie.halip@gmail.com> wrote:
> >
> > The semantics of `--undefined` differ between ld.bfd and ld.lld:
> >     $ echo | gcc -x c -c - -o a.o
> >     $ echo "EXTERN(test)" > a.lds
> >     $ ld.bfd a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
> >     0000000000000000         *UND*      0000000000000000 test
> >     $ ld.lld a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
> >     $
> >
> > When building with CONFIG_STM=m, there are no in-kernel users of memcat_p()
> > and ld.lld discards this symbol because it's linked in via --no-whole-archive.
> > It's marked as undefined by a linker script but ld.lld discards it anyway (as
> > seen in the above snippet).
> >
> > Work around the ld.lld behavior by moving the object file to obj-y.
> >
> > Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/515
>
> Thanks for the patch.  This solves the observed linkage failure.
> Maybe Masahiro has more input based on the discussion in the above
> Link?

Sorry, I did not notice that thread until now.
I will take a look at it when I have time.


This patch does not seem to be a proper fix.

If this fix-up were acceptable, theoretically,
all objects that contain EXPORTED_SYMBOL
would need to be turned into obj-y from lib-y ?







> Tested-by: Nick Desaulniers <ndesaulniers@google.com>







-- 
Best Regards
Masahiro Yamada
