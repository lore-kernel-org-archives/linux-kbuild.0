Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f50.google.com ([209.85.208.50]:43633 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbfBGVVc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Feb 2019 16:21:32 -0500
Received: by mail-ed1-f50.google.com with SMTP id f9so1071324eds.10
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Feb 2019 13:21:31 -0800 (PST)
Date: Thu, 7 Feb 2019 14:21:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: CONFIG_CC_IS_CLANG
Message-ID: <20190207212128.GA30269@archlinux-ryzen>
References: <CAKwvOdkkJ48d_a1K-LPRsTweDXgpGX51NH=nuWK5weNfQ_8RBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkkJ48d_a1K-LPRsTweDXgpGX51NH=nuWK5weNfQ_8RBw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Feb 07, 2019 at 01:03:01PM -0800, Nick Desaulniers wrote:
> Masahiro,
> I was looking into sprucing up Kbuild for improved LLD support.  One
> thing I was curious about was the different checks for clang in the
> top level Makefile.
> 
> How come a change like:
> diff --git a/Makefile b/Makefile
> index 3142e67d03f1..525b3fef7d27 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -489,7 +489,7 @@ ifneq ($(KBUILD_SRC),)
>   $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
>  endif
> 
> -ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> +ifdef CONFIG_CC_IS_CLANG
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS := --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> 
> 
> doesn't work?  It's odd that later on in the top level Makefile, we
> have that kind of check.  I was hoping to do something similar for
> LLD, but it seems that the config options are not defined for that
> particular make target?  Does this have to do with config-targets?
> 
> -- 
> Thanks,
> ~Nick Desaulniers

According to commit 995167420797 ("kbuild: remove cc-name variable"), it
says that this section of the Makefile runs before Kconfig. Masahiro can
obviously give more context and explanation.

Nathan
