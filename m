Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46769 "EHLO
	conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751477AbcGUBVb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Jul 2016 21:21:31 -0400
MIME-Version: 1.0
In-Reply-To: <20160718160035.3062818-1-arnd@arndb.de>
References: <20160718160035.3062818-1-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Jul 2016 10:21:13 +0900
Message-ID: <CAK7LNASQ0qpd-4NXt0K2z2C2nmLB2votNAmwJmpASOxtUqsVkg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: tinyconfig: provide whole choice blocks to avoid warnings
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Josh Triplett <josh@joshtriplett.org>, Darren Hart <dvhart@linux.intel.com>, kernel-build-reports@lists.linaro.org, Thiago Macieira <thiago.macieira@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Arnd,


2016-07-19 1:00 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
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
> Link: https://storage.kernelci.org/mainline/v4.7-rc6/x86-tinyconfig/build.log
> https://patchwork.kernel.org/patch/9212749/
> ---
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


Which sorting policy are you using here?


I prefer the same order as they appear in the .config file.
Like this.


+# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_KERNEL_GZIP is not set
+# CONFIG_KERNEL_BZIP2 is not set
+# CONFIG_KERNEL_LZMA is not set
 CONFIG_KERNEL_XZ=y
+# CONFIG_KERNEL_LZO is not set
+# CONFIG_KERNEL_LZ4 is not set
 CONFIG_OPTIMIZE_INLINING=y
+# CONFIG_SLAB is not set
+# CONFIG_SLUB is not set
 CONFIG_SLOB=y


-- 
Best Regards
Masahiro Yamada
