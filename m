Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-07.nifty.com ([202.248.20.72]:60232 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756845AbdCUSHQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Mar 2017 14:07:16 -0400
MIME-Version: 1.0
In-Reply-To: <20170313193341.28696-1-nicolas.iooss_linux@m4x.org>
References: <20170313193341.28696-1-nicolas.iooss_linux@m4x.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 22 Mar 2017 02:58:27 +0900
Message-ID: <CAK7LNAR77LjrQcGTxj6nO7ohRV3pyKAtO-kkCX3rEG=QVHJWLA@mail.gmail.com>
Subject: Re: [PATCH 1/1] gconfig: remove misleading parentheses around a condition
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-03-14 4:33 GMT+09:00 Nicolas Iooss <nicolas.iooss_linux@m4x.org>:
> When building the kernel with clang, the compiler complains about the
> presence of a condition inside two pairs of parentheses:
>
>     scripts/kconfig/gconf.c:917:19: error: equality comparison with
>     extraneous parentheses [-Werror,-Wparentheses-equality]
>                     } else if ((col == COL_OPTION)) {
>                                 ~~~~^~~~~~~~~~~~~
>     scripts/kconfig/gconf.c:917:19: note: remove extraneous parentheses
>     around the comparison to silence this warning
>                     } else if ((col == COL_OPTION)) {
>                                ~    ^            ~
>     scripts/kconfig/gconf.c:917:19: note: use '=' to turn this equality
>     comparison into an assignment
>                     } else if ((col == COL_OPTION)) {
>                                     ^~
>                                     =
>
> Silence this warning by removing a level of parentheses.
>
> Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>


Applied to linux-kbuild/fixes.   Thanks!


-- 
Best Regards
Masahiro Yamada
