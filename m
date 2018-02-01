Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17695 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751886AbeBAPwv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Feb 2018 10:52:51 -0500
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 02/11] video: fbdev: kconfig: Remove blank help text
Date: Thu, 01 Feb 2018 16:52:42 +0100
Message-id: <3132455.r9uCTL3ZTk@amdc3058>
In-reply-to: <20180131093434.20050-3-ulfalizer@gmail.com>
MIME-version: 1.0
Content-transfer-encoding: 7Bit
Content-type: text/plain; charset="us-ascii"
References: <20180131093434.20050-1-ulfalizer@gmail.com>
        <CGME20180131093527epcas2p3978f33b8407c31bd95e01bca682346da@epcas2p3.samsung.com>
        <20180131093434.20050-3-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, mcgrof@kernel.org, rdunlap@infradead.org, dan.carpenter@oracle.com, pebolle@tiscali.nl, Arnd Bergmann <arnd@arndb.de>, Michal Simek <michal.simek@xilinx.com>, Hans de Goede <j.w.r.degoede@gmail.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org


Hi,

On Wednesday, January 31, 2018 10:34:21 AM Ulf Magnusson wrote:
> Blank help texts are probably either a typo, a Kconfig misunderstanding,
> or some kind of half-committing to adding a help text (in which case a
> TODO comment would be clearer, if the help text really can't be added
> right away).
> 
> Best to remove them, IMO.

How about actually adding some meaningful help texts instead
(as a general rule each user visible option should have valid
help text)?

> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  drivers/video/fbdev/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 6962b4583fd7..11e699f1062b 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1156,7 +1156,6 @@ config FB_I810_I2C
>  	bool "Enable DDC Support"
>  	depends on FB_I810 && FB_I810_GTF
>  	select FB_DDC
> -	help

Please add a missing help text instead (take a look at FB_SAVAGE_I2C
config option to see how a valid help text entry should look like).

In the longer term we should consider removing *_I2C config options
and just make the main config options always enable I2C subsystem
directly if needed/useful (some fbdev drivers are doing it this way
already).

>  config FB_LE80578
>  	tristate "Intel LE80578 (Vermilion) support"

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

