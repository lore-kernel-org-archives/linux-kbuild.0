Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:5846 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751579AbeBBB20 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Feb 2018 20:28:26 -0500
Message-ID: <1517563701.2668.1.camel@intel.com>
Subject: Re: [PATCH 10/11] nios2: kconfig: Remove blank help text
From: Ley Foon Tan <ley.foon.tan@intel.com>
Date: Fri, 02 Feb 2018 17:28:21 +0800
In-Reply-To: <20180131093434.20050-11-ulfalizer@gmail.com>
References: <20180131093434.20050-1-ulfalizer@gmail.com>
         <20180131093434.20050-11-ulfalizer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, mcgrof@kernel.org, rdunlap@infradead.org, dan.carpenter@oracle.com, pebolle@tiscali.nl, Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org

On Wed, 2018-01-31 at 10:34 +0100, Ulf Magnusson wrote:
> Blank help texts are probably either a typo, a Kconfig
> misunderstanding,
> or some kind of half-committing to adding a help text (in which case
> a
> TODO comment would be clearer, if the help text really can't be added
> right away).
> 
> Best to remove them, IMO.
> 
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  arch/nios2/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
> index 60fae03dac79..3d4ec88f1db1 100644
> --- a/arch/nios2/Kconfig
> +++ b/arch/nios2/Kconfig
> @@ -152,7 +152,6 @@ menu "Advanced setup"
> 
>  config ADVANCED_OPTIONS
>         bool "Prompt for advanced kernel configuration options"
> -       help
> 
>  comment "Default settings for advanced configuration options are
> used"
>         depends on !ADVANCED_OPTIONS
> --
> 2.14.1
> 

Acked-by: Ley Foon Tan <ley.foon.tan@intel.com>
