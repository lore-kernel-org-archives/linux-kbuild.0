Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:2233 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750761AbeDMPcr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Apr 2018 11:32:47 -0400
Date: Fri, 13 Apr 2018 23:31:54 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [kbuild:kconfig-shell-v3 22/30] init/Kconfig:13: syntax error
Message-ID: <201804132351.x6lmD1n5%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org, Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig-shell-v3
head:   cab76bbc77d9c585f35b5b9289850a3ae64bb879
commit: 84294f5d45d06dbee61099077fe25ac646b77bcf [22/30] kconfig: add CC_IS_GCC and GCC_VERSION
config: um-x86_64_defconfig
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        git checkout 84294f5d45d06dbee61099077fe25ac646b77bcf
        make ARCH=um SUBARCH=x86_64 defconfig
        make ARCH=um SUBARCH=x86_64

All errors (new ones prefixed by >>):

>> init/Kconfig:13: syntax error
>> init/Kconfig:12: invalid option
   arch/Kconfig:542: syntax error
   arch/Kconfig:541: invalid option
   arch/Kconfig:547: syntax error
   arch/Kconfig:546: invalid option
   arch/Kconfig:571: syntax error
   arch/Kconfig:570: invalid option
   make[2]: *** [defconfig] Error 1
   make[1]: *** [defconfig] Error 2
   make: *** [sub-make] Error 2
--
>> init/Kconfig:13: syntax error
>> init/Kconfig:12: invalid option
   arch/Kconfig:542: syntax error
   arch/Kconfig:541: invalid option
   arch/Kconfig:547: syntax error
   arch/Kconfig:546: invalid option
   arch/Kconfig:571: syntax error
   arch/Kconfig:570: invalid option
   make[2]: *** [oldconfig] Error 1
   make[1]: *** [oldconfig] Error 2
   make: *** [sub-make] Error 2
--
>> init/Kconfig:13: syntax error
>> init/Kconfig:12: invalid option
   arch/Kconfig:542: syntax error
   arch/Kconfig:541: invalid option
   arch/Kconfig:547: syntax error
   arch/Kconfig:546: invalid option
   arch/Kconfig:571: syntax error
   arch/Kconfig:570: invalid option
   make[2]: *** [olddefconfig] Error 1
   make[2]: Target 'oldnoconfig' not remade because of errors.
   make[1]: *** [oldnoconfig] Error 2
   make: *** [sub-make] Error 2

vim +13 init/Kconfig

  > 12		def_bool $(success $(CC) --version | grep -q gcc)
  > 13	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
