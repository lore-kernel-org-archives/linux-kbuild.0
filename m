Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:24784 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbeKZBmr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Nov 2018 20:42:47 -0500
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id wAPEpBpA009427
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Nov 2018 23:51:12 +0900
Received: by mail-ua1-f50.google.com with SMTP id j3so5476856uap.3
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Nov 2018 06:51:12 -0800 (PST)
MIME-Version: 1.0
References: <201811242107.q8RCw4pQ%fengguang.wu@intel.com>
In-Reply-To: <201811242107.q8RCw4pQ%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Nov 2018 23:50:34 +0900
Message-ID: <CAK7LNARFoMReFpVnQp+tpfqkE7C_h7_dEoDW7GWYRCdrYhi6_Q@mail.gmail.com>
Subject: Re: [kbuild:kbuild 13/24] fixdep: error opening file:
 fs/xfs/.xfs_ioctl.o.d: No such file or directory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Nov 24, 2018 at 10:13 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   9a1006b7aba40da544f7d138c90222b904f5c7ab
> commit: b6062bbfc43f6b217548e76000cf1dd959cff7bb [13/24] kbuild: change if_changed_rule for multi-line recipe
> config: sh-sdk7786_defconfig (attached as .config)
> compiler: sh4-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout b6062bbfc43f6b217548e76000cf1dd959cff7bb
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=sh
>
> Note: the kbuild/kbuild HEAD 9a1006b7aba40da544f7d138c90222b904f5c7ab builds fine.
>       It only hurts bisectibility.


I locally fixed up the kbuild branch
to get back the bisectability.


Thanks for the report.



-- 
Best Regards
Masahiro Yamada
