Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33084 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750812AbdFVEdj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 00:33:39 -0400
Received: by mail-pf0-f195.google.com with SMTP id w12so1146382pfk.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 21:33:38 -0700 (PDT)
Date: Thu, 22 Jun 2017 14:33:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kbuild:thin-ar 5/8] ia64-linux-ld: warning: .note.gnu.build-id
 section discarded, --build-id ignored.
Message-ID: <20170622143327.32177b0a@roar.ozlabs.ibm.com>
In-Reply-To: <201706221136.76FjJsv8%fengguang.wu@intel.com>
References: <201706221136.76FjJsv8%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Alan Modra <amodra@gmail.com>

On Thu, 22 Jun 2017 11:48:38 +0800
kbuild test robot <fengguang.wu@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git thin-ar
> head:   f9aac183deb53716ea92f528595758e3c9ef3539
> commit: c5784ad98b773d08562a34b700e9c5e84763c0d8 [5/8] ia64: thin archives fix linking
> config: ia64-allnoconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 6.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout c5784ad98b773d08562a34b700e9c5e84763c0d8
>         # save the attached .config to linux build tree
>         make.cross ARCH=ia64 
> 
> All warnings (new ones prefixed by >>):
> 
> >> ia64-linux-ld: warning: .note.gnu.build-id section discarded, --build-id ignored.  


Sigh.

What's happening here is that when performing the final link with the
-R option, the linker forgets to emit the --build-id section it was
asked to.

This is the final link command line that causes the error:

$ ia64-linux-ld -static -R arch/ia64/kernel/gate-syms.o --build-id -o vmlinux -T ./arch/ia64/kernel/vmlinux.lds --whole-archive built-in.o --no-whole-archive --start-group lib/lib.a arch/ia64/lib/lib.a --end-group

However it links successfully if I do this:

$ ia64-linux/bin/ia64-linux-ld -r -R arch/ia64/kernel/gate-syms.o -o syms.o
$ ia64-linux/bin/ia64-linux-ld -static syms.o --build-id -o vmlinux -T ./arch/ia64/kernel/vmlinux.lds --whole-archive built-in.o --no-whole-archive --start-group lib/lib.a arch/ia64/lib/lib.a --end-group

I.e., create an intermediate object file with the symbols first using
symbols from gate-syms.o, and use that in the final link rather than -R

Alan do you have any idea what the problem might be here?

If it turns out to be a toolchain bug or limitation, I can do the same
workaround in the kernel.

Thanks,
Nick
