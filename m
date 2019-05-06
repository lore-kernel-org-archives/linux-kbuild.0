Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34316 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfEFRjr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 13:39:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id m20so5933601wmg.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2019 10:39:46 -0700 (PDT)
Subject: Re: [PATCH] Remove MODULE_ALIAS() calls that take undefined macro
References: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6d8e2880-0cc0-a7d8-1d42-4401e15e3ac9@linaro.org>
Date: Mon, 6 May 2019 19:39:43 +0200
MIME-Version: 1.0
In-Reply-To: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Gladkov <gladkov.alexey@gmail.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org

On 06/05/2019 19:28, Masahiro Yamada wrote:
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

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
