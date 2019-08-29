Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18257 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbfH2TEK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 15:04:10 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x7TJ3pH3029664
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Aug 2019 04:03:52 +0900
Received: by mail-ua1-f47.google.com with SMTP id g11so1536648uak.0
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Aug 2019 12:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <201908300201.6bXAplRQ%lkp@intel.com>
In-Reply-To: <201908300201.6bXAplRQ%lkp@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 30 Aug 2019 04:03:14 +0900
Message-ID: <CAK7LNAQTXaMbjLxfNjikRDWUCa4DRotnCizUNm7gZ8k1P1E1tA@mail.gmail.com>
Subject: Re: [kbuild:kbuild 48/54] arch/powerpc/kernel/prom_init_check.sh: 36:
 arch/powerpc/kernel/prom_init_check.sh: Syntax error: "(" unexpected
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Aug 30, 2019 at 3:47 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   d24121b576497d25a5b53fa78e6789ce8ca413cc
> commit: 51af17b8434f10a5881fc6fde4fa2c41df59c287 [48/54] kbuild: add $(BASH) to run scripts with bash-extension
> config: powerpc-defconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 51af17b8434f10a5881fc6fde4fa2c41df59c287
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/powerpc/kernel/prom_init_check.sh: 36: arch/powerpc/kernel/prom_init_check.sh: Syntax error: "(" unexpected

I will remove 'function' to fix this.

Thanks.


> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Best Regards
Masahiro Yamada
