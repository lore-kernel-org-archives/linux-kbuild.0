Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:24356 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbeLBEnh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Dec 2018 23:43:37 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id wB24hP70019335
        for <linux-kbuild@vger.kernel.org>; Sun, 2 Dec 2018 13:43:25 +0900
Received: by mail-vs1-f42.google.com with SMTP id g68so5651563vsd.11
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Dec 2018 20:43:25 -0800 (PST)
MIME-Version: 1.0
References: <201812020955.4fjDdeQv%fengguang.wu@intel.com>
In-Reply-To: <201812020955.4fjDdeQv%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 2 Dec 2018 13:42:48 +0900
Message-ID: <CAK7LNARYycBYgxYfhZ8+93QGx-B0-+8tzVduTym3VctqjVqFcQ@mail.gmail.com>
Subject: Re: [kbuild:kbuild 29/29] make[2]: *** No rule to make target
 'arch/sh/boot/dts/.dtb.o', needed by 'arch/sh/boot/dts/built-in.a'.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Kbuild test robot,

On Sun, Dec 2, 2018 at 10:52 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   e714d4dfb7710cf6ca2609bd7c537f808fac9de5
> commit: e714d4dfb7710cf6ca2609bd7c537f808fac9de5 [29/29] kbuild: move .SECONDARY special target to Kbuild.include
> config: sh-j2_defconfig (attached as .config)
> compiler: sh4-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout e714d4dfb7710cf6ca2609bd7c537f808fac9de5
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=sh
>
> All errors (new ones prefixed by >>):
>
> >> make[2]: *** No rule to make target 'arch/sh/boot/dts/.dtb.o', needed by 'arch/sh/boot/dts/built-in.a'.
>    make[2]: Target '__build' not remade because of errors.


This is totally unrelated to my commit.



This is a breakage introduced by

commit 37c8a5fafa3bb7dcdd51774be353be6cb2912b86
Author: Rob Herring <robh@kernel.org>
Date:   Wed Jan 10 15:19:37 2018 -0600

    kbuild: consolidate Devicetree dtb build rules





BTW, do you have a plan to extend this service
so a GZIP-compressed full build log is attached?





-- 
Best Regards
Masahiro Yamada
