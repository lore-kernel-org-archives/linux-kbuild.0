Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:38252 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750749AbdCNFXc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2017 01:23:32 -0400
MIME-Version: 1.0
In-Reply-To: <20170201230425.GA75891@beast>
References: <20170201230425.GA75891@beast>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Mar 2017 14:23:21 +0900
Message-ID: <CAK7LNAQROQ=Gp_-fXf7nkEESKrXqSHRp10rkYxL3+NkcHdO3vA@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: support designated_init attribute
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Kees,


2017-02-02 8:04 GMT+09:00 Kees Cook <keescook@chromium.org>:
> If a structure is marked with __attribute__((designated_init)) from
> GCC or Sparse, it needs to have all static initializers using designated
> initialization. Fail the build for any missing cases. This attribute will
> be used by the randstruct plugin to make sure randomized structures are
> being correctly initialized.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 96b27a888285..d4e0550e7abd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -793,6 +793,9 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
>  # enforce correct pointer usage
>  KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
>
> +# Require designated initializers for all marked structures
> +KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
> +
>  # use the deterministic mode of AR if available
>  KBUILD_ARFLAGS := $(call ar-option,D)
>


The code looks OK to me.

As far as I understood, this patch changes
designated-init warnings into errors.  Correct?

If so, I think the commit subject "Kbuild: support designated_init attribute"
does not directly describe what this patch does.




-- 
Best Regards
Masahiro Yamada
