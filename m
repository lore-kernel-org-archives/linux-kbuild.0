Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17577 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdJOPeb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Oct 2017 11:34:31 -0400
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com [209.85.216.171]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id v9FFYDBs022199
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Oct 2017 00:34:14 +0900
Received: by mail-qt0-f171.google.com with SMTP id f15so27375798qtf.7
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Oct 2017 08:34:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201710152156.44Cfewnd%fengguang.wu@intel.com>
References: <201710152156.44Cfewnd%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 16 Oct 2017 00:33:32 +0900
Message-ID: <CAK7LNAR9=FSZ467W36UCXG+1g4aQJK7bbBZuXDdRQBgV-ae2Ag@mail.gmail.com>
Subject: Re: [kbuild:kbuild 15/16] /bin/sh: 1: cannot create
 arch/arm64/kernel/vdso/.cache.mk: Directory nonexistent
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Douglas Anderson <dianders@chromium.org>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-10-15 22:27 GMT+09:00 kbuild test robot <fengguang.wu@intel.com>:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   97ac8fd9fb3552ec629643c9aa130d4712c37106
> commit: 24e46c15b03d3304691b869cca833e444b53f90b [15/16] kbuild: Add a cache for generated variables
> config: arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 24e46c15b03d3304691b869cca833e444b53f90b
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm64
>
> All errors (new ones prefixed by >>):
>
>>> /bin/sh: 1: cannot create arch/arm64/kernel/vdso/.cache.mk: Directory nonexistent
>


Thanks.

I will drop the cache patches for now, in order to not disturb linux-next.


We need to insert $(shell mkdir ...) somewhere.



-- 
Best Regards
Masahiro Yamada
