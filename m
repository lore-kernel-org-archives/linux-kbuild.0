Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25231 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965245AbeF1Nkf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jun 2018 09:40:35 -0400
MIME-Version: 1.0
In-Reply-To: <201806240006.eCGYTuNX%fengguang.wu@intel.com>
References: <1529762169-13488-1-git-send-email-yamada.masahiro@socionext.com> <201806240006.eCGYTuNX%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Jun 2018 22:39:33 +0900
Message-ID: <CAK7LNATEc6SO9ws9zS7zAnQThKf8q1bK1S3DdSGKfipDz8sAhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: use 'include' directive to load auto.conf
 from top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-06-24 3:59 GMT+09:00 kbuild test robot <lkp@intel.com>:
> Hi Masahiro,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on kbuild/for-next]
> [also build test ERROR on v4.18-rc1 next-20180622]
> [cannot apply to mmarek/for-next mmarek/rc-fixes]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kbuild-use-include-directive-to-load-auto-conf-from-top-Makefile/20180623-220114
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> config: xtensa-nommu_kc705_defconfig (attached as .config)
> compiler: xtensa-de212-elf-gcc (crosstool-NG crosstool-ng-1.23.0-307-g452ee331) 7.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.3.0 make.cross ARCH=xtensa
>
> All errors (new ones prefixed by >>):
>
>>> Makefile:592: include/config/auto.conf: No such file or directory


I was able to reproduce this.


This depends on the version of GNU Make.

The warning is displayed if you use GNU Make 4.1 or older.
No more annoying warning is displayed for GNU Make 4.2 or later.

Probably, this commit in GNU Make:

commit 87a5f98d248fe63fe6e3e53ee3e1b1b1fa5e49dc
Author: Paul Smith <psmith@gnu.org>
Date:   Sat Apr 9 19:49:27 2016 -0400

    [SV 102] Don't show unnecessary include file errors.


However, 4.2 is quite new.  I will do something with it.


Thanks.






>    drivers/staging/mt7621-dts/Kconfig:4:warning: 'BUILTIN_DTB' has wrong type. 'select' only accept arguments of bool and tristate type
>    <stdin>:1332:2: warning: #warning syscall io_pgetevents not implemented [-Wcpp]
>    <stdin>:1335:2: warning: #warning syscall rseq not implemented [-Wcpp]
>
> vim +592 Makefile
>
>    590
>    591  ifeq ($(dot-config),1)
>  > 592  include include/config/auto.conf
>    593  endif
>    594
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Best Regards
Masahiro Yamada
