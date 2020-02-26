Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43917 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbgBZVgl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 16:36:41 -0500
Date: Wed, 26 Feb 2020 15:36:38 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 2/4] of: fdt: print dtb build information
Message-ID: <20200226213638.GA29417@bogus>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-3-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221161418.20225-3-alexandre.torgue@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

On Fri, Feb 21, 2020 at 05:14:16PM +0100, Alexandre Torgue wrote:
> This commit prints out DTB build information (build time, dts source
> version used, ...) if "Build-info" property exists in DTB root node.

/Build/build/

> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 2cdf64d2456f..aa5989039746 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1224,9 +1224,18 @@ bool __init early_init_dt_scan(void *params)
>   */
>  void __init unflatten_device_tree(void)
>  {
> +	const char *build_info;
> +	unsigned long dt_root;
> +
>  	__unflatten_device_tree(initial_boot_params, NULL, &of_root,
>  				early_init_dt_alloc_memory_arch, false);
>  
> +	/* If available, provide dtb build information */
> +	dt_root = of_get_flat_dt_root();
> +	build_info = of_get_flat_dt_prop(dt_root, "build-info", NULL);

We just unflattened the tree, why are we using the flat dt functions?

> +	if (build_info)
> +		pr_info("%s\n", build_info);
> +
>  	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
>  	of_alias_scan(early_init_dt_alloc_memory_arch);
>  
> -- 
> 2.17.1
> 
