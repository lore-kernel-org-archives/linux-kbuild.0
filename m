Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:40142 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfE1MKK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 May 2019 08:10:10 -0400
Date: Tue, 28 May 2019 05:10:09 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] powerpc/configs: Rename foo_basic_defconfig to
 foo_base.config
Message-ID: <20190528121009.GA11901@infradead.org>
References: <20190528081614.26096-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528081614.26096-1-mpe@ellerman.id.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

On Tue, May 28, 2019 at 06:16:14PM +1000, Michael Ellerman wrote:
> We have several "defconfigs" that are not actually full defconfigs
> they are just a base set of options which are then merged with other
> fragments to produce a working defconfig.
> 
> The most obvious example is corenet_basic_defconfig which only
> contains one symbol CONFIG_CORENET_GENERIC=y. But there is also
> mpc85xx_base_defconfig which doesn't actually enable CONFIG_PPC_85xx.
> 
> To avoid confusion, rename these config fragments to "foo_base.config"
> to make it clearer that they are not full defconfigs.

Adding linux-kbuild, maybe we can make the handling of these fragments
generic and actually document it..

>
> Reported-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/Makefile                                | 12 ++++++------
>  .../{corenet_basic_defconfig => corenet_base.config} |  0
>  .../{mpc85xx_basic_defconfig => mpc85xx_base.config} |  0
>  .../{mpc86xx_basic_defconfig => mpc86xx_base.config} |  0
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename arch/powerpc/configs/{corenet_basic_defconfig => corenet_base.config} (100%)
>  rename arch/powerpc/configs/{mpc85xx_basic_defconfig => mpc85xx_base.config} (100%)
>  rename arch/powerpc/configs/{mpc86xx_basic_defconfig => mpc86xx_base.config} (100%)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index c345b79414a9..94f735db2229 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -333,32 +333,32 @@ PHONY += powernv_be_defconfig
>  
>  PHONY += mpc85xx_defconfig
>  mpc85xx_defconfig:
> -	$(call merge_into_defconfig,mpc85xx_basic_defconfig,\
> +	$(call merge_into_defconfig,mpc85xx_base.config,\
>  		85xx-32bit 85xx-hw fsl-emb-nonhw)
>  
>  PHONY += mpc85xx_smp_defconfig
>  mpc85xx_smp_defconfig:
> -	$(call merge_into_defconfig,mpc85xx_basic_defconfig,\
> +	$(call merge_into_defconfig,mpc85xx_base.config,\
>  		85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)
>  
>  PHONY += corenet32_smp_defconfig
>  corenet32_smp_defconfig:
> -	$(call merge_into_defconfig,corenet_basic_defconfig,\
> +	$(call merge_into_defconfig,corenet_base.config,\
>  		85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw dpaa)
>  
>  PHONY += corenet64_smp_defconfig
>  corenet64_smp_defconfig:
> -	$(call merge_into_defconfig,corenet_basic_defconfig,\
> +	$(call merge_into_defconfig,corenet_base.config,\
>  		85xx-64bit 85xx-smp altivec 85xx-hw fsl-emb-nonhw dpaa)
>  
>  PHONY += mpc86xx_defconfig
>  mpc86xx_defconfig:
> -	$(call merge_into_defconfig,mpc86xx_basic_defconfig,\
> +	$(call merge_into_defconfig,mpc86xx_base.config,\
>  		86xx-hw fsl-emb-nonhw)
>  
>  PHONY += mpc86xx_smp_defconfig
>  mpc86xx_smp_defconfig:
> -	$(call merge_into_defconfig,mpc86xx_basic_defconfig,\
> +	$(call merge_into_defconfig,mpc86xx_base.config,\
>  		86xx-smp 86xx-hw fsl-emb-nonhw)
>  
>  PHONY += ppc32_allmodconfig
> diff --git a/arch/powerpc/configs/corenet_basic_defconfig b/arch/powerpc/configs/corenet_base.config
> similarity index 100%
> rename from arch/powerpc/configs/corenet_basic_defconfig
> rename to arch/powerpc/configs/corenet_base.config
> diff --git a/arch/powerpc/configs/mpc85xx_basic_defconfig b/arch/powerpc/configs/mpc85xx_base.config
> similarity index 100%
> rename from arch/powerpc/configs/mpc85xx_basic_defconfig
> rename to arch/powerpc/configs/mpc85xx_base.config
> diff --git a/arch/powerpc/configs/mpc86xx_basic_defconfig b/arch/powerpc/configs/mpc86xx_base.config
> similarity index 100%
> rename from arch/powerpc/configs/mpc86xx_basic_defconfig
> rename to arch/powerpc/configs/mpc86xx_base.config
> -- 
> 2.20.1
> 
---end quoted text---
