Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:42653 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750764AbeAPQpM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jan 2018 11:45:12 -0500
MIME-Version: 1.0
In-Reply-To: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 17 Jan 2018 01:44:07 +0900
Message-ID: <CAK7LNATOTB4a7VWRyaGtCshPVerh+bNFJ7XtaFECXGc+RM1KYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] fixdep: remove unnecessary <arpa/inet.h> inclusion
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-11 22:05 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> <arpa/inet.h> was included for ntohl(), but it was removed by
> commit dee81e988674 ("fixdep: faster CONFIG_ search").
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Series, applied to linux-kbuild/kbuild.


-- 
Best Regards
Masahiro Yamada
