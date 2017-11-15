Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:43006
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754190AbdKOGWO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 01:22:14 -0500
Date: Wed, 15 Nov 2017 07:22:12 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: Coccinelle: badzero.cocci failure
In-Reply-To: <CAK7LNATw25OPNe_oqQNCmF=Uaw1Enjx9YRRBEHsZcAgupgHc8w@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1711150721060.2147@hadrien>
References: <CAK7LNATW91vf5Sa-vvJ7rLRNt+KRKPB=E5H_EOtOUgCB4WYmUA@mail.gmail.com> <alpine.DEB.2.20.1711141003410.2874@hadrien> <CAK7LNATw25OPNe_oqQNCmF=Uaw1Enjx9YRRBEHsZcAgupgHc8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: cocci@systeme.lip6.fr, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>



On Tue, 14 Nov 2017, Masahiro Yamada wrote:

> Hi Julia,
>
>
> 2017-11-14 18:07 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
> >> coccicheck failed
> >> $ cat cocci-debug.txt
> >> /home/masahiro/bin/spatch -D report --no-show-diff --very-quiet
> >> --cocci-file scripts/coccinelle/null/badzero.cocci --dir . -I
> >> ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I
> >> ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I
> >> ./include/uapi -I ./include/generated/uapi --include
> >> ./include/linux/kconfig.h --jobs 8 --chunksize 1
> >> Fatal error: exception
> >> Yes_prepare_ocamlcocci.LinkFailure("/tmp/ocaml_cocci_18c9f9.cmxs")
> >
> > Does your Coccinelle support OCaml?  I'm not sure what is the proper way to
> > check for this, but in my coccinelle/config.log file I have
> >
> > FEATURE_OCAML='1'
>
>
> Yes.  I also see this line in my config.log
>
>
> > spatch --version gives:
> >
> > spatch version 1.0.6-00147-g19f9421 compiled with OCaml version 4.02.3
> > Flags passed to the configure script: [none]
> > Python scripting support: yes
> > Syntax of regular expresssions: Str
>
> My version output looks like follows:
>
> $ spatch --version
> spatch version 1.0.6-00345-g2ca0bef compiled with OCaml version 4.02.3
> Flags passed to the configure script: --prefix=/home/masahiro
> Python scripting support: yes
> Syntax of regular expresssions: PCRE
>
>
> > I'm not sure why it doesn't give feedback on whether OCaml scripting is
> > supported.  I will check on this.

Can you try the following semantic patch (called eg nothing.cocci):

@script:ocaml@
@@

()

on any .c file, ie

spatch --sp-file nothing.cocci test.c

julia
