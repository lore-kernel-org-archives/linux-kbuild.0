Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31396 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751887AbdKNKMc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 05:12:32 -0500
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1711141003410.2874@hadrien>
References: <CAK7LNATW91vf5Sa-vvJ7rLRNt+KRKPB=E5H_EOtOUgCB4WYmUA@mail.gmail.com>
 <alpine.DEB.2.20.1711141003410.2874@hadrien>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Nov 2017 19:11:34 +0900
Message-ID: <CAK7LNATw25OPNe_oqQNCmF=Uaw1Enjx9YRRBEHsZcAgupgHc8w@mail.gmail.com>
Subject: Re: Coccinelle: badzero.cocci failure
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: cocci@systeme.lip6.fr, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Julia,


2017-11-14 18:07 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
>> coccicheck failed
>> $ cat cocci-debug.txt
>> /home/masahiro/bin/spatch -D report --no-show-diff --very-quiet
>> --cocci-file scripts/coccinelle/null/badzero.cocci --dir . -I
>> ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I
>> ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I
>> ./include/uapi -I ./include/generated/uapi --include
>> ./include/linux/kconfig.h --jobs 8 --chunksize 1
>> Fatal error: exception
>> Yes_prepare_ocamlcocci.LinkFailure("/tmp/ocaml_cocci_18c9f9.cmxs")
>
> Does your Coccinelle support OCaml?  I'm not sure what is the proper way to
> check for this, but in my coccinelle/config.log file I have
>
> FEATURE_OCAML='1'


Yes.  I also see this line in my config.log


> spatch --version gives:
>
> spatch version 1.0.6-00147-g19f9421 compiled with OCaml version 4.02.3
> Flags passed to the configure script: [none]
> Python scripting support: yes
> Syntax of regular expresssions: Str

My version output looks like follows:

$ spatch --version
spatch version 1.0.6-00345-g2ca0bef compiled with OCaml version 4.02.3
Flags passed to the configure script: --prefix=/home/masahiro
Python scripting support: yes
Syntax of regular expresssions: PCRE


> I'm not sure why it doesn't give feedback on whether OCaml scripting is
> supported.  I will check on this.
>

Thanks!


-- 
Best Regards
Masahiro Yamada
