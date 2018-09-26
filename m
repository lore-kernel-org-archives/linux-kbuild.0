Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39581 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbeIZPKJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Sep 2018 11:10:09 -0400
Received: by mail-lf1-f66.google.com with SMTP id w21-v6so8538350lff.6
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Sep 2018 01:58:14 -0700 (PDT)
Subject: Re: [PATCH v8 02/10] Makefile: Prepare for using macros for inline
 asm
References: <20180918212847.199085-1-namit@vmware.com>
 <20180918212847.199085-3-namit@vmware.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <1aa5a1f3-ef3d-5cd3-831c-2202d73d3c9e@rasmusvillemoes.dk>
Date: Wed, 26 Sep 2018 10:58:11 +0200
MIME-Version: 1.0
In-Reply-To: <20180918212847.199085-3-namit@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org

On 2018-09-18 23:28, Nadav Amit wrote:

> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 8f6e7eb8ae9f..944fa3bc9376 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -214,8 +214,8 @@ ifdef CONFIG_X86_64
>  KBUILD_LDFLAGS += $(call ld-option, -z max-page-size=0x200000)
>  endif
>  
> -# Speed up the build
> -KBUILD_CFLAGS += -pipe
> +# We cannot use -pipe flag since we give an additional .s file to the compiler
> +#KBUILD_CFLAGS += -pipe

Is this really necessary? The gas manual says that one can use -- to
name stdin, though that's probably a typo and should just be - . Doing

gcc -pipe -Wa,foo.s -Wa,-

does seem to work as expected (and would also make it possible to append
some .s file should that ever be required).
>  
> +archmacros:
> +	$(Q)$(MAKE) $(build)=arch/x86/kernel arch/x86/kernel/macros.s
> +
> +ASM_MACRO_FLAGS = -Wa,arch/x86/kernel/macros.s
> +export ASM_MACRO_FLAGS
> +KBUILD_CFLAGS += $(ASM_MACRO_FLAGS)
How does this affect what gets rebuilt when one of the asm/foo.h files
going into macros.s changes? Does that cause a global rebuild because
everything depends on macros.s, or do we still only rebuild the files
that actually include asm/foo.h?

Rasmus
