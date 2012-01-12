Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:33979 "EHLO
	hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755451Ab2ALUvp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Jan 2012 15:51:45 -0500
Received: from homiemail-a61.g.dreamhost.com (caiajhbdcagg.dreamhost.com [208.97.132.66])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 3B7FC1F6D41
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2012 12:51:42 -0800 (PST)
Subject: Re: [PATCH] scripts:kconfig:mconf.c: let make not report error
 when not save configuration
From: Davidlohr Bueso <dave@gnu.org>
Reply-To: dave@gnu.org
In-Reply-To: <20120112033132.GA13752@udknight>
References: <20120112033132.GA13752@udknight>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Jan 2012 21:50:37 +0100
Message-ID: <1326401437.3416.0.camel@offbook>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>
Cc: mmarek@suse.cz, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, lacombar@gmail.com

On Thu, 2012-01-12 at 11:31 +0800, Wang YanQing wrote:
> I find every time when I choice the 'NO' button at the dialog
> which let me choice whether to save the configuration before exit
> menuconfig, it always report the blow:
> 
> " GEN     /mnt/sda7/home/build/test/Makefile
>   HOSTCC  scripts/kconfig/mconf.o
>   HOSTLD  scripts/kconfig/mconf
> scripts/kconfig/mconf Kconfig
> 
> Your configuration changes were NOT saved.
> 
> make[2]: *** [menuconfig] Error 1
> make[1]: *** [menuconfig] Error 2
> make: *** [sub-make] Error 2 "
> 
> This patch repair it.
> 
> Thanks!
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Acked-by: Davidlohr Bueso <dave@gnu.org>

> ---
>  scripts/kconfig/mconf.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 19e200d..86cd1ea 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -830,6 +830,7 @@ static int handle_exit(void)
>  		fprintf(stderr, _("\n\n"
>  				  "Your configuration changes were NOT saved."
>  				  "\n\n"));
> +		res = 0;
>  	}
>  
>  	return res;


