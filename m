Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:41838 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751948AbaFBHkU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Jun 2014 03:40:20 -0400
Date: Mon, 2 Jun 2014 09:32:12 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] deb-pkg: Apply $(CROSS_COMPILE) when calling objcopy
Message-ID: <20140602073212.GG17453@stro.at>
References: <1401691657-12222-1-git-send-email-ijc@hellion.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401691657-12222-1-git-send-email-ijc@hellion.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, debian-kernel@lists.debian.org


On Mon, Jun 02, 2014 at 07:47:37AM +0100, Ian Campbell wrote:
> Allows me to cross build an armhf package from amd64.
> 
> Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
Acked-by: maximilian attems <max@stro.at>
> ---
>  scripts/package/builddeb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f46e4dd..c22ab79 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -155,11 +155,11 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>  			for module in $(find lib/modules/ -name *.ko); do
>  				mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
>  				# only keep debug symbols in the debug file
> -				objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
> +				${CROSS_COMPILE}objcopy --only-keep-debug $module $dbg_dir/usr/lib/debug/$module
>  				# strip original module from debug symbols
> -				objcopy --strip-debug $module
> +				${CROSS_COMPILE}objcopy --strip-debug $module
>  				# then add a link to those
> -				objcopy --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
> +				${CROSS_COMPILE}objcopy --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $module
>  			done
>  		)
>  	fi
> -- 
> 1.9.0
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-kernel-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
> Archive: https://lists.debian.org/1401691657-12222-1-git-send-email-ijc@hellion.org.uk
> 
