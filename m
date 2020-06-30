Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbgF3VOK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 17:14:10 -0400
Date: Tue, 30 Jun 2020 14:14:07 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: fix CONFIG_CC_CAN_LINK(_STATIC) for
 cross-compilation with Clang
Message-ID: <20200630211407.GA4163361@ubuntu-s3-xlarge-x86>
References: <20200630150625.12056-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630150625.12056-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

On Wed, Jul 01, 2020 at 12:06:24AM +0900, Masahiro Yamada wrote:
> scripts/cc-can-link.sh tests if the compiler can link userspace
> programs.
> 
> When $(CC) is GCC, it is checked against the target architecture
> because the toolchain prefix is specified as a part of $(CC).
> 
> When $(CC) is Clang, it is checked against the host architecture
> because --target option is missing.
> 
> Pass $(CLANG_FLAGS) to scripts/cc-can-link.sh to evaluate the link
> capability for the target architecture.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
> Changes in v2:
>   - New patch
> 
>  init/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index a46aa8f3174d..d0313e7725fa 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -49,13 +49,13 @@ config CLANG_VERSION
>  
>  config CC_CAN_LINK
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(m32-flag))
> +	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> +	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>  
>  config CC_CAN_LINK_STATIC
>  	bool
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m64-flag)) if 64BIT
> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) -static $(m32-flag))
> +	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) -static $(m64-flag)) if 64BIT
> +	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) -static $(m32-flag))
>  
>  config CC_HAS_ASM_GOTO
>  	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> -- 
> 2.25.1
> 
