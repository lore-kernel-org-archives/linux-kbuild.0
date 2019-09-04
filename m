Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61649 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfIDGJu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 02:09:50 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x8469Y6w030586
        for <linux-kbuild@vger.kernel.org>; Wed, 4 Sep 2019 15:09:35 +0900
Received: by mail-vs1-f50.google.com with SMTP id y62so12994768vsb.6
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2019 23:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <201909041423.tfn4I8cY%lkp@intel.com>
In-Reply-To: <201909041423.tfn4I8cY%lkp@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 4 Sep 2019 15:08:58 +0900
Message-ID: <CAK7LNARUnkc2qimXzLuyk74NLyx6bCkgr49p3m-Cjbe8eg6-Hw@mail.gmail.com>
Subject: Re: [kbuild:kbuild 51/57] scripts/mkuboot.sh: 20: scripts/mkuboot.sh:
 -path:: not found
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Sep 4, 2019 at 3:01 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   10dd50d6bdbada801cc8da64558e77b683fa17e2
> commit: 1d99a66e29e339196aecd3acd6d8b6acd38bb8a6 [51/57] kbuild: add $(BASH) to run scripts with bash-extension
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 1d99a66e29e339196aecd3acd6d8b6acd38bb8a6
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=mips
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> scripts/mkuboot.sh: 20: scripts/mkuboot.sh: -path:: not found


I will fix it up as follows. Thanks.

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 41c50f9461e5..2d72327417a9 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -374,7 +374,7 @@ UIMAGE_ENTRYADDR ?= $(UIMAGE_LOADADDR)
 UIMAGE_NAME ?= 'Linux-$(KERNELRELEASE)'

 quiet_cmd_uimage = UIMAGE  $@
-      cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
+      cmd_uimage = $(BASE) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
                        -C $(UIMAGE_COMPRESSION) $(UIMAGE_OPTS-y) \
                        -T $(UIMAGE_TYPE) \
                        -a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \




-- 
Best Regards
Masahiro Yamada
