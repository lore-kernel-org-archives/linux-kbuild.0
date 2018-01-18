Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:50873 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932337AbeAROGZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jan 2018 09:06:25 -0500
MIME-Version: 1.0
In-Reply-To: <1515718701-4552-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515718701-4552-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jan 2018 23:05:30 +0900
Message-ID: <CAK7LNARe2VfzovUGbvNSnN83o6z0QrqMnSJb6LEO1cOLcTAjFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: use default 'yy' prefix for lexer and parser
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-12 9:58 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Flex and Bison provide an option to change the prefix of globally-
> visible symbols.  This is useful to link multiple lexers and/or
> parsers into the same executable.  However, Kconfig (and any other
> host programs in kernel) uses a single lexer and parser.  I do not
> see a good reason to change the default 'yy' prefix.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied both patches to linux-kbuild/kconfig.



-- 
Best Regards
Masahiro Yamada
