Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49771 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfGCXq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jul 2019 19:46:28 -0400
MIME-Version: 1.0
References: <20190627191448.110756-1-natechancellor@gmail.com>
In-Reply-To: <20190627191448.110756-1-natechancellor@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 4 Jul 2019 08:45:46 +0900
Message-ID: <CAK7LNATekKUTPvx4ywj_8yDLR8=Awmo6JKj5b-FBBF=EE+S-nw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add ability to test Clang's integrated assembler
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Dmitry Golovin <dima@golovin.in>

On Fri, Jun 28, 2019 at 4:15 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> There are some people interested in experimenting with Clang's
> integrated assembler. To make it easy to do so without source
> modification, allow the user to specify 'AS=clang' as part of the
> make command to avoid adding '-no-integrated-as' to the {A,C}FLAGS.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/577
> Suggested-by: Dmitry Golovin <dima@golovin.in>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied to linux-kbuild. Thanks.



> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 5102b2bbd224..d77481129339 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -527,7 +527,9 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> +ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
>  CLANG_FLAGS    += -no-integrated-as
> +endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
> --
> 2.22.0
>


--
Best Regards
Masahiro Yamada
