Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:26049 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751753AbeBTOux (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 09:50:53 -0500
MIME-Version: 1.0
In-Reply-To: <20180215210750.28813-1-luc.vanoostenryck@gmail.com>
References: <20180215210750.28813-1-luc.vanoostenryck@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Feb 2018 23:50:02 +0900
Message-ID: <CAK7LNAR6Pizog=NBVjYfF1owSntjOb4o7qV4WNv7d3j3LxongA@mail.gmail.com>
Subject: Re: [PATCH] disable sparse warnings about unknown attributes
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Josh Triplett <josh@joshtriplett.org>, Randy Dunlap <rdunlap@infradead.org>, linux-sparse@vger.kernel.org

2018-02-16 6:07 GMT+09:00 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>:
> Currently, sparse issues warnings on code using an attribute
> it doesn't know about.
>
> One of the problem with this is that these warnings have no
> value for the developer, it's just noise for him. At best these
> warnings tell something about some deficiencies of sparse itself
> but not about a potential problem with code analyzed.
>
> A second problem with this is that sparse release are, alas,
> less frequent than new attributes are added to GCC.
>
> So, avoid the noise by asking sparse to not warn about
> attributes it doesn't know about.
>
> Reference: https://marc.info/?l=linux-sparse&m=151871600016790
> Reference: https://marc.info/?l=linux-sparse&m=151871725417322
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Applied to linux-kbuild/kbuild.

Thanks!


-- 
Best Regards
Masahiro Yamada
