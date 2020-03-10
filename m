Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41021 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgCJPqj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 11:46:39 -0400
Date: Tue, 10 Mar 2020 08:46:36 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 1/2] kconfig: introduce m32-flag and m64-flag
Message-ID: <20200310154636.GA24694@ubuntu-m2-xlarge-x86>
References: <20200310101250.22374-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310101250.22374-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, George Spelvin <lkml@sdf.org>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Tue, Mar 10, 2020 at 07:12:49PM +0900, Masahiro Yamada wrote:
> When a compiler supports multiple architectures, some compiler features
> can be dependent on the target architecture.
> 
> This is typical for Clang, which supports multiple LLVM backends.
> Even for GCC, we need to take care of biarch compiler cases.
> 
> It is not a problem when we evaluate cc-option in Makefiles because
> cc-option is tested against the flag in question + $(KBUILD_CFLAGS).
> 
> The cc-option in Kconfig, on the other hand, does not accumulate
> tested flags. Due to this simplification, it could potentially test
> cc-option against a different target.
> 
> At first, Kconfig always evaluated cc-option against the host
> architecture.
> 
> Since commit e8de12fb7cde ("kbuild: Check for unknown options with
> cc-option usage in Kconfig and clang"), in case of cross-compiling
> with Clang, the target triple is correctly passed to Kconfig.
> 
> The case with biarch GCC (and native build with Clang) is still not
> handled properly. We need to pass some flags to specify the target
> machine bit.
> 
> Due to the design, all the macros in Kconfig are expanded in the
> parse stage, where we do not know the target bit size yet.
> 
> For example, arch/x86/Kconfig allows a user to toggle CONFIG_64BIT.
> If a compiler flag -foo depends on the machine bit, it must be tested
> twice, one with -m32 and the other with -m64.
> 
> However, -m32/-m64 are not always recognized. So, this commits adds
> m64-flag and m32-flag macros. They expand to -m32, -m64, respectively
> if supported. Or, they expand to an empty string if unsupported.
> 
> The typical usage is like this:
> 
>   config FOO
>           bool
>           default $(cc-option,$(m64-flag) -foo) if 64BIT
>           default $(cc-option,$(m32-flag) -foo)
> 
> This is clumsy, but there is no elegant way to handle this in the
> current static macro expansion.
> 
> There was discussion for static functions vs dynamic functions.
> The consensus was to go as far as possible with the static functions.
> (https://lkml.org/lkml/2018/3/2/22)
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Kconfig.include | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 85334dc8c997..496d11c92c97 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -44,3 +44,10 @@ $(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supporte
>  
>  # gcc version including patch level
>  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
> +
> +# machine bit flags
> +#  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
> +#  $(m64-flag): -m64 if the compiler supports it, or an empty string otherwise.
> +cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
> +m32-flag := $(cc-option-bit,-m32)
> +m64-flag := $(cc-option-bit,-m64)
> -- 
> 2.17.1

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
