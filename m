Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34699 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751429AbdFZBqa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Jun 2017 21:46:30 -0400
Received: by mail-pf0-f194.google.com with SMTP id d5so16209719pfe.1
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jun 2017 18:46:30 -0700 (PDT)
Date: Mon, 26 Jun 2017 11:46:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kbuild:thin-ar 10/10] frv-linux-ld: Warning: size of symbol
 `sys_bpf' changed from 40 in kernel/sys_ni.o to 1800 in
 kernel/bpf/syscall.o
Message-ID: <20170626114615.30e2a72d@roar.ozlabs.ibm.com>
In-Reply-To: <201706251957.uG7LtWSJ%fengguang.wu@intel.com>
References: <201706251957.uG7LtWSJ%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, dhowells@redhat.com

On Sun, 25 Jun 2017 19:29:14 +0800
kbuild test robot <fengguang.wu@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git thin-ar
> head:   e7238f4fac14967bba823ef4b4b77ee928a4860a
> commit: e7238f4fac14967bba823ef4b4b77ee928a4860a [10/10] kbuild: thin archives make default for all archs
> config: frv-allmodconfig (attached as .config)
> compiler: frv-linux-gcc (GCC) 6.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout e7238f4fac14967bba823ef4b4b77ee928a4860a
>         # save the attached .config to linux build tree
>         make.cross ARCH=frv 
> 
> All warnings (new ones prefixed by >>):

[snip]

>    frv-linux-ld: Warning: size of symbol `sys_eventfd' changed from 40 in kernel/sys_ni.o to 44 in fs/eventfd.o
> >> frv-linux-ld: Warning: size of symbol `sys_userfaultfd' changed from 40 in kernel/sys_ni.o to 356 in fs/userfaultfd.o  
>    frv-linux-ld: Warning: size of symbol `sys_io_setup' changed from 40 in kernel/sys_ni.o to 2636 in fs/aio.o

These warnings also happen with incremental linking and must be due to
some bug in the arch port or toolchain.

>    init/main.o: In function `do_one_initcall':
>    init/main.c:792:(.text+0x1b8): relocation truncated to fit: R_FRV_GPREL12 against symbol `initcall_debug' defined in .sbss section in init/main.o

[snip]

These aren't new either, and due to the large allmodconfig kernel.

So none of this is newly caused by the thin archives patch.

