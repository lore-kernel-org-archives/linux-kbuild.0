Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcdn-iport-2.cisco.com ([173.37.86.73]:2186 "EHLO
        rcdn-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbeKOKNX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 05:13:23 -0500
Date: Wed, 14 Nov 2018 16:07:56 -0800
From: Daniel Walker <danielwa@cisco.com>
Subject: Re: hidden string Kconfig ?
Message-ID: <20181115000756.k2fsgzmswdbikpfb@zorba>
References: <20181114223211.b4a2gjmt5pvtg2bh@zorba>
 <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Wed, Nov 14, 2018 at 03:16:17PM -0800, Randy Dunlap wrote:
> Hi,
> 
> There are several "string" Kconfig symbols in init/Kconfig that do not have
> a prompt string after them.  I believe that these do what you are asking about.
> If not, please provide your example that is not working.
> 
> Or:  this one works for me:
> 
> ---
>  init/Kconfig |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- linux-next-20181114.orig/init/Kconfig
> +++ linux-next-20181114/init/Kconfig
> @@ -1858,6 +1858,10 @@ config CMDLINE
>  
>  endif
>  
> +config SPECIAL_STRING
> +	string
> +	default "special"
> +
>  endmenu		# General setup
>  
>  source "arch/Kconfig"
> 
> 
> and "make oldconfig" gives me a .config file that contains:
> CONFIG_SPECIAL_STRING="special"

I have this (in init/Kconfig),

config CMDLINE
        string

then inside my .config I have this,
CONFIG_CMDLINE="console=ttyS0"

if you run  "make menuconfig", and change something then save. The
CONFIG_CMDLINE is gone.

What I would want is for that option to remain untouched.


Daniel
