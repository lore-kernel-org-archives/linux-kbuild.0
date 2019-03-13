Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39531 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfCMNow (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 09:44:52 -0400
Date: Wed, 13 Mar 2019 06:44:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] Makefile: Add '-fno-builtin-bcmp' to CLANG_FLAGS
Message-ID: <20190313134447.GA19066@archlinux-ryzen>
References: <20190312215203.27643-1-natechancellor@gmail.com>
 <80fb5b7f-42f9-4fd1-00cf-bfa7965ff8f7@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80fb5b7f-42f9-4fd1-00cf-bfa7965ff8f7@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, clang-built-linux@googlegroups.com, stable@vger.kernel.org

On Wed, Mar 13, 2019 at 09:13:11AM +0100, Rasmus Villemoes wrote:
> On 12/03/2019 22.52, Nathan Chancellor wrote:
> > After LLVM revision r355672 [1], all known working kernel configurations
> > fail to link [2]:
> > 
> > ld: init/do_mounts.o: in function `prepare_namespace':
> > do_mounts.c:(.init.text+0x5ca): undefined reference to `bcmp'
> > ld: do_mounts.c:(.init.text+0x5e6): undefined reference to `bcmp'
> > ld: init/initramfs.o: in function `do_header':
> > initramfs.c:(.init.text+0x6e0): undefined reference to `bcmp'
> > ld: initramfs.c:(.init.text+0x6f8): undefined reference to `bcmp'
> > ld: arch/x86/kernel/setup.o: in function `setup_arch':
> > setup.c:(.init.text+0x21d): undefined reference to `bcmp'
> > 
> > Commit 6edfba1b33c7 ("[PATCH] x86_64: Don't define string functions to
> > builtin") removed '-ffreestanding' globally and the kernel doesn't
> > provide a bcmp definition so the linker cannot find a reference to it.
> >
> 
> > Fix this by explicitly telling LLVM through Clang not to emit bcmp
> > references. This flag does not need to be behind 'cc-option' because all
> > working versions of Clang support this flag.
> 
> Wouldn't it be better to just define bcmp as an alias for memcmp? They
> seem to have compatible prototypes, and then somebody might someday sit
> down and implement some word-at-a-time version of bcmp making use of the
> weaker guarantees about the return value to gain some performance. But I
> suppose that can also be done later.
> 
> Rasmus

Hi Rasmus,

Thank you much for the review, I didn't even realize this was possible :)

I'd certainly like to explore it as that is what glibc does. How would
you suggest going about it here?

Thanks,
Nathan
