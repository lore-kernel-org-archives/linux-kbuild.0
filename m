Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:41436 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754361AbeFTSMs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jun 2018 14:12:48 -0400
Date: Wed, 20 Jun 2018 12:12:45 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] mtd: rawnand: denali_dt: add more clocks based on
 IP datasheet
Message-ID: <20180620181245.GA30779@rob-hp-laptop>
References: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com>
 <1529025532-22087-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529025532-22087-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, linux-kbuild@vger.kernel.org, Richard Weinberger <richard@nod.at>, "linux-stable #4 . 14+" <stable@vger.kernel.org>, devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>

On Fri, Jun 15, 2018 at 10:18:50AM +0900, Masahiro Yamada wrote:
> According to the Denali User's Guide, this IP needs three clocks:
> 
>  - clk: controller core clock
> 
>  - clk_x: bus interface clock
> 
>  - ecc_clk: clock at which ECC circuitry is run
> 
> Currently, denali_dt.c requires a single anonymous clock and its
> frequency.  However, the driver needs to get the frequency of "clk_x"
> not "clk".  This is confusing because people tend to assume the
> anonymous clock means the core clock.  In fact, I got a report of
> SOCFPGA breakage because the timing parameters are calculated based
> on a wrong frequency.
> 
> Instead of the cheesy implementation, the clocks in the real hardware
> should be represented in the driver and the DT-binding.
> 
> However, adding new clocks would break the existing platforms.  For the
> backward compatibility, the driver still accepts a single clock just as
> before.  If clk_x is missing, clk_x_rate is set to a hardcoded value.
> This is fine for existing DT of Socionext UniPhier, and also fixes the
> issue of Altera (Intel) SOCFPGA because both platforms use 200 MHz for
> the bus interface clock.
> 
> Fixes: 1bb88666775e ("mtd: nand: denali: handle timing parameters by setup_data_interface()")
> Cc: linux-stable <stable@vger.kernel.org> #4.14+
> Reported-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3:
>   - Change the patch order so that the bug-fix one comes the first
> 
> Changes in v2:
>   - Split patches into sensible chunks
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  5 +++
>  drivers/mtd/nand/raw/denali_dt.c                   | 49 ++++++++++++++++++++--
>  2 files changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index 0ee8edb..f33da87 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -8,6 +8,9 @@ Required properties:
>    - reg : should contain registers location and length for data and reg.
>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>    - interrupts : The interrupt number.
> +  - clocks: should contain phandle of the controller core clock, the bus
> +    interface clock, and the ECC circuit clock.
> +  - clock-names: should contain "nand", "nand_x", "ecc"

The subject says "add more clocks", but it doesn't look like any clocks 
were supported before. Or documentation was missing?

Please split bindings to a separate patch.

Rob
