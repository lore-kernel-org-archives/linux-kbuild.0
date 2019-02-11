Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18510 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390340AbfBKPGL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 10:06:11 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x1BF64eO032046
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Feb 2019 00:06:05 +0900
Received: by mail-vs1-f42.google.com with SMTP id b20so5108143vsl.9
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 07:06:05 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOdkkJ48d_a1K-LPRsTweDXgpGX51NH=nuWK5weNfQ_8RBw@mail.gmail.com>
In-Reply-To: <CAKwvOdkkJ48d_a1K-LPRsTweDXgpGX51NH=nuWK5weNfQ_8RBw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Feb 2019 00:05:27 +0900
Message-ID: <CAK7LNATD_4vVK-iKFgM1YrrGDdbMV+givsxS4w=YABnri_WS4Q@mail.gmail.com>
Subject: Re: CONFIG_CC_IS_CLANG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Feb 8, 2019 at 6:04 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
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

include/config/auto.conf is included at line 594 of top Makefile.

'ifdef CONFIG_CC_IS_CLANG' is always false here.




-- 
Best Regards
Masahiro Yamada
