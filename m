Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27149 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753012AbeBSQuY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Feb 2018 11:50:24 -0500
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com [209.85.217.179]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w1JGoDJn000747
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2018 01:50:13 +0900
Received: by mail-ua0-f179.google.com with SMTP id 47so6528762uau.9
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Feb 2018 08:50:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201802192300.ISBrXbI4%fengguang.wu@intel.com>
References: <201802192300.ISBrXbI4%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Feb 2018 01:49:31 +0900
Message-ID: <CAK7LNAQ3Mej-Rvfs23M0W3P8YJWbd346bv6YG_1yVMCDKpYFUw@mail.gmail.com>
Subject: Re: [kbuild:kbuild 3/4] make[2]: *** No rule to make target
 'arch/sh/boot/dts/.dtb.o', needed by 'arch/sh/boot/dts/built-in.a'.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi test robot,


2018-02-20 0:18 GMT+09:00 kbuild test robot <fengguang.wu@intel.com>:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   4f89933b6227d330b98e01aed504cce515636215
> commit: ffe8d1693c0fdb93b07f1b6449ae68bc6aba2efb [3/4] kbuild: rename built-in.o to built-in.a
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout ffe8d1693c0fdb93b07f1b6449ae68bc6aba2efb
>         # save the attached .config to linux build tree
>         make.cross ARCH=sh
>
> All errors (new ones prefixed by >>):
>
>>> make[2]: *** No rule to make target 'arch/sh/boot/dts/.dtb.o', needed by 'arch/sh/boot/dts/built-in.a'.
>    make[2]: Target '__build' not remade because of errors.
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation


This is not a new error.
(it just looked new because it was previously built-in.o,
 the it is now built-in.a)

all{yes,mod}config for ARCH=sh was already broken.

I can send a fix-up patch for sh later,
but Nicholas's patch is innocent, so I will keep his patch.






-- 
Best Regards
Masahiro Yamada
