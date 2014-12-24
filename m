Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:39195 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751359AbaLXEvj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Dec 2014 23:51:39 -0500
Date: Wed, 24 Dec 2014 13:51:13 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH 2/2] merge_config.sh: add -? for help
In-Reply-To: <1418331304-4821-2-git-send-email-olof@lixom.net>
References: <1418331304-4821-1-git-send-email-olof@lixom.net> <1418331304-4821-2-git-send-email-olof@lixom.net>
Message-Id: <20141224135113.1D3B.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, linux-kernel@vger.kernel.org

Hi, Olof

Not that I care, but what does this patch improve?




On Thu, 11 Dec 2014 12:55:04 -0800
Olof Johansson <olof@lixom.net> wrote:

> It's usual enough for help text that it makes sense to support it.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  scripts/kconfig/merge_config.sh |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 2ab91b9..0c89537 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -28,11 +28,11 @@ trap clean_up HUP INT TERM
>  
>  usage() {
>  	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
> -	echo "  -h    display this help text"
> -	echo "  -m    only merge the fragments, do not execute the make command"
> -	echo "  -n    use allnoconfig instead of alldefconfig"
> -	echo "  -r    list redundant entries when merging fragments"
> -	echo "  -O    dir to put generated output files"
> +	echo "  -h or -? display this help text"
> +	echo "  -m       only merge the fragments, do not execute the make command"
> +	echo "  -n       use allnoconfig instead of alldefconfig"
> +	echo "  -r       list redundant entries when merging fragments"
> +	echo "  -O       dir to put generated output files"
>  }
>  
>  MAKE=true
> @@ -52,7 +52,7 @@ while true; do
>  		shift
>  		continue
>  		;;
> -	"-h")
> +	"-h"|"-?")
>  		usage
>  		exit
>  		;;
> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


