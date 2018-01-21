Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51912 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750793AbeAUQrx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jan 2018 11:47:53 -0500
MIME-Version: 1.0
In-Reply-To: <20180114144926.29162-1-ulfalizer@gmail.com>
References: <20180114113820.19017-1-ulfalizer@gmail.com> <20180114144926.29162-1-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 22 Jan 2018 01:47:08 +0900
Message-ID: <CAK7LNAQYwhPSb12QoLD-XDDiahX4_RBFSD17j10o=Hb8xgU2Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kconfig: Document 'if' flattening logic
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-14 23:49 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> It is not obvious that this might refer to an 'if', making the code
> pretty cryptic:
>
>         if (menu->list && (!menu->prompt || !menu->prompt->text)) {
>
> Kconfig keeps the 'if' menu nodes even after flattening. Reflect that in
> the example to be accurate.
>
> No functional changes. Only comments added.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
> Changelog
>
> v2:
> I forgot to mention that this code also undoes automatic submenus created below
> promptless symbols.
>
>  scripts/kconfig/menu.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>

Applied to linux-kbuild/kconfig.  Thanks!


-- 
Best Regards
Masahiro Yamada
