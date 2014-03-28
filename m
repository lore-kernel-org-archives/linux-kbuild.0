Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:55042 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751077AbaC1HGM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Mar 2014 03:06:12 -0400
Date: Fri, 28 Mar 2014 16:05:58 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] arm, kbuild: Do not define "comma" twice
In-Reply-To: <1386902233-6280-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1386902233-6280-1-git-send-email-yamada.m@jp.panasonic.com>
Message-Id: <20140328160558.DB4D.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi Michal,

Does this patch look good?
Any problem? Or should I have sent it to arm-kernel, not linux-kbuild ML?

Thanks.

Masahiro Yamada



On Fri, 13 Dec 2013 11:37:13 +0900
Masahiro Yamada <yamada.m@jp.panasonic.com> wrote:

> We have the definition of "comma" in scripts/Kbuild.include.
> We should not double it.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  arch/arm/Makefile   | 2 --
>  arch/arm64/Makefile | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index db50b62..60351d2 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -53,8 +53,6 @@ AS		+= -EL
>  LD		+= -EL
>  endif
>  
> -comma = ,
> -
>  # This selects which instruction set is used.
>  # Note that GCC does not numerically define an architecture version
>  # macro, but instead defines a whole series of macros which makes
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index d90cf79..75c5527 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -24,8 +24,6 @@ KBUILD_CPPFLAGS	+= -mlittle-endian
>  AS		+= -EL
>  LD		+= -EL
>  
> -comma = ,
> -
>  CHECKFLAGS	+= -D__aarch64__
>  
>  # Default value
> -- 
> 1.8.3.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


