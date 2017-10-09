Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:3130 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751599AbdJIGqI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 02:46:08 -0400
Date: Mon, 9 Oct 2017 14:45:45 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2] kconfig: Remove menu_end_entry()
Message-ID: <201710091419.TQaGEnZp%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507500888-6515-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: kbuild-all@01.org, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, JBeulich@suse.com, linux-kernel@vger.kernel.org

Hi Ulf,

[auto build test ERROR on linus/master]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Ulf-Magnusson/kconfig-Remove-menu_end_entry/20171009-140245
config: x86_64-randconfig-x018-201741
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        make ARCH=x86_64  randconfig
        make ARCH=x86_64 

All error/warnings (new ones prefixed by >>):

   scripts/kconfig/zconf.tab.o: In function `zconfparse':
>> zconf.tab.c:(.text+0x9b39): undefined reference to `menu_end_entry'
   zconf.tab.c:(.text+0xa5a5): undefined reference to `menu_end_entry'
   collect2: error: ld returned 1 exit status
   make[2]: *** [scripts/kconfig/conf] Error 1
   make[2]: Target 'oldconfig' not remade because of errors.
   make[1]: *** [oldconfig] Error 2
   make: *** [sub-make] Error 2
--
   scripts/kconfig/zconf.tab.c: In function 'zconfparse':
>> scripts/kconfig/zconf.tab.c:1555:2: warning: implicit declaration of function 'menu_end_entry' [-Wimplicit-function-declaration]
     menu_end_entry();
     ^~~~~~~~~~~~~~
   scripts/kconfig/zconf.tab.o: In function `zconfparse':
>> zconf.tab.c:(.text+0x9b39): undefined reference to `menu_end_entry'
   zconf.tab.c:(.text+0xa5a5): undefined reference to `menu_end_entry'
   collect2: error: ld returned 1 exit status
   make[2]: *** [scripts/kconfig/conf] Error 1
   make[2]: Target 'oldnoconfig' not remade because of errors.
   make[1]: *** [oldnoconfig] Error 2
   make: *** [sub-make] Error 2

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
