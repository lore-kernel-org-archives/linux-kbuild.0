Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34977 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751738AbdGCMvf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jul 2017 08:51:35 -0400
Received: by mail-pf0-f195.google.com with SMTP id s66so25802505pfs.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Jul 2017 05:51:35 -0700 (PDT)
Date: Mon, 3 Jul 2017 22:51:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kbuild:thin-ar 11/12] undefined reference to
 `_GLOBAL_OFFSET_TABLE_'
Message-ID: <20170703225115.6d3084f7@roar.ozlabs.ibm.com>
In-Reply-To: <201707020907.hkcfbdSI%fengguang.wu@intel.com>
References: <201707020907.hkcfbdSI%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Simek <monstr@monstr.eu>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

On Sun, 2 Jul 2017 09:02:09 +0800
kbuild test robot <fengguang.wu@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git thin-ar
> head:   42317ea79d9af0a83b6cfdfe43c27a91d468bfb1
> commit: 799c43415442414b1032580c47684cb709dfed6d [11/12] kbuild: thin archives make default for all archs
> config: microblaze-allnoconfig (attached as .config)
> compiler: microblaze-linux-gcc (GCC) 6.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 799c43415442414b1032580c47684cb709dfed6d
>         # save the attached .config to linux build tree
>         make.cross ARCH=microblaze 
> 
> All errors (new ones prefixed by >>):
> 
>    mm/slub.o: In function `__slab_free.isra.13':
> >> (.text+0x1038): undefined reference to `_GLOBAL_OFFSET_TABLE_'  
>    scripts/link-vmlinux.sh: line 93: 23109 Segmentation fault      ${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2} -T ${lds} ${objects}

Maybe it is due to this bug:

https://sourceware.org/bugzilla/show_bug.cgi?id=21017

It seems to link correctly using the 2.23.52.20130512 binutils that
comes with kernel.org crosstool

https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.8.0/

If this is the case, I think it's because this linking is resulting
in better code (AFAICT GOTOFF  is preferable to GOT), so I think we
could just accept this as a bug in the toolchain version.

Thanks,
Nick
