Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41220 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfGGEdS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jul 2019 00:33:18 -0400
MIME-Version: 1.0
References: <20190628051300.30678-1-yamada.masahiro@socionext.com> <CAK7LNAQ8M_z-z8tp-OiU=n13iggqEyY084S5HNS3p8LwM3qc1g@mail.gmail.com>
In-Reply-To: <CAK7LNAQ8M_z-z8tp-OiU=n13iggqEyY084S5HNS3p8LwM3qc1g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 7 Jul 2019 13:32:31 +0900
Message-ID: <CAK7LNAQJV+W9+1GVBVLiF4Bk-Womf=Gxqi8b2n173Y0xaaNkvA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -E instead of -c for __cc-option
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Jul 6, 2019 at 11:37 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Fri, Jun 28, 2019 at 2:13 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Use -E instead of -c like scripts/Kconfig.include
> > This makes the compiler flag evaluation slightly faster.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
>
> Applied to linux-kbuild.

Dropped because 0-day bot reported build error.


-- 
Best Regards
Masahiro Yamada
