Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:56205 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752112AbeDOCZc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Apr 2018 22:25:32 -0400
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com [209.85.217.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w3F2PHnt016382
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Apr 2018 11:25:18 +0900
Received: by mail-ua0-f175.google.com with SMTP id n20so8040621ual.7
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Apr 2018 19:25:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201804132304.4gWZTHtV%fengguang.wu@intel.com>
References: <201804132304.4gWZTHtV%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 15 Apr 2018 11:24:36 +0900
Message-ID: <CAK7LNAQa4wRhDwVSm11hd8vzw3QBfqOdLXUw5Ho5=+N2RAzusw@mail.gmail.com>
Subject: Re: [kbuild:kconfig-shell-v3 21/30] arch/Kconfig:542: syntax error
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-04-14 0:12 GMT+09:00 kbuild test robot <lkp@intel.com>:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig-shell-v3
> head:   cab76bbc77d9c585f35b5b9289850a3ae64bb879
> commit: 403c3fc6b2e7499e92eafe0ab82b18172cd495f6 [21/30] stack-protector: test compiler capability in Kconfig and drop AUTO mode
> config: um-x86_64_defconfig
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout 403c3fc6b2e7499e92eafe0ab82b18172cd495f6
>         make ARCH=um SUBARCH=x86_64 defconfig
>         make ARCH=um SUBARCH=x86_64
>
> All errors (new ones prefixed by >>):
>
>>> arch/Kconfig:542: syntax error
>>> arch/Kconfig:541: invalid option
>    arch/Kconfig:547: syntax error
>    arch/Kconfig:546: invalid option
>    arch/Kconfig:571: syntax error
>    arch/Kconfig:570: invalid option
>    make[2]: *** [defconfig] Error 1
>    make[1]: *** [defconfig] Error 2
>    make: *** [sub-make] Error 2
> --
>>> arch/Kconfig:542: syntax error
>>> arch/Kconfig:541: invalid option
>    arch/Kconfig:547: syntax error
>    arch/Kconfig:546: invalid option
>    arch/Kconfig:571: syntax error
>    arch/Kconfig:570: invalid option
>    make[2]: *** [oldconfig] Error 1
>    make[1]: *** [oldconfig] Error 2
>    make: *** [sub-make] Error 2
> --
>>> arch/Kconfig:542: syntax error
>>> arch/Kconfig:541: invalid option
>    arch/Kconfig:547: syntax error
>    arch/Kconfig:546: invalid option
>    arch/Kconfig:571: syntax error
>    arch/Kconfig:570: invalid option
>    make[2]: *** [olddefconfig] Error 1
>    make[2]: Target 'oldnoconfig' not remade because of errors.
>    make[1]: *** [oldnoconfig] Error 2
>    make: *** [sub-make] Error 2
>

Thanks, I will squash the following fix-up.


diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
index 6a15c4d..d16eae3 100644
--- a/arch/x86/um/Kconfig
+++ b/arch/x86/um/Kconfig
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 mainmenu "User Mode Linux/$(SUBARCH) $(KERNELVERSION) Kernel Configuration"

+source "scripts/Kconfig.include"
+
 source "arch/um/Kconfig.common"

 menu "UML-specific options"



-- 
Best Regards
Masahiro Yamada
