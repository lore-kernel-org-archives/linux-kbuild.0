Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lithops.sigma-star.at ([195.201.40.130]:41816 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755005AbeFRHJF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 03:09:05 -0400
From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v3 1/3] mtd: rawnand: denali_dt: add more clocks based on IP datasheet
Date: Mon, 18 Jun 2018 09:09:02 +0200
Message-ID: <5816516.AqyscFuYxX@blindfold>
In-Reply-To: <1529025532-22087-2-git-send-email-yamada.masahiro@socionext.com>
References: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com> <1529025532-22087-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org, "linux-stable #4 . 14+" <stable@vger.kernel.org>, devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>

Am Freitag, 15. Juni 2018, 03:18:50 CEST schrieb Masahiro Yamada:
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

Reviewed-by: Richard Weinberger <richard@nod.at>
Reported-by: Philipp Rosenberger <p.rosenberger@linutronix.de>

Thanks,
//richard
