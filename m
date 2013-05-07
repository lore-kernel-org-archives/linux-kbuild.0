Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:39923 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756382Ab3EGKnE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 06:43:04 -0400
Date: Tue, 7 May 2013 12:44:55 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] menuconfig: fix NULL pointer dereference when searching
 a symbol
Message-ID: <20130507104455.GB7633@pd.tnic>
References: <518869BB.2020808@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <518869BB.2020808@huawei.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Li Zefan <lizefan@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Weng Meiling <wengmeiling.weng@huawei.com>, Libo Chen <clbchenlibo.chen@huawei.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, May 07, 2013 at 10:40:59AM +0800, Li Zefan wrote:
> Searching PPC_EFIKA results segmentation fault, and it's because
> get_symbol_prop() returns NULL.
> 
> In this case CONFIG_PPC_EFIKA is defined in arch/powerpc/platforms/
> 52xx/Kconfig, so it won't be parsed if ARCH!=PPC, but menuconfig
> knows this symbol when it parses sound/soc/fsl/Kconfig:
> 
> config SND_MPC52xx_SOC_EFIKA
>         tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
>         depends on PPC_EFIKA
> 
> This bug was introduced by commit bcdedcc1afd6 ("menuconfig: print more
> info for symbol without prompts").

Yep, it works.

> Reported-by: Borislav Petkov <bp@alien8.de>

	..-and-tested-by: ...

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
