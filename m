Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45691 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728728AbfHOUpe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 16:45:34 -0400
Date: Thu, 15 Aug 2019 13:45:29 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
Message-ID: <20190815204529.GA69414@archlinux-threadripper>
References: <20190815182029.197604-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815182029.197604-1-nhuck@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, joe@perches.com, miguel.ojeda.sandonis@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

On Thu, Aug 15, 2019 at 11:20:29AM -0700, 'Nathan Huckleberry' via Clang Built Linux wrote:
> Clang is updating to support -Wimplicit-fallthrough on C
> https://reviews.llvm.org/D64838. Since clang does not
> support the comment version of fallthrough annotations
> this update causes an additional 50k warnings. Most
> of these warnings (>49k) are duplicates from header files.
> 
> This patch is intended to be reverted after the warnings
> have been cleaned up.
> 
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
>  Makefile                   | 4 ++++
>  scripts/Makefile.extrawarn | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 1b23f95db176..93b9744e66a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -846,7 +846,11 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  KBUILD_CFLAGS += -Wdeclaration-after-statement
>  
>  # Warn about unmarked fall-throughs in switch statement.
> +# If the compiler is clang, this warning is only enabled if W=1 in
> +# Makefile.extrawarn
> +ifndef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
> +endif
>  
>  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
>  KBUILD_CFLAGS += -Wvla
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index a74ce2e3c33e..e12359d69bb7 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -30,6 +30,9 @@ warning-1 += $(call cc-option, -Wunused-but-set-variable)
>  warning-1 += $(call cc-option, -Wunused-const-variable)
>  warning-1 += $(call cc-option, -Wpacked-not-aligned)
>  warning-1 += $(call cc-option, -Wstringop-truncation)
> +ifdef CONFIG_CC_IS_CLANG
> +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)

Shouldn't this be warning-1?

> +endif
>  # The following turn off the warnings enabled by -Wextra
>  warning-1 += -Wno-missing-field-initializers
>  warning-1 += -Wno-sign-compare
> -- 
> 2.23.0.rc1.153.gdeed80330f-goog
> 

I am still not a huge fan of the CONFIG_CC_IS_CLANG ifdefs but I don't
really see a much cleaner way to get around this. Some that come to
mind:

* Leave Makefile alone and add

KBUILD_CFLAGS += -Wno-implicit-fallthrough

in the CONFIG_CC_IS_CLANG section of scripts/Makefile.extrawarn

* Revert commit bfd77145f35c ("Makefile: Convert -Wimplicit-fallthrough=3
to just -Wimplicit-fallthrough for clang") for the time being and just
rely on adding -Wimplicit-fallthrough to KCFLAGS for testing.

Regardless:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
