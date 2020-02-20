Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17334 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbgBTCkd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 21:40:33 -0500
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01K2eI2F000430
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Feb 2020 11:40:19 +0900
Received: by mail-vk1-f172.google.com with SMTP id t129so775259vkg.6
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Feb 2020 18:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20200217012741.22100-2-masahiroy@kernel.org> <202002200725.lfEcxTej%lkp@intel.com>
In-Reply-To: <202002200725.lfEcxTej%lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 20 Feb 2020 11:39:40 +0900
Message-ID: <CAK7LNARMfv-JzbX1PMy4J6H1XGVPO7s-6Gy6QF2KevKvKjGcoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: add -Wall to KBUILD_HOSTCXXFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Thu, Feb 20, 2020 at 8:37 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Masahiro,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on kbuild/for-next]
> [also build test WARNING on kbuild/kconfig linux/master linus/master v5.6-rc2 next-20200219]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kconfig-remove-unused-variable-in-qconf-cc/20200219-035229
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> config: i386-randconfig-a003-20200219 (attached as .config)
> compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts//gcc-plugins/gcc-common.h:9,
>                     from scripts//gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\



Thanks for the report.
This is a warning from the toolchain headers.
I cannot fix it.

I do not see this warning on newer GCC.







>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts//gcc-plugins/gcc-common.h:9,
>                     from scripts//gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
> --
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/randomize_layout_plugin.c:19:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/randomize_layout_plugin.c:19:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    Cyclomatic Complexity 1 scripts/mod/devicetable-offsets.c:main
>    Cyclomatic Complexity 1 kernel/bounds.c:main
>    Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets_32.c:foo
>    Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets.c:common
>    51 real  8 user  9 sys  33.65% cpu   make prepare
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Best Regards
Masahiro Yamada
