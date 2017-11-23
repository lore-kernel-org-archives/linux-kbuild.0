Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:61358 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752863AbdKWOOW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Nov 2017 09:14:22 -0500
MIME-Version: 1.0
In-Reply-To: <20171108210959.16470-1-xypron.glpk@gmx.de>
References: <20171108210959.16470-1-xypron.glpk@gmx.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Nov 2017 23:13:34 +0900
Message-ID: <CAK7LNASCZno-poGMiwMG+gcKZV5AA21C3gEWFCjgSWr4-2eFEw@mail.gmail.com>
Subject: Re: [PATCH 1/1] kconfig/symbol.c: use correct pointer type argument
 for sizeof
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-09 6:09 GMT+09:00 Heinrich Schuchardt <xypron.glpk@gmx.de>:
> sym_arr is of type struct symbol **.
> So in malloc we need sizeof(struct symbol *).
>
> The problem was indicated by coccinelle.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---

Applied to linux-kbuild.  Thanks!



-- 
Best Regards
Masahiro Yamada
