Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:11644 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751674AbdKHNNU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2017 08:13:20 -0500
Date: Wed, 8 Nov 2017 21:12:50 +0800 (CST)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH] coccinelle: fix verbose message about .cocci file being
 run
In-Reply-To: <CAK7LNARMTun58pa1Ew32SvQjR_u1Hg8mE-tDR_qqvztcx_Wnfg@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1711082112400.2708@hadrien>
References: <1508993751-17218-1-git-send-email-yamada.masahiro@socionext.com> <c18712da-6b47-3b13-059d-d49db738e386@imag.fr> <CAK7LNARMTun58pa1Ew32SvQjR_u1Hg8mE-tDR_qqvztcx_Wnfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-284676870-1510146798=:2708"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: nicolas.palix@univ-grenoble-alpes.fr, cocci@systeme.lip6.fr, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>

--8323329-284676870-1510146798=:2708
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 7 Nov 2017, Masahiro Yamada wrote:

> 2017-10-26 16:22 GMT+09:00 Nicolas Palix (LIG) <Nicolas.Palix@imag.fr>:
> > Le 26/10/17 à 06:55, Masahiro Yamada a écrit :
> >>
> >> If you run coccicheck with V=1 and COCCI=, you will see a strange
> >> path to the semantic patch file.  For example, run the following:
> >>
> >> $ make V=1 COCCI=scripts/coccinelle/free/kfree.cocci coccicheck
> >>    [ snip ]
> >>   The semantic patch that makes this report is available
> >>   in scriptcoccinelle/free/kfree.cocci.
> >>
> >> Notice "s/" was dropped from "scripts/coccinelle/free/kfree.cocci".
> >>
> >> When running coccicheck without O=, $srctree is expanded to ".", which
> >> represents one arbitrary character in the regular expression.  Using
> >> sed is not a good choice here.  Strip $srctree/ simply without sed.
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> > Acked-by: Nicolas Palix <nicolas.palix@imag.fr>
> >>
> >> ---
>
> Applied to linux-kbuild/misc.

Thanks!

julia
--8323329-284676870-1510146798=:2708--
