Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63551 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753722AbeGFCz0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 22:55:26 -0400
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com [209.85.213.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w662tLjx000894
        for <linux-kbuild@vger.kernel.org>; Fri, 6 Jul 2018 11:55:22 +0900
Received: by mail-vk0-f52.google.com with SMTP id j11-v6so6025850vke.8
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jul 2018 19:55:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180703124331.9279-1-dirk@gouders.net>
References: <ghd0w4wtgh.fsf@lena.gouders.net> <20180703124331.9279-1-dirk@gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Jul 2018 11:54:40 +0900
Message-ID: <CAK7LNASA3TZOS_Dp7kzFP2Zmmuy4bokEp4=iiZ9R1Gg_gG9EYw@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig: rename SYMBOL_AUTO to SYMBOL_NO_WRITE
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>

2018-07-03 21:43 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> Over time, the use of the flag SYMBOL_AUTO changed from initially
> marking three automatically generated symbols ARCH, KERNELRELEASE and
> UNAME_RELEASE to today's effect of protecting symbols from being
> written out.
>
> Currently, only symbols of type CHOICE and those with option
> defconf_list set have that flag set.
>
> Reflect that change in semantics in the flag's name.
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---

Applied to linux-kbuild/kconfig. Thanks!


-- 
Best Regards
Masahiro Yamada
