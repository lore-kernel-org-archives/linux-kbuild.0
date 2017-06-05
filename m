Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44632 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbdFEHAf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jun 2017 03:00:35 -0400
MIME-Version: 1.0
In-Reply-To: <20170520112700.27823-1-nicolas.iooss_linux@m4x.org>
References: <20170520112700.27823-1-nicolas.iooss_linux@m4x.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Jun 2017 16:00:23 +0900
Message-ID: <CAK7LNASxpaFKPvJ9k=cg_R3K4i5_kG5TeFW6tcf=4OmE+Vej-A@mail.gmail.com>
Subject: Re: [PATCH 1/1] genksyms: add printf format attribute to error_with_pos()
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Nicolas

2017-05-20 20:27 GMT+09:00 Nicolas Iooss <nicolas.iooss_linux@m4x.org>:
> When compiling with -Wsuggest-attribute=3Dformat in HOSTCFLAGS, gcc
> complains that error_with_pos() may be declared with a printf format
> attribute:
>
>     scripts/genksyms/genksyms.c:726:3: warning: function might be
>     possible candidate for =E2=80=98gnu_printf=E2=80=99 format attribute
>     [-Wsuggest-attribute=3Dformat]
>        vfprintf(stderr, fmt, args);
>        ^~~~~~~~
>
> This would allow catching printf-format errors at compile time in
> callers to error_with_pos(). Add this attribute.
>
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
> ---
>
> I am sending this to the maintainers listed in section "KERNEL BUILD +
> files below scripts/ (unless maintained elsewhere)" even though it does
> not list scripts/genksyms/. Should this directory be added in
> MAINTAINERS?

scripts/genksyms/ is not explicitly listed in MAINTAINERS.
So, patches that touch scripts/genksyms/ basically should go to the kbuild =
tree
by the rule "files below scripts/ (unless maintained elsewhere)".
I will apply this patch shortly.  Thanks.

If somebody offers to maintain scripts/genksyms/, I am totally fine with it=
.

--=20
Best Regards
Masahiro Yamada
