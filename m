Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgD2HNx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 03:13:53 -0400
MIME-Version: 1.0
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com> <20200428221419.2530697-2-natechancellor@gmail.com>
In-Reply-To: <20200428221419.2530697-2-natechancellor@gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 29 Apr 2020 09:13:40 +0200
Message-ID: <CA+icZUXa3JBittjDVdNyV1M08dRt_pwACi2-0nLPEwao6yNABw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] kbuild: add CONFIG_LD_IS_LLD
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>

On Wed, Apr 29, 2020 at 12:14 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Similarly to the CC_IS_CLANG config, add LD_IS_LLD to avoid GNU ld
> specific logic such as ld-version or ld-ifversion and gain the
> ability to select potential features that depend on the linker at
> configuration time such as LTO.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> [nc: Reword commit message]
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

Testing on Debian/testing AMD64 (since Linux v5.3):
#1: LLVM/Clang/LLD version 9.0 and 10.0
#2: Debian's GCC 9.3 with ld.lld-9 and ld.lld-10

I am linking my Linux-kernels with ld.lld despite there are issues -
then check with ld.bfd.

- Sedat -

> ---
>
> v3 -> v4:
>
> * No changes.
>
> v2 -> v3:
>
> * Add Masahiro's ack.
>
> v1 -> v2:
>
> * No changes.
>
> Sami, please scream if you are unhappy with how I worded this commit.
>
>  init/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 9e22ee8fbd75e..c15ee42b82726 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -23,6 +23,9 @@ config LD_VERSION
>  config CC_IS_CLANG
>         def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
>
> +config LD_IS_LLD
> +       def_bool $(success,$(LD) -v | head -n 1 | grep -q LLD)
> +
>  config CLANG_VERSION
>         int
>         default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
>
> base-commit: 96c9a7802af7d500a582d89a8b864584fe878c1b
> --
> 2.26.2
>
