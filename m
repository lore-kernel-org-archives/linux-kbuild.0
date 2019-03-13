Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43345 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfCMINP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 04:13:15 -0400
Received: by mail-lf1-f68.google.com with SMTP id g7so749351lfh.10
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2019 01:13:13 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Add '-fno-builtin-bcmp' to CLANG_FLAGS
References: <20190312215203.27643-1-natechancellor@gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <80fb5b7f-42f9-4fd1-00cf-bfa7965ff8f7@rasmusvillemoes.dk>
Date: Wed, 13 Mar 2019 09:13:11 +0100
MIME-Version: 1.0
In-Reply-To: <20190312215203.27643-1-natechancellor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, clang-built-linux@googlegroups.com, stable@vger.kernel.org

On 12/03/2019 22.52, Nathan Chancellor wrote:
> After LLVM revision r355672 [1], all known working kernel configurations
> fail to link [2]:
> 
> ld: init/do_mounts.o: in function `prepare_namespace':
> do_mounts.c:(.init.text+0x5ca): undefined reference to `bcmp'
> ld: do_mounts.c:(.init.text+0x5e6): undefined reference to `bcmp'
> ld: init/initramfs.o: in function `do_header':
> initramfs.c:(.init.text+0x6e0): undefined reference to `bcmp'
> ld: initramfs.c:(.init.text+0x6f8): undefined reference to `bcmp'
> ld: arch/x86/kernel/setup.o: in function `setup_arch':
> setup.c:(.init.text+0x21d): undefined reference to `bcmp'
> 
> Commit 6edfba1b33c7 ("[PATCH] x86_64: Don't define string functions to
> builtin") removed '-ffreestanding' globally and the kernel doesn't
> provide a bcmp definition so the linker cannot find a reference to it.
>

> Fix this by explicitly telling LLVM through Clang not to emit bcmp
> references. This flag does not need to be behind 'cc-option' because all
> working versions of Clang support this flag.

Wouldn't it be better to just define bcmp as an alias for memcmp? They
seem to have compatible prototypes, and then somebody might someday sit
down and implement some word-at-a-time version of bcmp making use of the
weaker guarantees about the return value to gain some performance. But I
suppose that can also be done later.

Rasmus
