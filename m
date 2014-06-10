Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from afflict.kos.to ([92.243.29.197]:55815 "EHLO afflict.kos.to"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750924AbaFJNQT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 09:16:19 -0400
Date: Tue, 10 Jun 2014 16:06:39 +0300
From: Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH v2 1/2] deb-pkg: Add automatic support for armhf
 architecture
Message-ID: <20140610130639.GA25366@afflict.kos.to>
References: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, debian-arm@lists.debian.org, Hector Oron <hector.oron@gmail.com>

On Mon, Jun 09, 2014 at 01:21:34AM +0100, Ben Hutchings wrote:
> The Debian armhf architecture uses the ARM EABI hard-float variant,
> whereas armel uses the soft-float variant.  Although the kernel
> doesn't use FP itself, CONFIG_VFP must be enabled to support
> hard-float userland and will probably be disabled when supporting a
> soft-float userland.  So set the architecture to armhf by default when
> CONFIG_AEABI and CONFIG_VFP are both enabled.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
> v2: rebased
> 
> After discussion with Hector, we agreed this would be a worthwhile
> change.  Hector may later improve this by using gcc specs.

That should be easy:

-if grep -q CONFIG_VFP=y $KCONFIG_CONFIG; then
+if $CC -dM -E - < /dev/null|grep -q __ARM_PCS_VFP; then

It worked at least for my cross-compile test a minute ago.

Riku

> Ben.
> 
>  scripts/package/builddeb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f46e4dd..6756ed6 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,16 @@ create_package() {
>  	mips*)
>  		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
>  	arm*)
> -		debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
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
> One of the nice things about standards is that there are so many of them.


