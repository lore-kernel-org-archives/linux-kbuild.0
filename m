Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38367 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731506AbeG2DlX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Jul 2018 23:41:23 -0400
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com [209.85.217.180]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w6T2CSt6027309
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Jul 2018 11:12:29 +0900
Received: by mail-ua0-f180.google.com with SMTP id k25-v6so5747349uao.11
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Jul 2018 19:12:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201807281506.H8XSZLgK%fengguang.wu@intel.com>
References: <201807281506.H8XSZLgK%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 29 Jul 2018 11:11:47 +0900
Message-ID: <CAK7LNAS6vY1SMcos_VOaqPUrLUJqgsH9jQ4aKodx5yesCPSCBQ@mail.gmail.com>
Subject: Re: [kbuild:kconfig2 1/10] arch/um/Kconfig:3: can't open file "arch/x86_64/um/Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

Hi Christoph,

2018-07-28 16:23 GMT+09:00 kbuild test robot <lkp@intel.com>:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig2
> head:   0e83fd903bc85173711186755591b61405647cf3
> commit: 2cc1bfaf2c45056c73970a99c3a7467e157f56aa [1/10] um: stop abusing KBUILD_KCONFIG
> config: um-x86_64_defconfig
> compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
> reproduce:
>         git checkout 2cc1bfaf2c45056c73970a99c3a7467e157f56aa
>         make ARCH=um SUBARCH=x86_64 defconfig
>         make ARCH=um SUBARCH=x86_64


Hmm.
SUBARCH is used by arch/x86/um/Kconfig
to choose 64BIT.

Maybe, do we need $(SUBSRCARCH) ?


(In hindsight, HOST_ARCH and HOST_SRCARCH
might be clearer, though...)



> All errors (new ones prefixed by >>):
>
>>> arch/um/Kconfig:3: can't open file "arch/x86_64/um/Kconfig"
>    make[2]: *** [defconfig] Error 1
>    make[1]: *** [defconfig] Error 2
>    make: *** [sub-make] Error 2
> --
>>> arch/um/Kconfig:3: can't open file "arch/x86_64/um/Kconfig"
>    make[2]: *** [oldconfig] Error 1
>    make[1]: *** [oldconfig] Error 2
>    make: *** [sub-make] Error 2
> --
>>> arch/um/Kconfig:3: can't open file "arch/x86_64/um/Kconfig"
>    make[2]: *** [olddefconfig] Error 1
>    make[1]: *** [olddefconfig] Error 2
>    make: *** [sub-make] Error 2
>
> vim +3 arch/um/Kconfig
>
>      2
>    > 3  source "arch/$(SUBARCH)/um/Kconfig"
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
