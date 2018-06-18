Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lithops.sigma-star.at ([195.201.40.130]:42060 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754973AbeFRHWq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 03:22:46 -0400
From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v3 3/3] mtd: rawnand: denali: optimize timing parameters for data interface
Date: Mon, 18 Jun 2018 09:22:44 +0200
Message-ID: <34780659.LX1KsSZy9L@blindfold>
In-Reply-To: <1529025532-22087-4-git-send-email-yamada.masahiro@socionext.com>
References: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com> <1529025532-22087-4-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Am Freitag, 15. Juni 2018, 03:18:52 CEST schrieb Masahiro Yamada:
> This commit improves the ->setup_data_interface() hook.
> 
> The denali_setup_data_interface() needs the frequency of clk_x
> and the ratio of clk_x / clk.
> 
> The latter is currently hardcoded in the driver, like this:
> 
>   #define DENALI_CLK_X_MULT       6
> 
> The IP datasheet requires that clk_x / clk be 4, 5, or 6.  I just
> chose 6 because it is the most defensive value, but it is not optimal.
> By getting the clock rate of both "clk" and "clk_x", the driver can
> compute the timing values more precisely.

What datasheet do you have, is it public?
Mine clearly states that the factor is 4.
"The frequency of nand_x_clk is four times the frequency of nand_clk."

> To not break the existing platforms, the fallback value, 50 MHz is
> provided.  It is true for all upstreamed platforms.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
