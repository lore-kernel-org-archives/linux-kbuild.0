Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:30344
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751617AbdKOIhM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 03:37:12 -0500
Date: Wed, 15 Nov 2017 09:37:04 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: Coccinelle: badzero.cocci failure
In-Reply-To: <CAK7LNAR=Un8B4e9-H7hOA+u=PH985xc1NBHRXoXQrSCs5hK7dQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1711150935470.3647@hadrien>
References: <CAK7LNATW91vf5Sa-vvJ7rLRNt+KRKPB=E5H_EOtOUgCB4WYmUA@mail.gmail.com> <alpine.DEB.2.20.1711141003410.2874@hadrien> <CAK7LNATw25OPNe_oqQNCmF=Uaw1Enjx9YRRBEHsZcAgupgHc8w@mail.gmail.com> <alpine.DEB.2.20.1711150721060.2147@hadrien>
 <CAK7LNAR=Un8B4e9-H7hOA+u=PH985xc1NBHRXoXQrSCs5hK7dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-120972166-1510735025=:3647"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: cocci@systeme.lip6.fr, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

--8323329-120972166-1510735025=:3647
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

> > Can you try the following semantic patch (called eg nothing.cocci):
> >
> > @script:ocaml@
> > @@
> >
> > ()
> >
> > on any .c file, ie
> >
> > spatch --sp-file nothing.cocci test.c
> >
>
>
> Thanks for the simple test semantic patch!
>
>
>
> I noticed  1.0.4 is OK,
> but 1.0.5 is NG
>
> I guess this is a problem on Coccinelle side.
>
>
> I git-bisect:ed and the first bad commit bad was:
>
>
> commit cd539cd12ad0674d5a8f4c33f6c21ae00aec8e57
> Author: Sébastien Hinderer <Sebastien.Hinderer@inria.fr>
> Date:   Tue Mar 15 12:06:00 2016 +0100
>
>     Get rid of the --enable-release configure option.
>
>
>
>
> $ spatch --version
> spatch byte-code version 1.0.4-00212-g8238ba5 compiled with OCaml version 4.02.3
> Flags passed to the configure script: --prefix=/home/masahiro
> Python scripting support: yes
> Syntax of regular expresssions: PCRE
> $ spatch  --sp-file nothing.cocci kernel/kmod.c
> init_defs_builtins: /home/masahiro/lib/coccinelle/standard.h
> Using native version of ocamlc/ocamlopt/ocamldep
> ocamlc.opt -c /tmp/ocaml_cocci_23600a.cmo -g -I /usr/lib/ocaml  -I
> /home/masahiro/lib/coccinelle/ocaml /tmp/ocaml_cocci_23600a.ml
> Compilation OK!
> Loading ML code of the SP...
> HANDLING: kernel/kmod.c
> $ spatch --version
> spatch native version 1.0.4-00213-gcd539cd compiled with OCaml version 4.02.3
> Flags passed to the configure script: --prefix=/home/masahiro
> Python scripting support: yes
> Syntax of regular expresssions: PCRE
> $ spatch  --sp-file nothing.cocci kernel/kmod.c
> init_defs_builtins: /home/masahiro/lib/coccinelle/standard.h
> Using native version of ocamlc/ocamlopt/ocamldep
> ocamlopt.opt -shared -o /tmp/ocaml_cocci_fdd282.cmxs -g -I
> /usr/lib/ocaml  -I /home/masahiro/lib/coccinelle/ocaml
> /tmp/ocaml_cocci_fdd282.ml
> Compilation OK!
> Loading ML code of the SP...
> implementation mismatch on Iteration
> Fatal error: exception
> Yes_prepare_ocamlcocci.LinkFailure("/tmp/ocaml_cocci_fdd282.cmxs")

Thanks for the feedback.  I will try to find out more about this.

julia
--8323329-120972166-1510735025=:3647--
