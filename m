Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:48316 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750856AbbDPThs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 15:37:48 -0400
Message-ID: <1429213062.16771.90.camel@x220>
Subject: Re: [PATCH] kbuild/tags.sh: use cscope -q option for building
 symbol db
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 16 Apr 2015 21:37:42 +0200
In-Reply-To: <1429211657-2486-1-git-send-email-jbarnes@virtuousgeek.org>
References: <1429211657-2486-1-git-send-email-jbarnes@virtuousgeek.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz

On Thu, 2015-04-16 at 12:14 -0700, Jesse Barnes wrote:
> This takes up a bit more disk space, but really improves symbol lookup
> performance.
> 
> Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
> ---
>  scripts/tags.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index cdb491d..bb35d83 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -142,7 +142,7 @@ all_defconfigs()
>  docscope()
>  {
>  	(echo \-k; echo \-q; all_target_sources) > cscope.files

There's an "echo -q" there.

> -	cscope -b -f cscope.out
> +	cscope -q -b -f cscope.out
>  }
>  
>  dogtags()

man cscope tells me:
    The -I, -c, -k, -p, -q, and -T options can also be in the cscope.files file

Doesn't the above do that correctly?


Paul Bolle

