Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728470AbgDQWTk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 18:19:40 -0400
Date: Fri, 17 Apr 2020 15:19:36 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] um: do not evaluate compiler's library path when cleaning
Message-ID: <20200417221936.GA13833@ubuntu-s3-xlarge-x86>
References: <20200417180455.1174340-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417180455.1174340-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org, linux-kbuild@vger.kernel.org, Alex Dewar <alex.dewar@gmx.co.uk>, Erel Geron <erelx.geron@intel.com>, Johannes Berg <johannes.berg@intel.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org

On Sat, Apr 18, 2020 at 03:04:55AM +0900, Masahiro Yamada wrote:
> Since commit a83e4ca26af8 ("kbuild: remove cc-option switch from
> -Wframe-larger-than="), 'make ARCH=um clean' emits an error message
> as follows:
> 
>   $ make ARCH=um clean
>   gcc: error: missing argument to '-Wframe-larger-than='
> 
> We do not care compiler flags when cleaning.
> 
> Use the '=' operator for lazy expansion because we do not use
> LDFLAGS_pcap.o or LDFLAGS_vde.o when cleaning.
> 
> While I was here, I removed the redundant -r option because it
> already exists in the recipe.
> 
> Fixes: a83e4ca26af8 ("kbuild: remove cc-option switch from -Wframe-larger-than=")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/um/drivers/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/um/drivers/Makefile b/arch/um/drivers/Makefile
> index a290821e355c..2a249f619467 100644
> --- a/arch/um/drivers/Makefile
> +++ b/arch/um/drivers/Makefile
> @@ -18,9 +18,9 @@ ubd-objs := ubd_kern.o ubd_user.o
>  port-objs := port_kern.o port_user.o
>  harddog-objs := harddog_kern.o harddog_user.o
>  
> -LDFLAGS_pcap.o := -r $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libpcap.a)
> +LDFLAGS_pcap.o = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libpcap.a)
>  
> -LDFLAGS_vde.o := -r $(shell $(CC) $(CFLAGS) -print-file-name=libvdeplug.a)
> +LDFLAGS_vde.o = $(shell $(CC) $(CFLAGS) -print-file-name=libvdeplug.a)
>  
>  targets := pcap_kern.o pcap_user.o vde_kern.o vde_user.o
>  
> -- 
> 2.25.1
> 

I tested building pcap.o both before and after this change, no changes
there.

I do see the clean error fixed.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com> [build]
