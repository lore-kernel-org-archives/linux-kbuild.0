Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:43993 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751883AbaFFPfw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Jun 2014 11:35:52 -0400
Date: Fri, 6 Jun 2014 11:35:48 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 6/7] scripts: objdiff: fix a comment
Message-ID: <20140606153548.GL8664@titan.lakedaemon.net>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
 <1401448315-800-7-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401448315-800-7-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

On Fri, May 30, 2014 at 08:11:54PM +0900, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> ---
>  scripts/objdiff | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/objdiff b/scripts/objdiff
> index c997e44..4d3a197 100755
> --- a/scripts/objdiff
> +++ b/scripts/objdiff
> @@ -70,7 +70,7 @@ dorecord() {
>  
>  		[ ! -d "$dir" ] && mkdir -p $dir
>  
> -		# remove addresses for a more clear diff
> +		# remove addresses for a clearer diff

perhaps 'for a cleaner diff' ?  I have no strong opinion either way.

thx,

Jason.

>  		# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
>  		$OBJDUMP -D $f | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dis
>  	done
> -- 
> 1.9.1
> 
