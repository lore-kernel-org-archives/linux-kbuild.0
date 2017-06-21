Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33606 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751884AbdFUGpM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 02:45:12 -0400
Received: by mail-pf0-f195.google.com with SMTP id w12so27922640pfk.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jun 2017 23:45:07 -0700 (PDT)
Date: Wed, 21 Jun 2017 16:44:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kbuild:thin-ar 6/6] arch/tile/kernel/signal.c:181: undefined
 reference to `__vdso_rt_sigreturn'
Message-ID: <20170621164451.1fc47e0d@roar.ozlabs.ibm.com>
In-Reply-To: <201706211350.mC5QFFxU%fengguang.wu@intel.com>
References: <201706211350.mC5QFFxU%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

On Wed, 21 Jun 2017 13:56:55 +0800
kbuild test robot <fengguang.wu@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git thin-ar
> head:   0bae3a17f25c189d5d6ddece12a1a9d1a9040cc2
> commit: 0bae3a17f25c189d5d6ddece12a1a9d1a9040cc2 [6/6] kbuild: thin archives make default for all archs
> config: tile-tilegx_defconfig (attached as .config)
> compiler: tilegx-linux-gcc (GCC) 4.6.2
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 0bae3a17f25c189d5d6ddece12a1a9d1a9040cc2
>         # save the attached .config to linux build tree
>         make.cross ARCH=tile 
> 
> All errors (new ones prefixed by >>):
> 
>    arch/tile/kernel/signal.o: In function `setup_rt_frame':
> >> arch/tile/kernel/signal.c:181: undefined reference to `__vdso_rt_sigreturn'  
>    arch/tile/kernel/signal.c:182: undefined reference to `__vdso_rt_sigreturn'
> >> arch/tile/kernel/signal.c:181: undefined reference to `__vdso_rt_sigreturn'  
>    arch/tile/kernel/stack.o: In function `is_sigreturn':
> >> arch/tile/kernel/stack.c:128: undefined reference to `__vdso_rt_sigreturn'
> >> arch/tile/kernel/stack.c:128: undefined reference to `__vdso_rt_sigreturn'  
>    arch/tile/kernel/stack.o:arch/tile/kernel/stack.c:127: more undefined references to `__vdso_rt_sigreturn' follow

This requires the same fix as for arch/sh

Now that I do a proper grep, it looks like ia64 may require the same as
well. I will do some more testing and submit those.

Thanks,
Nick
