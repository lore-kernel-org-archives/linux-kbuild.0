Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:22558 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753739AbeCYRay (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Mar 2018 13:30:54 -0400
Date: Mon, 26 Mar 2018 01:30:18 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [kbuild:kconfig-shell-v2 36/53] scripts/kconfig/zconf.tab.c:2483:10:
 fatal error: env.c: No such file or directory
Message-ID: <201803260156.YIHCeYR0%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig-shell-v2
head:   e57fb0ae1935962534ab1b5f98e067a8f521b0e8
commit: af252189c051c6482cd81479ece4829e6c918d5c [36/53] kconfig: reference environments directly and remove 'option env=' syntax
config: i386-tinyconfig
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        git checkout af252189c051c6482cd81479ece4829e6c918d5c
        make ARCH=i386  tinyconfig
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> scripts/kconfig/zconf.tab.c:2483:10: fatal error: env.c: No such file or directory
    #include "env.c"
             ^~~~~~~
   compilation terminated.
   make[2]: *** [scripts/kconfig/zconf.tab.o] Error 1
   make[2]: Target 'oldconfig' not remade because of errors.
   make[1]: *** [oldconfig] Error 2
   make: *** [sub-make] Error 2
--
>> scripts/kconfig/zconf.tab.c:2483:10: fatal error: env.c: No such file or directory
    #include "env.c"
             ^~~~~~~
   compilation terminated.
   make[2]: *** [scripts/kconfig/zconf.tab.o] Error 1
   make[2]: Target 'oldnoconfig' not remade because of errors.
   make[1]: *** [oldnoconfig] Error 2
   make: *** [sub-make] Error 2
--
>> scripts/kconfig/zconf.tab.c:2483:10: fatal error: env.c: No such file or directory
    #include "env.c"
             ^~~~~~~
   compilation terminated.
   make[5]: *** [scripts/kconfig/zconf.tab.o] Error 1
   make[5]: Target 'allnoconfig' not remade because of errors.
   make[4]: *** [allnoconfig] Error 2
   make[3]: *** [__build_one_by_one] Error 2
   make[3]: Target 'allnoconfig' not remade because of errors.
   make[3]: Target 'tiny.config' not remade because of errors.
   make[2]: *** [tinyconfig] Error 2
   make[1]: *** [tinyconfig] Error 2
   make: *** [sub-make] Error 2

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
