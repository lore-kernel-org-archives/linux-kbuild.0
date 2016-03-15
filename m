Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57014 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754130AbcCOQJu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Mar 2016 12:09:50 -0400
Subject: Re: [PATCH] staging: netlogic: removed 1 multiple assignment
 checkpatch warning
References: <1457688147-8191-1-git-send-email-laerdevstudios@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56E833CB.1060407@suse.com>
Date: Tue, 15 Mar 2016 17:09:47 +0100
MIME-Version: 1.0
In-Reply-To: <1457688147-8191-1-git-send-email-laerdevstudios@gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: laerdevstudios@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, driverdev-devel@linuxdriverproject.org

This should go to the staging mailing list.

Michal

Dne 11.3.2016 v 10:22 laerdevstudios@gmail.com napsal(a):
> From: Parth Sane <laerdevstudios@gmail.com>
> 
> Fixed netlogic checkpatch multiple assignment warning in platform_net.c
> 
> Signed-off-by: Parth Sane <laerdevstudios@gmail.com>
> ---
>  drivers/staging/netlogic/platform_net.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/netlogic/platform_net.c b/drivers/staging/netlogic/platform_net.c
> index 7806c2b..daee1b2 100644
> --- a/drivers/staging/netlogic/platform_net.c
> +++ b/drivers/staging/netlogic/platform_net.c
> @@ -86,7 +86,8 @@ static void xlr_resource_init(struct resource *res, int offset, int irq)
>  
>  	res++;
>  	res->name = "gmac";
> -	res->start = res->end = irq;
> +	res->end = irq;
> +	res->start = res->end;
>  	res->flags = IORESOURCE_IRQ;
>  }
>  
> 

