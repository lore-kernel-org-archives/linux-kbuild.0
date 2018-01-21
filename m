Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50673 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750793AbeAUQo4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jan 2018 11:44:56 -0500
MIME-Version: 1.0
In-Reply-To: <20180116203902.28567-1-ulfalizer@gmail.com>
References: <20180116203902.28567-1-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 22 Jan 2018 01:43:58 +0900
Message-ID: <CAK7LNAR-eNRBwAii8n5Fv4L4sOTS-mJxTF7RYnBXCQRTGOSybQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Clarify menu and 'if' dependency propagation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-17 5:39 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> It is not obvious that the last two cases refer to menus and ifs,
> respectively, in the conditional that sets 'parentdep'.
>
> Automatic submenu creation is done later, so the parent can't be a
> symbol here.
>
> No functional changes. Only comments added.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  scripts/kconfig/menu.c | 2 ++

Applied to linux-kbuild/kconfig.  Thanks!

-- 
Best Regards
Masahiro Yamada
