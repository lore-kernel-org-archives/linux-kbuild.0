Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44069 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfEHLh4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 07:37:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id c5so1520905wrs.11
        for <linux-kbuild@vger.kernel.org>; Wed, 08 May 2019 04:37:55 -0700 (PDT)
Date: Wed, 8 May 2019 12:37:52 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] Remove MODULE_ALIAS() calls that take undefined macro
Message-ID: <20190508113752.GE31645@dell>
References: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Gladkov <gladkov.alexey@gmail.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>

On Tue, 07 May 2019, Masahiro Yamada wrote:

> These files do not define (USBHS_)DRIVER_NAME. Yet, they can be
> successfully compiled because they are never built as a module by
> anyone, i.e, the MODULE_ALIAS() calls are always no-op.
> 
> A problem showed up when a patch "moduleparam: Save information about
> built-in modules in separate file" is applied. With this new feature,
> MODULE_*() are populated even if the callers are built-in.
> 
> To avoid the build errors, the lines referencing to the undefined
> macro must be removed.
> 
> The complete fix is to remove all MODULE_* and #include <linux/module.h>
> like many "make ... explicitly non-modular" commits did.
> 
> For now, I am touching the offending lines.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> I will insert this commit before
> "moduleparam: Save information about built-in modules in separate file"
> 
> 
>  arch/arm/plat-omap/dma.c          | 1 -
>  drivers/clocksource/timer-ti-dm.c | 1 -
>  drivers/mfd/omap-usb-tll.c        | 1 -

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
