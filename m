Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgFOVrk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jun 2020 17:47:40 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6128C08C5C3
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2020 14:47:39 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id o26so12651976edq.0
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2020 14:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
 <1590226253.lnkg0jun9x.astroid@bobo.none> <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
In-Reply-To: <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 15 Jun 2020 14:47:27 -0700
Message-ID: <CABCJKufaMU1z-s4S+dHhg0iCyVynLGwsFJgYnYyiBaR=mZt-8w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

On Sat, May 23, 2020 at 8:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Nicholas,
> (+CC: Sam Ravnborg)
>
>
> On Sat, May 23, 2020 at 7:06 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> > > + Michael, and PPC ML.
> > >
> > > They may know something about the reason of failure.
> >
> > Because the linker can't put branch stubs within object code sections,
> > so when you incrementally link them too large, the linker can't resolve
> > branches into other object files.
>
>
> Ah, you are right.
>
> So, this is a problem not only for PPC
> but also for ARM (both 32 and 64 bit), etc.
>
> ARM needs to insert a veneer to jump far.
>
> Prior to thin archive, we could not compile
> ARCH=arm allyesconfig because
> drivers/built-in.o was too large.
>
> This patch gets us back to the too large
> incremental object situation.
>
> With my quick compile-testing,
> ARCH=arm allyesconfig
> and ARCH=arm64 allyesconfig are broken.

Thanks for looking into this! Clang doesn't appear to have this issue
with LTO because it always enables both -ffunction-sections and
-fdata-sections. I confirmed that -ffunction-sections also fixes arm64
allyesconfig with this patch. While I'm fine with reusing vmlinux.o
only with LTO, how would you feel about enabling -ffunction-sections
in the kernel by default?

Sami
