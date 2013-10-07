Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:56879 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754691Ab3JGNsq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Oct 2013 09:48:46 -0400
Date: Mon, 7 Oct 2013 15:38:25 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH 1/2] deb-pkg: Add automatic support for armhf architecture
Message-ID: <20131007133825.GH11166@stro.at>
References: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, debian-arm@lists.debian.org

On Sun, Oct 06, 2013 at 06:04:01PM +0100, Ben Hutchings wrote:
> The Debian armhf architecture uses the ARM EABI hard-float variant,
> whereas armel uses the soft-float variant.  Although the kernel
> doesn't use FP itself, CONFIG_VFP must be enabled to support
> hard-float userland and will probably be disabled when supporting a
> soft-float userland.  So set the architecture to armhf by default when
> CONFIG_AEABI and CONFIG_VFP are both enabled.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Acked-by: maximilian attems <max@stro.at>
> ---
>  scripts/package/builddeb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 90e521f..e14c56e 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,16 @@ create_package() {
>  	mips*)
>  		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el) ;;
>  	arm*)
> -		debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el) ;;
> +		if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
> +		    if grep -q CONFIG_VFP=y $KCONFIG_CONFIG; then
> +			debarch=armhf
> +		    else
> +			debarch=armel
> +		    fi
> +		else
> +		    debarch=arm
> +		fi
> +		;;
>  	*)
>  		echo "" >&2
>  		echo "** ** **  WARNING  ** ** **" >&2
> 
> 
> -- 
> Ben Hutchings
> Who are all these weirdos? - David Bowie, reading IRC for the first time


