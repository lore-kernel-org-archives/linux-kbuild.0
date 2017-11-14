Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:63994
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753853AbdKNJH7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 04:07:59 -0500
Date: Tue, 14 Nov 2017 10:07:28 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: Coccinelle: badzero.cocci failure
In-Reply-To: <CAK7LNATW91vf5Sa-vvJ7rLRNt+KRKPB=E5H_EOtOUgCB4WYmUA@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1711141003410.2874@hadrien>
References: <CAK7LNATW91vf5Sa-vvJ7rLRNt+KRKPB=E5H_EOtOUgCB4WYmUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: cocci@systeme.lip6.fr, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

> coccicheck failed
> $ cat cocci-debug.txt
> /home/masahiro/bin/spatch -D report --no-show-diff --very-quiet
> --cocci-file scripts/coccinelle/null/badzero.cocci --dir . -I
> ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I
> ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I
> ./include/uapi -I ./include/generated/uapi --include
> ./include/linux/kconfig.h --jobs 8 --chunksize 1
> Fatal error: exception
> Yes_prepare_ocamlcocci.LinkFailure("/tmp/ocaml_cocci_18c9f9.cmxs")

Does your Coccinelle support OCaml?  I'm not sure what is the proper way to
check for this, but in my coccinelle/config.log file I have

FEATURE_OCAML='1'

spatch --version gives:

spatch version 1.0.6-00147-g19f9421 compiled with OCaml version 4.02.3
Flags passed to the configure script: [none]
Python scripting support: yes
Syntax of regular expresssions: Str

I'm not sure why it doesn't give feedback on whether OCaml scripting is
supported.  I will check on this.

julia
