Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:51731 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726056AbeG1IqR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Jul 2018 04:46:17 -0400
Date: Sat, 28 Jul 2018 15:20:25 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [kbuild:kconfig2 1/10] arch/um/Kconfig:3: can't open file
 "arch/i386/um/Kconfig"
Message-ID: <201807281523.dKyY3UDA%fengguang.wu@intel.com>
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
config: um-i386_defconfig
compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
reproduce:
        git checkout 2cc1bfaf2c45056c73970a99c3a7467e157f56aa
        make ARCH=um SUBARCH=i386 defconfig
        make ARCH=um SUBARCH=i386

All errors (new ones prefixed by >>):

>> arch/um/Kconfig:3: can't open file "arch/i386/um/Kconfig"
   make[2]: *** [defconfig] Error 1
   make[1]: *** [defconfig] Error 2
   make: *** [sub-make] Error 2
--
>> arch/um/Kconfig:3: can't open file "arch/i386/um/Kconfig"
   make[2]: *** [oldconfig] Error 1
   make[1]: *** [oldconfig] Error 2
   make: *** [sub-make] Error 2
--
>> arch/um/Kconfig:3: can't open file "arch/i386/um/Kconfig"
   make[2]: *** [olddefconfig] Error 1
   make[1]: *** [olddefconfig] Error 2
   make: *** [sub-make] Error 2

vim +3 arch/um/Kconfig

     2	
   > 3	source "arch/$(SUBARCH)/um/Kconfig"

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
