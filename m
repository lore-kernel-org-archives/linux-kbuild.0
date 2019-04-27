Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:24903 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfD0IpV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Apr 2019 04:45:21 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x3R8jD4m008838
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Apr 2019 17:45:14 +0900
Received: by mail-vs1-f53.google.com with SMTP id d8so3319487vsp.2
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Apr 2019 01:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <95724704-6bc7-d8d7-7d6c-88d316be0e61@infradead.org>
In-Reply-To: <95724704-6bc7-d8d7-7d6c-88d316be0e61@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 27 Apr 2019 17:44:36 +0900
Message-ID: <CAK7LNATEb3XytOUjCQ_jy8qT6gb2iy0a1phrmNmdJRjCM-mVkQ@mail.gmail.com>
Subject: Re: mini.config with defconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Sat, Apr 27, 2019 at 12:46 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> Is the "defconfig" target supported when using a mini.config file?

No.

As you see line 584 of scripts/kconfig/conf.c,
this is supported only for
 allnoconfig
 allyesconfig
 allmodconfig
 alldefconfig
 randconfig


defconfig reads a config fragment
from arch/*/configs/*_defconfig.

So, we need to merge data
from arch/*/configs/*_defconfig and mini.config

Currently, this is not supported by the kconfig binary,
but by scripts/kconfig/merge_config.sh


Thanks.



> I am trying to use this mini.config file with x86_64 defconfig:
>
> # CONFIG_UNWINDER_ORC is not set
> CONFIG_UNWINDER_FRAME_POINTER=y
> # CONFIG_UNWINDER_GUESS is not set
>
>
> but the generated .config file always has:
> CONFIG_UNWINDER_ORC=y
> # CONFIG_UNWINDER_FRAME_POINTER is not set
>
>
> command:
> make KCONFIG_ALLCONFIG=mini.config ARCH=x86_64 O=MINI defconfig
>
>
> thanks.
> --
> ~Randy



-- 
Best Regards
Masahiro Yamada
