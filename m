Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60896 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754423AbeGHCQR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Jul 2018 22:16:17 -0400
MIME-Version: 1.0
In-Reply-To: <a2a39cac-79fc-22d9-e1d0-b94787526794@cn.fujitsu.com>
References: <a2a39cac-79fc-22d9-e1d0-b94787526794@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 8 Jul 2018 11:15:30 +0900
Message-ID: <CAK7LNAQnpQn5k0fkb+nSASe7qg1UgX6BhdR-3EEuSX=xOuPhrw@mail.gmail.com>
Subject: Re: kconfig usage in automatic kernel test
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-07-06 17:49 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> Masahiro-san,
>
>   I am writing some utility for internal kdump test with latest kernel,
> my purpose is to test the new introduced kernel feature. For automatical
> test, I see several config target could help, like olddefconfig, all*config.
>
> But for my purpose, I don't find a good way. For example, olddefconfig
> will let the now config item has default value, while some feature may
> default to "N"; allyesconfig will slow the compilation notably.
> But "all*config" has KCONFIG_ALLCONFIG help to customizing some config
> item, that is a good utility, but seems it can't be used in olddefconfig.
>
> All these things let me have 2 questions:
>
> 1. What would you suggest for my purpose?


scripts/kconfig/merge_config.sh
can be used with any *config target.

If you want to tweak some symbols based on olddefconfig,
this could be the one you want.


> 2. allyesconfig, allmodconfig, randconfig seems useful for test kbuild,
> but what's the purpose of allnoconfig, alldefconfig? In others words,
> when people would need allnoconfig, alldefconfig?

I sometimes use allnoconfig for build testing.

When I want to test the whole build process quickly,
I disable as many drivers as possible to save time.


I do not use alldefconfig.
Anyway, it would not hurt to have it for completeness.


> --
> Sincerely,
> Cao jin
>
>



-- 
Best Regards
Masahiro Yamada
