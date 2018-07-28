Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga18.intel.com ([134.134.136.126]:47380 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbeG1ItJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Jul 2018 04:49:09 -0400
Date: Sat, 28 Jul 2018 15:23:12 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [kbuild:kconfig2 1/10] arch/um/Kconfig:3: can't open file
 "arch/x86_64/um/Kconfig"
Message-ID: <201807281506.H8XSZLgK%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig2
head:   0e83fd903bc85173711186755591b61405647cf3
commit: 2cc1bfaf2c45056c73970a99c3a7467e157f56aa [1/10] um: stop abusing KBUILD_KCONFIG
config: um-x86_64_defconfig
compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
reproduce:
        git checkout 2cc1bfaf2c45056c73970a99c3a7467e157f56aa
        make ARCH=um SUBARCH=x86_64 defconfig
        make ARCH=um SUBARCH=x86_64

All errors (new ones prefixed by >>):

>> arch/um/Kconfig:3: can't open file "arch/x86_64/um/Kconfig"
   make[2]: *** [defconfig] Error 1
   make[1]: *** [defconfig] Error 2
   make: *** [sub-make] Error 2
--
>> arch/um/Kconfig:3: can't open file "arch/x86_64/um/Kconfig"
   make[2]: *** [oldconfig] Error 1
   make[1]: *** [oldconfig] Error 2
   make: *** [sub-make] Error 2
--
>> arch/um/Kconfig:3: can't open file "arch/x86_64/um/Kconfig"
   make[2]: *** [olddefconfig] Error 1
   make[1]: *** [olddefconfig] Error 2
   make: *** [sub-make] Error 2

vim +3 arch/um/Kconfig

     2	
   > 3	source "arch/$(SUBARCH)/um/Kconfig"

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
