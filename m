Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:58437 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751270AbeBXPNL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Feb 2018 10:13:11 -0500
MIME-Version: 1.0
In-Reply-To: <1519126829-7257-1-git-send-email-yamada.masahiro@socionext.com>
References: <1519126829-7257-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Feb 2018 00:12:24 +0900
Message-ID: <CAK7LNARfW9+RgDCKK_9SZE_n9ShPZDcEvqi2H_jKKUyFVj1BRg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Don't leak choice names during parsing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Ulf Magnusson <ulfalizer@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-20 20:40 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The named choice is not used in the kernel tree, but if it were used,
> it would not be freed.
>
> The intention of the named choice can be seen in the log of
> commit 5a1aa8a1aff6 ("kconfig: add named choice group").
>
> There is room for argument if this is useful in practice, but anyway
> I am fixing the memory leak.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild/kconfig.




-- 
Best Regards
Masahiro Yamada
