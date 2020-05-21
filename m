Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730280AbgEUUAQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 16:00:16 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32153C061A0E
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 13:00:16 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t16so3335478plo.7
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 13:00:16 -0700 (PDT)
Date: Thu, 21 May 2020 13:00:12 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2 4/9] x86: Makefile: Add build and config option for
 CONFIG_FG_KASLR
Message-ID: <202005211255.33E27D05@keescook>
References: <20200521165641.15940-1-kristen@linux.intel.com>
 <20200521165641.15940-5-kristen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521165641.15940-5-kristen@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kristen Carlson Accardi <kristen@linux.intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, arjan@linux.intel.com, linux-kernel@vger.kernel.org, kernel-hardening@lists.openwall.com, rick.p.edgecombe@intel.com, Tony Luck <tony.luck@intel.com>, linux-kbuild@vger.kernel.org

On Thu, May 21, 2020 at 09:56:35AM -0700, Kristen Carlson Accardi wrote:
> Allow user to select CONFIG_FG_KASLR if dependencies are met. Change
> the make file to build with -ffunction-sections if CONFIG_FG_KASLR
> 
> Signed-off-by: Kristen Carlson Accardi <kristen@linux.intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Tested-by: Tony Luck <tony.luck@intel.com>
> ---
>  Makefile         |  4 ++++
>  arch/x86/Kconfig | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 04f5662ae61a..28e515baa824 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -862,6 +862,10 @@ ifdef CONFIG_LIVEPATCH
>  KBUILD_CFLAGS += $(call cc-option, -flive-patching=inline-clone)
>  endif
>  
> +ifdef CONFIG_FG_KASLR
> +KBUILD_CFLAGS += -ffunction-sections
> +endif
> +
>  # arch Makefile may override CC so keep this after arch Makefile is included
>  NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 2d3f963fd6f1..50e83ea57d70 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2183,6 +2183,19 @@ config RANDOMIZE_BASE
>  
>  	  If unsure, say Y.
>  
> +config FG_KASLR
> +	bool "Function Granular Kernel Address Space Layout Randomization"
> +	depends on $(cc-option, -ffunction-sections)
> +	depends on RANDOMIZE_BASE && X86_64
> +	help
> +	  This option improves the randomness of the kernel text
> +	  over basic Kernel Address Space Layout Randomization (KASLR)
> +	  by reordering the kernel text at boot time. This feature
> +	  uses information generated at compile time to re-layout the
> +	  kernel text section at boot time at function level granularity.
> +
> +	  If unsure, say N.
> +
>  # Relocation on x86 needs some additional build support
>  config X86_NEED_RELOCS
>  	def_bool y

Kconfig bikeshedding: how about putting FG_KASLR in arch/Kconfig, add
a "depends on ARCH_HAS_FG_KASLR", and remove the arch-specific depends.

Then in arch/x86 have ARCH_HAS_FG_KASLR as a def_bool y with the
RANDOMIZE_BASE && X86_64 depends.

This will more cleanly split the build elements (compiler flags) from
the arch elements (64-bit x86, arch-specific flags, etc).

With that split out:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
