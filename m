Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:40519 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750779AbeEQNfF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 May 2018 09:35:05 -0400
MIME-Version: 1.0
In-Reply-To: <20180516055136.6F4EAA095A@unicorn.suse.cz>
References: <20180516055136.6F4EAA095A@unicorn.suse.cz>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 17 May 2018 22:34:12 +0900
Message-ID: <CAK7LNAQB_J1WwaV-8a66KyCfG3bNqNwA9zb08Vph=zn73A-i9Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile: disable PIE before testing asm goto
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Kubecek <mkubecek@suse.cz>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andreas Faerber <afaerber@suse.com>

2018-05-16 14:51 GMT+09:00 Michal Kubecek <mkubecek@suse.cz>:
> Since commit e501ce957a78 ("x86: Force asm-goto"), aarch64 build on
> distributions which enable PIE by default (e.g. openSUSE Tumbleweed) does
> not detect support for asm goto correctly. The problem is that ARM specific
> part of scripts/gcc-goto.sh fails with PIE even with recent gcc versions.
> Moving the asm goto detection up in Makefile put it before the place where
> we disable PIE. As a result, kernel is built without jump label support.
>
> Move the lines disabling PIE before the asm goto test to make it work.
>
> Fixes: e501ce957a78 ("x86: Force asm-goto")
> Reported-by: Andreas Faerber <afaerber@suse.com>
> Signed-off-by: Michal Kubecek <mkubecek@suse.cz>
> ---

Applied to linux-kbuild/fixes.  Thanks!


-- 
Best Regards
Masahiro Yamada
