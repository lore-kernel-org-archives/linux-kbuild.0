Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:24218 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbeK2NCo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Nov 2018 08:02:44 -0500
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id wAT1wmlb024797
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Nov 2018 10:58:48 +0900
Received: by mail-vk1-f173.google.com with SMTP id w72so75355vkd.5
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Nov 2018 17:58:48 -0800 (PST)
MIME-Version: 1.0
References: <201811271709.pD0m16c2%fengguang.wu@intel.com>
In-Reply-To: <201811271709.pD0m16c2%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 29 Nov 2018 10:58:11 +0900
Message-ID: <CAK7LNARQL_CmXek4+Dzy-ZZrpA6tv6qj3bC6AoJCUQjMqrutRw@mail.gmail.com>
Subject: Re: [kbuild:kbuild 24/24] cc1: error: cannot load plugin ./scripts/gcc-plugins/randomize_layout_plugin.so
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Nov 27, 2018 at 6:38 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   9645b546a2d7d726770f2fd301108c732b707d33
> commit: 9645b546a2d7d726770f2fd301108c732b707d33 [24/24] kbuild: descend into scripts/gcc-plugins/ via scripts/Makefile
> config: um-allyesconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout 9645b546a2d7d726770f2fd301108c732b707d33
>         # save the attached .config to linux build tree
>         make ARCH=um
>
> All errors (new ones prefixed by >>):
>
> >> cc1: error: cannot load plugin ./scripts/gcc-plugins/randomize_layout_plugin.so
>       ./scripts/gcc-plugins/randomize_layout_plugin.so: file too short
>    make[2]: *** [arch/x86/um/user-offsets.s] Error 1
>    make[1]: *** [arch/x86/um/user-offsets.s] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [sub-make] Error 2


I will fix it, but I do not think this is a new error.

The parallel building for ARCH=um + CONFIG_GCC_PLUGINS
has been broken already for a long time.



> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Best Regards
Masahiro Yamada
