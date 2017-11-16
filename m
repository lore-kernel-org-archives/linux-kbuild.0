Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:39807 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752929AbdKPAwv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 19:52:51 -0500
MIME-Version: 1.0
In-Reply-To: <1510652841-6779-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510652841-6779-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Nov 2017 09:52:00 +0900
Message-ID: <CAK7LNAQp41EVrMqWkyXK0twjDDGoQ787euHrt2pW7Kh3EUNK=w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move coccicheck help in scripts/Makefile.help to
 top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: cocci@systeme.lip6.fr, Julia Lawall <Julia.Lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-14 18:47 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> I do not think it is helpful to have a separate file just for the
> coccicheck help message.  Merge scripts/Makefile.help into the
> top-level Makefile.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
