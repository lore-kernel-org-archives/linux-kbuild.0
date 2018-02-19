Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lilium.sigma-star.at ([109.75.188.150]:38888 "EHLO
        lilium.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751568AbeBSPY1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Feb 2018 10:24:27 -0500
From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] kconfig: really drop GENERIC_IO
Date: Mon, 19 Feb 2018 16:25:45 +0100
Message-ID: <1602768.aI85sxpSkT@blindfold>
In-Reply-To: <5A8AF3B602000078001A920C@prv-mh.provo.novell.com>
References: <5A8AF3B602000078001A920C@prv-mh.provo.novell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org, robh@kernel.org

Am Montag, 19. Februar 2018, 15:56:38 CET schrieb Jan Beulich:
> Commit 9de8da4774 ("kconfig: kill off GENERIC_IO option") dropped the
> option, but left a "select" of it in place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>  lib/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- 4.16-rc2/lib/Kconfig
> +++ 4.16-rc2-Kconfig-GENERIC_IO/lib/Kconfig
> @@ -396,7 +396,6 @@ config ASSOCIATIVE_ARRAY
>  config HAS_IOMEM
>  	bool
>  	depends on !NO_IOMEM
> -	select GENERIC_IO
>  	default y
> 
>  config HAS_IOPORT_MAP

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
