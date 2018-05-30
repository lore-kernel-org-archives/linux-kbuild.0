Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:36611 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750904AbeE3Kn4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 May 2018 06:43:56 -0400
Received: by mail-pl0-f68.google.com with SMTP id v24-v6so10857242plo.3
        for <linux-kbuild@vger.kernel.org>; Wed, 30 May 2018 03:43:56 -0700 (PDT)
Date: Wed, 30 May 2018 20:43:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/4] powerpc/kbuild: set default generic machine type
 for 32-bit compile
Message-ID: <20180530204347.45655a87@roar.ozlabs.ibm.com>
In-Reply-To: <CAK7LNASsx_gDQePtNRdiY8v4RbysQqoKKfr1LW6dsz=7fq-oEQ@mail.gmail.com>
References: <20180516141458.18996-1-npiggin@gmail.com>
        <20180516141458.18996-2-npiggin@gmail.com>
        <CAK7LNASsx_gDQePtNRdiY8v4RbysQqoKKfr1LW6dsz=7fq-oEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Segher Boessenkool <segher@kernel.crashing.org>

On Tue, 29 May 2018 22:39:48 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2018-05-16 23:14 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> > Some 64-bit toolchains uses the wrong ISA variant for compiling 32-bit
> > kernels, even with -m32. Debian's powerpc64le is one such case, and
> > that is because it is built with --with-cpu=power8.
> >
> > So when cross compiling a 32-bit kernel with a 64-bit toolchain, set
> > -mcpu=powerpc initially, which is the generic 32-bit powerpc machine
> > type and scheduling model. CPU and platform code can override this
> > with subsequent -mcpu flags if necessary.
> >
> > This is not done for 32-bit toolchains otherwise it would override
> > their defaults, which are presumably set appropriately for the
> > environment (moreso than a 64-bit cross compiler).
> >
> > This fixes a lot of build failures due to incompatible assembly when
> > compiling 32-bit kernel with th Debian powerpc64le 64-bit toolchain.
> >
> > Cc: Segher Boessenkool <segher@kernel.crashing.org>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---  
> 
> 
> Can you please remove the noise changes?
> 
> 1/4 adds some blank lines, then 2/4 removes them.

Okay sure, I will change that.

Thanks,
Nick
