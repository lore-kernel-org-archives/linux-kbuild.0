Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50608 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751916AbeAERfC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jan 2018 12:35:02 -0500
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1711161956590.20817@knanqh.ubzr>
References: <nycvar.YSQ.7.76.1711161956590.20817@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 6 Jan 2018 02:34:02 +0900
Message-ID: <CAK7LNASSNAvPsaswnow5VoPDBKKaasG3hfae0WL2jjrdYd2PZw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix relational operators for bool and tristate symbols
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Jan Beulich <JBeulich@suse.com>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-17 10:06 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> Since commit 31847b67bec0 ("kconfig: allow use of relations other than
> (in)equality") it is possible to use relational operators in Kconfig
> statements. However, those operators give unexpected results when
> applied to bool/tristate values:
>
>         (n < y) = y (correct)
>         (m < y) = y (correct)
>         (n < m) = n (wrong)
>
> This happens because relational operators process bool and tristate
> symbols as strings and m sorts before n. It makes little sense to do a
> lexicographical compare on bool and tristate values though.
>
> Documentation/kbuild/kconfig-language.txt states that expression can have
> a value of 'n', 'm' or 'y' (or 0, 1, 2 respectively for calculations).
> Let's make it so for relational comparisons with bool/tristate
> expressions as well and document them. If at least one symbol is an
> actual string then the lexicographical compare works just as before.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
>

Applied to linux-kbuild/fixes.  Thanks!

-- 
Best Regards
Masahiro Yamada
