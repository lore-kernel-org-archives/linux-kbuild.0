Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40664 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731174AbfBKT1d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 14:27:33 -0500
Received: by mail-pf1-f194.google.com with SMTP id h1so21241pfo.7
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 11:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-3-ndesaulniers@google.com> <20190208055059.GD9647@archlinux-ryzen>
 <CAKwvOd=ytsXYDzVZHUEjokHmW5kpqmCq4cnToOFJ4gwz8j7W=Q@mail.gmail.com> <CAK7LNAQD=ZVcbn3cz2bcW0KrkL9ZOU44SHrmf2aRZwhYdmQrqQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQD=ZVcbn3cz2bcW0KrkL9ZOU44SHrmf2aRZwhYdmQrqQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Feb 2019 11:27:20 -0800
Message-ID: <CAKwvOdn1BDsYCrjUVDqKyiZA8pvENOWaOvkYN3kcVfWZof9Esw@mail.gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>

On Mon, Feb 11, 2019 at 7:33 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Sat, Feb 9, 2019 at 2:27 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Thu, Feb 7, 2019 at 9:51 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > On Thu, Feb 07, 2019 at 02:01:51PM -0800, ndesaulniers@google.com wrote:
> > > > This is needed because clang doesn't select which linker to use based on
> > > > $LD but rather -fuse-ld=$(LD). This is problematic especially for
> > > > cc-ldoption, which checks for linker flag support via invoking the
> > > > compiler, rather than the linker.
>
> What do you mean by 'problematic' ?
>
> I see no build error in
> arch/arm64/kernel/vdso/Makefile, at least.
>
> Clang uses BFD linker by default,
> which may not match to the $(LD) passed in.
>
> Is this what you mean?

Right, when using a linker other than BFD, we want cc-ldoption to tell
us whether that linker supports a linker flag or not.

-- 
Thanks,
~Nick Desaulniers
