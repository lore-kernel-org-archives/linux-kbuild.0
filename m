Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64051 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751582AbeFXI5K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Jun 2018 04:57:10 -0400
MIME-Version: 1.0
In-Reply-To: <201806240006.eCGYTuNX%fengguang.wu@intel.com>
References: <1529762169-13488-1-git-send-email-yamada.masahiro@socionext.com> <201806240006.eCGYTuNX%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 24 Jun 2018 17:56:24 +0900
Message-ID: <CAK7LNARv7VyPaew6XpRiYqh1YTapj-oErGuiq4rS1_BmEjC8Lw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: use 'include' directive to load auto.conf
 from top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.

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

This did not work for me
because the make.cross script tries to download GCC 7.3.0 xtensa-linux
but it is missing in the web site.

$ GCC_VERSION=7.3.0 make.cross ARCH=xtensa
Cannot find xtensa-linux under
https://download.01.org/0day-ci/cross-package check
/tmp/crosstool-files


I installed xtensa-de212-elf-gcc by hand,
but I could not reproduce the error.


GCC_VERSION=7.2.0 make.cross ARCH=xtensa
worked, but I could not reproduce the issue either.
(the build terminated with a different error.)


Where can I see the full build log?


> All errors (new ones prefixed by >>):
>
>>> Makefile:592: include/config/auto.conf: No such file or directory
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
