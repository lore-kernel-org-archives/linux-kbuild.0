Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:37858 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFfD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:35:03 -0400
MIME-Version: 1.0
References: <20200423142354.312088-1-masahiroy@kernel.org>
In-Reply-To: <20200423142354.312088-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 May 2020 14:34:11 +0900
Message-ID: <CAK7LNAQH07KvoCgv5B8jUs+EUsJ167omM1U2AWHKdaAB+nAMCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] kbuild: use $(CC_VERSION_TEXT) to evaluate
 CC_IS_GCC and CC_IS_CLANG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Apr 23, 2020 at 11:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The result of '$(CC) --version | head -n 1' is already computed by the
> top Makefile, and stored in the environment variable, CC_VERSION_TEXT.
>
> 'echo' is probably less expensive than the two commands $(CC) and
> 'head' although this optimization is not noticeable level.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild.



> ---
>
> Changes in v2:
>   - new patch
>
>  init/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 9e22ee8fbd75..5f797df3f043 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -9,7 +9,7 @@ config DEFCONFIG_LIST
>         default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
>
>  config CC_IS_GCC
> -       def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)
> +       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q gcc)
>
>  config GCC_VERSION
>         int
> @@ -21,7 +21,7 @@ config LD_VERSION
>         default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
>
>  config CC_IS_CLANG
> -       def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
> +       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
>
>  config CLANG_VERSION
>         int
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200423142354.312088-1-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
