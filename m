Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:41952 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751733AbeBRXpo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 18:45:44 -0500
MIME-Version: 1.0
In-Reply-To: <1518338429-5587-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518338429-5587-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Feb 2018 08:44:38 +0900
Message-ID: <CAK7LNAT0U6Fj3s0ymZiTL+kvD=iYgsCMCF-Gy7LxtU7UzXN=gg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: process mixture of clean/build targets one by one
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Meyer <thomas@m3y3r.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-11 17:40 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> I sometimes receive a question why "make -j<N> clean all" does not
> work.  It is actually possible to make it work by handling targets
> one by one.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
