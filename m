Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:58734 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754918AbZFNUSf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 14 Jun 2009 16:18:35 -0400
Date: Sun, 14 Jun 2009 22:20:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: PATCH: README - Fix misleading pointer to the defconf directory [NEW]
Message-ID: <20090614202053.GA2688@uranus.ravnborg.org>
References: <4A321A3C.6030400@gmx.de> <4A3242EC.7020602@freenet.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A3242EC.7020602@freenet.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Patrick Ringl <patrick_@freenet.de>
Cc: linux-kernel@vger.kernel.org, torvalds@osdl.org, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Fri, Jun 12, 2009 at 01:58:36PM +0200, Patrick Ringl wrote:
> Hello again,
> 
> after Arnd's short review and appropriate suggestions of change (thank 
> you), here is an updated version of my earlier patch:
> 
> 
> Signed-off-by: Patrick Ringl <patrick_@freenet.de>
> 
> <---->
> 
> --- linux.orig/README	2009-06-10 05:05:27.000000000 +0200
> +++ linux/README	2009-06-12 13:47:38.000000000 +0200
> @@ -175,7 +175,15 @@
>  			   Like above, but avoids cluttering the screen
>  			   with questions already answered.
>  	"make defconfig"   Create a ./.config file by using the default
> -			   symbol values from arch/$ARCH/defconfig.
> +			   symbol values from either arch/$ARCH/defconfig
> +			   or arch/$ARCH/configs/${PLATFORM}_defconfig,
> +			   depending on the architecture.
> +	"make ${PLATFORM}_defconfig"
> +			   Create a ./.config file by using the default
> +			   symbol values from
> +			   arch/$ARCH/configs/${PLATFORM}_defconfig.
> +			   Use "make help" to get a list of all available
> +			   platforms of your architecture.
>  	"make allyesconfig"
>  			   Create a ./.config file by setting symbol
>  			   values to 'y' as much as possible.

Applied. I had to apply it manually for some reason.

	Sam
