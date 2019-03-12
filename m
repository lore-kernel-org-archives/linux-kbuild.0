Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39171 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfCLWzV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Mar 2019 18:55:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id i20so2894186pfo.6
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Mar 2019 15:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190312215203.27643-1-natechancellor@gmail.com>
In-Reply-To: <20190312215203.27643-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 12 Mar 2019 15:55:09 -0700
Message-ID: <CAKwvOdmVWrrVWeuh6efnwreS4kp1L_kJ-FbKVGux8ZdiqvYCDA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Add '-fno-builtin-bcmp' to CLANG_FLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, clang-built-linux@googlegroups.com, stable@vger.kernel.org

On Tue, Mar 12, 2019 at 2:53 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
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
>
> [1]: https://github.com/llvm/llvm-project/commit/8e16d73346f8091461319a7dfc4ddd18eedcff13
> [2]: https://travis-ci.com/ClangBuiltLinux/continuous-integration/builds/104027249
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/416
> Link: https://bugs.llvm.org/show_bug.cgi?id=41035
> Cc: stable@vger.kernel.org
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for this patch.  Can the maintainers please consider this an
emergency patch; without it, the recent change to LLVM has caused ALL
of our CI targets to go red.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 9ef547fc7ffe..6645a274b6e3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -501,6 +501,7 @@ ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  CLANG_FLAGS    += -no-integrated-as
> +CLANG_FLAGS    += -fno-builtin-bcmp
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> --
> 2.21.0
>


--
Thanks,
~Nick Desaulniers
