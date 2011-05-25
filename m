Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41661 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754135Ab1EYUqO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 16:46:14 -0400
Message-ID: <4DDD6AD4.6040801@suse.cz>
Date: Wed, 25 May 2011 22:47:16 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 26/34] dlm: Drop __TIME__ usage
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz> <1302015561-21047-27-git-send-email-mmarek@suse.cz>
In-Reply-To: <1302015561-21047-27-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>, cluster-devel@redhat.com

Dne 5.4.2011 16:59, Michal Marek napsal(a):
> The kernel already prints its build timestamp during boot, no need to
> repeat it in random drivers and produce different object files each
> time.
> 
> Cc: Christine Caulfield <ccaulfie@redhat.com>
> Cc: David Teigland <teigland@redhat.com>
> Cc: cluster-devel@redhat.com
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  fs/dlm/main.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Hi,

I don't see this patch in today's linux-next. Any objection against me
applying it to the kbuild-2.6.git repository?

Thanks,
Michal
> 
> diff --git a/fs/dlm/main.c b/fs/dlm/main.c
> index b80e0aa..5a59efa 100644
> --- a/fs/dlm/main.c
> +++ b/fs/dlm/main.c
> @@ -50,7 +50,7 @@ static int __init init_dlm(void)
>  	if (error)
>  		goto out_netlink;
>  
> -	printk("DLM (built %s %s) installed\n", __DATE__, __TIME__);
> +	printk("DLM installed\n");
>  
>  	return 0;
>  

