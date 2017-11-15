Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19080 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932872AbdKOPum (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 10:50:42 -0500
MIME-Version: 1.0
In-Reply-To: <276207557.16617848.1510757806971.JavaMail.zimbra@inria.fr>
References: <CAK7LNATW91vf5Sa-vvJ7rLRNt+KRKPB=E5H_EOtOUgCB4WYmUA@mail.gmail.com>
 <alpine.DEB.2.20.1711141003410.2874@hadrien> <CAK7LNATw25OPNe_oqQNCmF=Uaw1Enjx9YRRBEHsZcAgupgHc8w@mail.gmail.com>
 <alpine.DEB.2.20.1711150721060.2147@hadrien> <CAK7LNAR=Un8B4e9-H7hOA+u=PH985xc1NBHRXoXQrSCs5hK7dQ@mail.gmail.com>
 <276207557.16617848.1510757806971.JavaMail.zimbra@inria.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Nov 2017 00:49:55 +0900
Message-ID: <CAK7LNASGr2O3wxt_9J-zjvttpc0joztmdT7NFZ5MK7NWEOp5gw@mail.gmail.com>
Subject: Re: [Cocci] Coccinelle: badzero.cocci failure
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thierry Martinez <thierry.martinez@inria.fr>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr

Hi Thierry,

2017-11-15 23:56 GMT+09:00 Thierry Martinez <thierry.martinez@inria.fr>:
> Hi, Masahiro.
>
> Masahiro:
>> Fatal error: exception
>> Yes_prepare_ocamlcocci.LinkFailure("/tmp/ocaml_cocci_fdd282.cmxs")
>
> If you can rerun your test with coccinelle GitHub master, the
> LinkFailure exception will now be more verbose, in order to understand
> the problem.
>
> I suspect a mismatch between the version of OCaml you use to compile
> coccinelle, and the version of OCaml that coccinelle uses to compile
> OCaml scripts in rules.
>

Now I am out of the office
and working from home.
badzero.cocci works fine on my PC at home.

I suspect the difference of installed packages.


I will try the latest commit in the GitHub
tomorrow at the office.




Best Regards
Masahiro Yamada
