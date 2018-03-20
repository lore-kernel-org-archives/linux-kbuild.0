Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:58552 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751330AbeCTPd4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Mar 2018 11:33:56 -0400
MIME-Version: 1.0
In-Reply-To: <20180319211253.3172-1-stefan@agner.ch>
References: <20180319211253.3172-1-stefan@agner.ch>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Mar 2018 00:33:04 +0900
Message-ID: <CAK7LNARn19r2hE-f-Gusq4rgvMZ0a=fk2Qbw8fhvsd7iAd+1Tg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: set no-integrated-as before incl. arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: Michal Marek <michal.lkml@markovi.net>, Arnd Bergmann <arnd@arndb.de>, Matthias Kaehlcke <mka@chromium.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-20 6:12 GMT+09:00 Stefan Agner <stefan@agner.ch>:
> In order to make sure compiler flag detection for ARM works
> correctly the no-integrated-as flags need to be set before
> including the arch specific Makefile.
>
> Fixes: cfe17c9bbe6a ("kbuild: move cc-option and cc-disable-warning after incl. arch Makefile")
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---

Applied to linux-kbuild. Thanks!

-- 
Best Regards
Masahiro Yamada
