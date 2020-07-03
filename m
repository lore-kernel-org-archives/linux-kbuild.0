Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgGCQGT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jul 2020 12:06:19 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FD0C08C5DD
        for <linux-kbuild@vger.kernel.org>; Fri,  3 Jul 2020 09:06:19 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f16so3794288pjt.0
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jul 2020 09:06:19 -0700 (PDT)
Date: Fri, 3 Jul 2020 09:06:16 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: Kernel compression benchmarks
Message-ID: <202007030855.ED7AABDF@keescook>
References: <1588791882.08g1378g67.none.ref@localhost>
 <1588791882.08g1378g67.none@localhost>
 <202007020818.87EA89106@keescook>
 <CA+icZUUBAzBNwqThSF=YS1zg9EVCuSZ-XDc5Pu3NrO6R3Fi2Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUUBAzBNwqThSF=YS1zg9EVCuSZ-XDc5Pu3NrO6R3Fi2Zw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <nickrterrell@gmail.com>, Nick Terrell <terrelln@fb.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, linux-kernel@vger.kernel.org, Norbert Lange <nolange79@gmail.com>, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>

On Fri, Jul 03, 2020 at 10:15:20AM +0200, Sedat Dilek wrote:
> On Thu, Jul 2, 2020 at 5:18 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, Jul 01, 2020 at 10:35:48AM -0400, Alex Xu (Hello71) wrote:
> > > ZSTD compression patches have been sent in a number of times over the
> > > past few years. Every time, someone asks for benchmarks. Every time,
> > > someone is concerned about compression time. Sometimes, someone provides
> > > benchmarks.
> >
> > Where's the latest series for this, btw? I thought it had landed. :P It
> > seemed like it was done.
> >
> 
> Hi,
> 
> Again, I would like to see this upstream, too.
> 
> Last I asked for a rebase against Linux v5.8-rc1 or later.
> 
> Beyond above adaptations, the latest series "zstd-v5" of Nick T.s
> patchset needs some addition of zstd to the patch (see [1]):
> 
> commit 8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294
> "kbuild: add variables for compression tools"
> 
> NOTE:
> "zstd-v5" was against Linux-next 20200408 or download the series from
> patchwork LKML which applies cleanly against Linux v5.7 - last is what
> I did.
> 
> There was a follow-up to the above patch (see [2]):
> 
> commit e4a42c82e943b97ce124539fcd7a47445b43fa0d
> "kbuild: fix broken builds because of GZIP,BZIP2,LZOP variables"

Okay, cool. Yes, now is the right time to send an updated series based
on v5.8-rc2 with any outstanding adjusted/fixes made.

It seems v5 is here?
https://lore.kernel.org/lkml/20200408215711.137639-1-nickrterrell@gmail.com/

That wasn't sent "to" a maintainer, so it likely went unnoticed by either
akpm or the x86 maintainers. I think this should likely go via the x86
tree.

> Nevertheless, this is the kernel-side of doing - user-space like for
> example Debian's initramfs-tools needs adaptations (see [3]).

Right, but the kernel needs to implement the support first. :)

> @Kees: Can you aid Nick T. to get this upstream? You know the
> processes a bit better than me.

Sure; Nick, can you please rebase and handle any issues from v5? With
the result, send a v6 as you did for v5 before, but I would make your
"to" be:

Borislav Petkov <bp@alien8.de>
Thomas Gleixner <tglx@linutronix.de>

and keep the CC as you had it.

-- 
Kees Cook
