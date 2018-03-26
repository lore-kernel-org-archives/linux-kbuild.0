Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52152 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751160AbeCZPZ3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Mar 2018 11:25:29 -0400
MIME-Version: 1.0
In-Reply-To: <1521738014-18895-1-git-send-email-yamada.masahiro@socionext.com>
References: <1521738014-18895-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Mar 2018 00:24:27 +0900
Message-ID: <CAK7LNASaHvmxHn4PiCO7bs+WfmoeBfpKR+zZBrXQFn+LEu7b1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] kconfig: remove duplicated file name and lineno of
 recursive inclusion
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-23 2:00 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> As in the unit test, the error message for the recursive inclusion
> looks like this:
>
>   Kconfig.inc1:4: recursive inclusion detected. Inclusion path:
>     current file : 'Kconfig.inc1'
>     included from: 'Kconfig.inc3:1'
>     included from: 'Kconfig.inc2:3'
>     included from: 'Kconfig.inc1:4'
>
> The 'Kconfig.inc1:4' is duplicated in the first and last lines.
> Also, the single quotes do not help readability.
>
> Change the message like follows:
>
>   Recursive inclusion detected.
>   Inclusion path:
>     current file : Kconfig.inc1
>     included from: Kconfig.inc3:1
>     included from: Kconfig.inc2:3
>     included from: Kconfig.inc1:4
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/kconfig.




-- 
Best Regards
Masahiro Yamada
