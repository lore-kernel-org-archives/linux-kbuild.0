Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:38159 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751359AbaE0Dya (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 May 2014 23:54:30 -0400
Date: Tue, 27 May 2014 12:54:16 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: do not add "selinux" to subdir- twice
In-Reply-To: <1397702867-973-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1397702867-973-1-git-send-email-yamada.m@jp.panasonic.com>
Message-Id: <20140527125416.7807.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi Michal,

Could you apply this trivial fix?
I want it included in Linux-3.15.

Best Regards
Masahiro Yamada

On Thu, 17 Apr 2014 11:47:47 +0900
Masahiro Yamada <yamada.m@jp.panasonic.com> wrote:

> scripts/Makefile adds "selinux" to subdir-y or subdir- twice.
> 
>   subdir-$(CONFIG_MODVERSIONS) += genksyms
>   subdir-y                     += mod
>   subdir-$(CONFIG_SECURITY_SELINUX) += selinux    <--- here
>   subdir-$(CONFIG_DTC)         += dtc
> 
>   # Let clean descend into subdirs
>   subdir- += basic kconfig package selinux        <--- again
> 
> The latter is redundant.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  scripts/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 1d07860..890df5c 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -39,4 +39,4 @@ subdir-$(CONFIG_SECURITY_SELINUX) += selinux
>  subdir-$(CONFIG_DTC)         += dtc
>  
>  # Let clean descend into subdirs
> -subdir-	+= basic kconfig package selinux
> +subdir-	+= basic kconfig package
> -- 
> 1.8.3.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


