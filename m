Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:51012 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932948AbaLKBqT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Dec 2014 20:46:19 -0500
Date: Thu, 11 Dec 2014 10:46:11 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: trivial - fix the help doc of CONFIG_CC_OPTIMIZE_FOR_SIZE
In-Reply-To: <1407217387-23479-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1407217387-23479-1-git-send-email-yamada.m@jp.panasonic.com>
Message-Id: <20141211104609.A487.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org

Hi Michal,

Does this seem OK?



On Tue,  5 Aug 2014 14:43:07 +0900
Masahiro Yamada <yamada.m@jp.panasonic.com> wrote:

> Other than GCC, we have another choice, Clang for building the kernel
> these days.  It seems better to say "compiler" rather than "gcc".
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  init/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 41066e4..7bc7c05 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1259,8 +1259,8 @@ endif
>  config CC_OPTIMIZE_FOR_SIZE
>  	bool "Optimize for size"
>  	help
> -	  Enabling this option will pass "-Os" instead of "-O2" to gcc
> -	  resulting in a smaller kernel.
> +	  Enabling this option will pass "-Os" instead of "-O2" to
> +	  your compiler resulting in a smaller kernel.
>  
>  	  If unsure, say N.
>  
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


