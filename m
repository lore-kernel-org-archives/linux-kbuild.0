Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20673 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgEaSRx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 May 2020 14:17:53 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 04VIHa98020285
        for <linux-kbuild@vger.kernel.org>; Mon, 1 Jun 2020 03:17:37 +0900
Received: by mail-vs1-f45.google.com with SMTP id q2so148342vsr.1
        for <linux-kbuild@vger.kernel.org>; Sun, 31 May 2020 11:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
In-Reply-To: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 1 Jun 2020 03:16:59 +0900
Message-ID: <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: allow modules_install if CONFIG_MODULES=n
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonas Zeiger <jonas.zeiger@talpidae.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Thu, May 28, 2020 at 1:44 PM Jonas Zeiger <jonas.zeiger@talpidae.net> wrote:
>
> Many applications check for available kernel features via:
>
>   * /proc/modules (loaded modules, present if CONFIG_MODULES=y)
>   * $(MODLIB)/modules.builtin (builtin modules)
>
> They fail to detect features if the kernel was built with
> CONFIG_MODULES=n
> and modules.builtin isn't installed.
>
> Therefore, allow the Makefile's modules_install target to be used
> always.
>
> Tested Makefile targets with different CONFIG_MODULES states:
>
>   * (CONFIG_MODULES=n) modules_install: install modules.builtin etc.
>   * (CONFIG_MODULES=y) modules_install: produce same result as before
>   * (CONFIG_MODULES=y) modules_install: still fail if no modules.order
>   * (CONFIG_MODULES=y) modules: build modules, as before
>   * (CONFIG_MODULES=n) modules: still fail and warn
>
> Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>


Maybe, module.builtin and module.builtin.modinfo should be
installed by 'make install' because they are byproducts of vmlinux.


-- 
Best Regards
Masahiro Yamada
