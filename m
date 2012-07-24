Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:33537 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755139Ab2GXRj6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Jul 2012 13:39:58 -0400
Message-ID: <500EDDAF.4040506@xenotime.net>
Date: Tue, 24 Jul 2012 10:38:55 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: [PATCH] menuconfig: make keys u/d move to the previous/next dialog
 page
References: <1343139783-22776-1-git-send-email-bpoirier@suse.de>
In-Reply-To: <1343139783-22776-1-git-send-email-bpoirier@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.de>
Cc: Michal Marek <mmarek@suse.cz>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/24/2012 07:23 AM, Benjamin Poirier wrote:

> ... just like less(1) for example.
> 


Looks like some help text in mconf.c and nconf.c should be updated
also...


> Signed-off-by: Benjamin Poirier <bpoirier@suse.de>
> ---
>  scripts/kconfig/lxdialog/textbox.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/lxdialog/textbox.c
> index 154c2dd..805200f 100644
> --- a/scripts/kconfig/lxdialog/textbox.c
> +++ b/scripts/kconfig/lxdialog/textbox.c
> @@ -190,6 +190,7 @@ do_resize:
>  			break;
>  		case 'B':	/* Previous page */
>  		case 'b':
> +		case 'u':
>  		case KEY_PPAGE:
>  			if (begin_reached)
>  				break;
> @@ -214,6 +215,7 @@ do_resize:
>  			break;
>  		case KEY_NPAGE:	/* Next page */
>  		case ' ':
> +		case 'd':
>  			if (end_reached)
>  				break;
>  



-- 
~Randy
