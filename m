Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:21905 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730181AbeLPPZ1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Dec 2018 10:25:27 -0500
MIME-Version: 1.0
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 17 Dec 2018 00:24:42 +0900
Message-ID: <CAK7LNATKMZiN=NdhXbCLwxkKtM34cetfV5Z9bw9t2KsxZc49zg@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: refactor Makefile.asm-generic
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Dec 5, 2018 at 8:29 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
>  - Use conventional $(MAKE) $(asm-generic)=<dir> style
>    for directory descending
>
>  - Remove unneeded FORCE since "all" is a phony target
>
>  - Remove unneeded "_dummy :=" assignment
>
>  - Skip $(shell mkdir ...) when headers exist in the directory
>
>  - Misc cleanups
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

1/3 applied to linux-kbuild.

I will send v2 for the rest in the series later.



-- 
Best Regards
Masahiro Yamada
