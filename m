Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32363 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752794AbeCPHVv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Mar 2018 03:21:51 -0400
MIME-Version: 1.0
In-Reply-To: <201803161556.k5e67tZ5%fengguang.wu@intel.com>
References: <1521045861-22418-4-git-send-email-yamada.masahiro@socionext.com> <201803161556.k5e67tZ5%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Mar 2018 16:20:53 +0900
Message-ID: <CAK7LNARS-BGvr7fae6=VcMEWsUiTtx3P8UxbnGqPpqz6UYhL0w@mail.gmail.com>
Subject: Re: [PATCH 3/7] kbuild: move 'scripts' target below
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Jarod Wilson <jarod@redhat.com>, Prarit Bhargava <prarit@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-16 16:13 GMT+09:00 kbuild test robot <lkp@intel.com>:
> Hi Masahiro,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.16-rc5 next-20180315]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kbuild-various-fix-clean-up-improvements-of-CONFIG_TRIM_UNUSED_KSYMS/20180316-123605
> config: i386-tinyconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> Note: the linux-review/Masahiro-Yamada/kbuild-various-fix-clean-up-improvements-of-CONFIG_TRIM_UNUSED_KSYMS/20180316-123605 HEAD 4825fb9eaae4e9ae97e48daeaa1bdcad6ea8b12f builds fine.
>       It only hurts bisectibility.
>
> All errors (new ones prefixed by >>):
>
>>> make[1]: *** No rule to make target 'autoksyms', needed by 'scripts'.
>    make[1]: Target '_all' not remade because of errors.
>

Seems a left-over garbage.

I will fix it.



-- 
Best Regards
Masahiro Yamada
