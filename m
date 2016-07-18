Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57564 "EHLO
	relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751254AbcGRTbu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 15:31:50 -0400
Date: Mon, 18 Jul 2016 12:31:40 -0700
From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH] kconfig: tinyconfig: provide whole choice blocks to
 avoid warnings
Message-ID: <20160718193140.GA11720@x>
References: <20160718160035.3062818-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160718160035.3062818-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Darren Hart <dvhart@linux.intel.com>, kernel-build-reports@lists.linaro.org, Thiago Macieira <thiago.macieira@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Mon, Jul 18, 2016 at 06:00:23PM +0200, Arnd Bergmann wrote:
> Using "make tinyconfig" produces a couple of annoying warnings that show up
> for build test machines all the time:
> 
>     .config:966:warning: override: NOHIGHMEM changes choice state
>     .config:965:warning: override: SLOB changes choice state
>     .config:963:warning: override: KERNEL_XZ changes choice state
>     .config:962:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
>     .config:933:warning: override: SLOB changes choice state
>     .config:930:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
>     .config:870:warning: override: SLOB changes choice state
>     .config:868:warning: override: KERNEL_XZ changes choice state
>     .config:867:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> 
> I've made a previous attempt at fixing them and we discussed a number of
> alternatives.
> 
> I tried changing the Makefile to use "merge_config.sh -n $(fragment-list)"
> but couldn't get that to work properly.
> 
> This is yet another approach, based on the observation that we do want
> to see a warning for conflicting 'choice' options, and that we can simply
> make them non-conflicting by listing all other options as disabled.
> This is a trivial patch that we can apply independent of plans for other
> changes.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Josh Triplett <josh@joshtriplett.org>

This does introduce additional warnings for changing those newly listed
options, but then we only have one type of warning, which will go away
with whatever fix you make to the underlying config merge machinery.

I'll send a follow-up patch doing the same for
arch/x86/configs/tiny.config, whose one config symbol (NOHIGHMEM) also
forms part of a choice and produces the same warning.

I find it *mildly* annoying that this means the configs will need to
change whenever any new choices appear, but at least we'll have warnings
to tell us that.

>  kernel/configs/tiny.config | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> index c2de56ab0fce..3eeade4d876d 100644
> --- a/kernel/configs/tiny.config
> +++ b/kernel/configs/tiny.config
> @@ -1,4 +1,12 @@
>  CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
>  CONFIG_KERNEL_XZ=y
> +# CONFIG_KERNEL_GZIP is not set
> +# CONFIG_KERNEL_BZIP2 is not set
> +# CONFIG_KERNEL_LZMA is not set
> +# CONFIG_KERNEL_LZO is not set
> +# CONFIG_KERNEL_LZ4 is not set
>  CONFIG_OPTIMIZE_INLINING=y
> +# CONFIG_SLUB is not set
> +# CONFIG_SLAB is not set
>  CONFIG_SLOB=y
> -- 
> 2.9.0
> 
