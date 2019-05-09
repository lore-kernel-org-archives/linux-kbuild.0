Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35865 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbfEIHGl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 03:06:41 -0400
MIME-Version: 1.0
References: <20190509064455.1173-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509064455.1173-1-yamada.masahiro@socionext.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 9 May 2019 09:06:27 +0200
Message-ID: <CA+icZUX_AgZdH5Z+1+k+oVdYSo7vqzeJsGPndb_Sa8VOSk_yOg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Thu, May 9, 2019 at 8:45 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> We do not support old Clang versions. Upgrade your clang version
> if any of these flags is unsupported.
>
> Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> except -fcatch-undefined-behavior.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Looks good to me.

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

Just as sidenote:
I experimented with a snapshot version of clang-9 and lld-9 and could
build, link and boot on bare-metal with '-mglobal-merge' on
Debian/buster AMD64.
But forgot to document in [1].

[1] https://github.com/ClangBuiltLinux/linux/issues/431

> ---
>
>  Makefile                   | 10 +++++-----
>  scripts/Makefile.extrawarn | 12 ++++++------
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index bd7ae11947cb..c71ffb6f55b5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -731,15 +731,15 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
>  KBUILD_CFLAGS += $(stackp-flags-y)
>
>  ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> -KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> +KBUILD_CPPFLAGS += -Qunused-arguments
> +KBUILD_CFLAGS += -Wno-format-invalid-specifier
> +KBUILD_CFLAGS += -Wno-gnu
>  # Quiet clang warning: comparison of unsigned expression < 0 is always false
> -KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> +KBUILD_CFLAGS += -Wno-tautological-compare
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>  # See modpost pattern 2
> -KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> +KBUILD_CFLAGS += -mno-global-merge
>  KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
>  else
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 768306add591..523c4cafe2dc 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -66,11 +66,11 @@ KBUILD_CFLAGS += $(warning)
>  else
>
>  ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format)
> -KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> -KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> +KBUILD_CFLAGS += -Wno-initializer-overrides
> +KBUILD_CFLAGS += -Wno-unused-value
> +KBUILD_CFLAGS += -Wno-format
> +KBUILD_CFLAGS += -Wno-sign-compare
> +KBUILD_CFLAGS += -Wno-format-zero-length
> +KBUILD_CFLAGS += -Wno-uninitialized
>  endif
>  endif
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190509064455.1173-1-yamada.masahiro%40socionext.com.
> For more options, visit https://groups.google.com/d/optout.
