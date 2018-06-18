Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:51687 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932510AbeFRHrx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 03:47:53 -0400
Date: Mon, 18 Jun 2018 09:47:32 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v3 2/3] mtd: rawnand: denali_dt: use dev as a shorthand
 of &pdev->dev
Message-ID: <20180618094732.4864f16b@bbrezillon>
In-Reply-To: <1529025532-22087-3-git-send-email-yamada.masahiro@socionext.com>
References: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com>
        <1529025532-22087-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org, Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Fri, 15 Jun 2018 10:18:51 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The probe function references &pdev->dev many times.  Add 'dev' as
> a shorthand.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/mtd/nand/raw/denali_dt.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
> index ce6239d..afaae37 100644
> --- a/drivers/mtd/nand/raw/denali_dt.c
> +++ b/drivers/mtd/nand/raw/denali_dt.c
> @@ -81,38 +81,39 @@ MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
>  
>  static int denali_dt_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	struct denali_dt *dt;
>  	const struct denali_dt_data *data;
>  	struct denali_nand_info *denali;
>  	int ret;
>  
> -	dt = devm_kzalloc(&pdev->dev, sizeof(*dt), GFP_KERNEL);
> +	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
>  	if (!dt)
>  		return -ENOMEM;
>  	denali = &dt->denali;
>  
> -	data = of_device_get_match_data(&pdev->dev);
> +	data = of_device_get_match_data(dev);
>  	if (data) {
>  		denali->revision = data->revision;
>  		denali->caps = data->caps;
>  		denali->ecc_caps = data->ecc_caps;
>  	}
>  
> -	denali->dev = &pdev->dev;
> +	denali->dev = dev;
>  	denali->irq = platform_get_irq(pdev, 0);
>  	if (denali->irq < 0) {
> -		dev_err(&pdev->dev, "no irq defined\n");
> +		dev_err(dev, "no irq defined\n");
>  		return denali->irq;
>  	}
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "denali_reg");
> -	denali->reg = devm_ioremap_resource(&pdev->dev, res);
> +	denali->reg = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(denali->reg))
>  		return PTR_ERR(denali->reg);
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
> -	denali->host = devm_ioremap_resource(&pdev->dev, res);
> +	denali->host = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(denali->host))
>  		return PTR_ERR(denali->host);
>  
> @@ -120,19 +121,19 @@ static int denali_dt_probe(struct platform_device *pdev)
>  	 * A single anonymous clock is supported for the backward compatibility.
>  	 * New platforms should support all the named clocks.
>  	 */
> -	dt->clk = devm_clk_get(&pdev->dev, "nand");
> +	dt->clk = devm_clk_get(dev, "nand");
>  	if (IS_ERR(dt->clk))
> -		dt->clk = devm_clk_get(&pdev->dev, NULL);
> +		dt->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(dt->clk)) {
> -		dev_err(&pdev->dev, "no clk available\n");
> +		dev_err(dev, "no clk available\n");
>  		return PTR_ERR(dt->clk);
>  	}
>  
> -	dt->clk_x = devm_clk_get(&pdev->dev, "nand_x");
> +	dt->clk_x = devm_clk_get(dev, "nand_x");
>  	if (IS_ERR(dt->clk_x))
>  		dt->clk_x = NULL;
>  
> -	dt->clk_ecc = devm_clk_get(&pdev->dev, "ecc");
> +	dt->clk_ecc = devm_clk_get(dev, "ecc");
>  	if (IS_ERR(dt->clk_ecc))
>  		dt->clk_ecc = NULL;
>  
> @@ -155,7 +156,7 @@ static int denali_dt_probe(struct platform_device *pdev)
>  		 * Hardcode the clock rates for the backward compatibility.
>  		 * This works for both SOCFPGA and UniPhier.
>  		 */
> -		dev_notice(&pdev->dev,
> +		dev_notice(dev,
>  			   "necessary clock is missing. default clock rates are used.\n");
>  		denali->clk_x_rate = 200000000;
>  	}

