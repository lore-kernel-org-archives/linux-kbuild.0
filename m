Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50982 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751509AbbJ1F40 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 01:56:26 -0400
Date: Wed, 28 Oct 2015 14:56:16 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 02/10] merge_config.sh: print warnings on stderr
Message-ID: <20151028055616.GD1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-3-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-3-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:03AM +0900, Olof Johansson wrote:
> Makes it easier to grab just errors/warnings in a build log.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>

I think this is the right change, I just want to make sure Bruce (Cc'd) sees it
for linux-yocto.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  scripts/kconfig/merge_config.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index d8cd913..0e98619 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -131,7 +131,7 @@ for MERGE_FILE in $MERGE_LIST ; do
>  			echo Value of $CFG is redundant by fragment $MERGE_FILE:
>  		fi
>  		sed -i "/$CFG[ =]/d" $TMP_FILE
> -	done
> +	done >&2
>  	cat $MERGE_FILE >> $TMP_FILE
>  done
>  
> @@ -168,7 +168,7 @@ for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
>  		echo "Requested value:  $REQUESTED_VAL"
>  		echo "Actual value:     $ACTUAL_VAL"
>  		echo ""
> -	fi
> +	fi >&2
>  done
>  
>  clean_up
> -- 
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 

-- 
Darren Hart
Intel Open Source Technology Center
