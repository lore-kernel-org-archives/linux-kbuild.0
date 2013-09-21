Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:54067 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751862Ab3IUXBd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Sep 2013 19:01:33 -0400
Date: Sun, 22 Sep 2013 01:01:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] Documentation/kbuild/kconfig.txt: Doesn't make
 listnewconfig replacing yes "" | make oldconfig ?
Message-ID: <20130921230127.GB3221@free.fr>
References: <20130912003548.GF8821@nt1.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20130912003548.GF8821@nt1.in>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Regid Ichira <regid23@nt1.in>
Cc: Michal Marek <mmarek@suse.cz>, Rob Landley <rob@landley.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Regid, All,

On 2013-09-12 03:35 +0300, Regid Ichira spake thusly:
> Signed-off-by: Regid Ichira <regid23@nt1.in>
> ---
>  Documentation/kbuild/kconfig.txt | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

There was a trailing whitespace. I fixed it here, and pulled it in my
tree for -next.

Thanks!

Regards,
Yann E. MORIN.

> diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
> index 8ef6dbb..14cc40c 100644
> --- a/Documentation/kbuild/kconfig.txt
> +++ b/Documentation/kbuild/kconfig.txt
> @@ -20,16 +20,9 @@ symbols have been introduced.
>  To see a list of new config symbols when using "make oldconfig", use
>  
>  	cp user/some/old.config .config
> -	yes "" | make oldconfig >conf.new
> +	make listnewconfig 
   trailing whitespace ---^

>  
> -and the config program will list as (NEW) any new symbols that have
> -unknown values.  Of course, the .config file is also updated with
> -new (default) values, so you can use:
> -
> -	grep "(NEW)" conf.new
> -
> -to see the new config symbols or you can use diffconfig to see the
> -differences between the previous and new .config files:
> +and the config program will list any new symbols, one per line.
>  
>  	scripts/diffconfig .config.old .config | less
>  
> -- 
> 1.8.4.rc3
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
