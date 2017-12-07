Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:55101 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754481AbdLGOxd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Dec 2017 09:53:33 -0500
MIME-Version: 1.0
In-Reply-To: <1507088232-8510-1-git-send-email-ulfalizer@gmail.com>
References: <1507088232-8510-1-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Dec 2017 23:52:42 +0900
Message-ID: <CAK7LNAS4QagzjC-zK7P+C9smzNTiy9XYLurO72_nBY9VJ8RyZA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Document the 'menu' struct
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-04 12:37 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Understanding what it represents helps a lot when reading the code, and
> it's not obvious, so document it.
>
> The ROOT_MENU flag is only set and tested by the gconf and qconf front
> ends, so leave it undocumented here. The obvious guess for what it means
> is correct.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>


Applied to linux-kbuild/kconfig.
Thanks!

-- 
Best Regards
Masahiro Yamada
