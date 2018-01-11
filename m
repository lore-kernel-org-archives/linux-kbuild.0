Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:60867 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932506AbeAKPke (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 10:40:34 -0500
MIME-Version: 1.0
In-Reply-To: <1513352282-4437-2-git-send-email-yamada.masahiro@socionext.com>
References: <1513352282-4437-1-git-send-email-yamada.masahiro@socionext.com> <1513352282-4437-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Jan 2018 00:39:44 +0900
Message-ID: <CAK7LNAT46qZz-ccTcVuERpLXYE3SdCbm-jizEyayzszQT2BxLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: drop 'boolean' keyword
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-12-16 0:38 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> No more users of this keyword.  Drop it according to the notice by
> commit 6341e62b212a ("kconfig: use bool instead of boolean for type
> definition attributes").
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kconfig.


-- 
Best Regards
Masahiro Yamada
