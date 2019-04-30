Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46125 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfD3HRI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 03:17:08 -0400
MIME-Version: 1.0
References: <20190430010037.6216-1-natechancellor@gmail.com>
In-Reply-To: <20190430010037.6216-1-natechancellor@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Apr 2019 09:16:50 +0200
Message-ID: <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>

On Tue, Apr 30, 2019 at 3:01 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
> point, it has not been used because -Wuninitialized has been disabled,
> which also turns off -Wsometimes-uninitialized, meaning that we miss out
> on finding some bugs [1]. In my experience, it appears to be more
> accurate than GCC and catch some things that GCC can't.
>
> All of these warnings have now been fixed in -next across arm, arm64,
> and x86_64 defconfig/allyesconfig so this should be enabled for everyone
> to prevent more from easily creeping in.
>
> As of next-20190429:
>
> $ git log --oneline --grep="sometimes-uninitialized" | wc -l
> 45
>
> [1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/381
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> Masahiro, I am not sure how you want to handle merging this with regards
> to all of the patches floating around in -next but I wanted to send this
> out to let everyone know this is ready to be turned on.
>
> Arnd, are there many remaning -Wsometimes-uninitialized warnings in
> randconfigs?

No, I don't see any with the patches that I submitted. I haven't checked
if there are any that still need to get merged into linux-next though.

> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 768306add591..f4332981ea85 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
>  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
>  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> +KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
>  endif
>  endif

This doesn't look right. Shouldn't you remove the line that turns off
-Wuninitilized
instead of adding only -Wsometimes-uninitialized?

If we warn about the instances that may or may not be wrong, we should
also warn about those that are provably wrong.

        Arnd
