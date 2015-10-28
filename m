Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58363 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754777AbbJ1Ggo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 02:36:44 -0400
Date: Wed, 28 Oct 2015 15:36:33 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 06/10] merge_config.sh: only consider last value of
 symbols
Message-ID: <20151028063633.GH1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-7-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-7-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:07AM +0900, Olof Johansson wrote:

Needs a commit message here that says (I think): Avoid mangled error output by
collecting only the last value. Warnings are still issued when overrides occur.

Agreed on the change though.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 933f2d6..1945b2c 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -39,7 +39,7 @@ usage() {
>  }
>  
>  getval() {
> -	grep -w -e "$1" "$2" | sed 's/^CONFIG_\(.*\)=n$/# CONFIG_\1 is not set/g'
> +	grep -w -e "$1" "$2" | tail -1 | sed 's/^CONFIG_\(.*\)=n/# CONFIG_\1 is not set/g'
>  }
>  
>  CONF_IS_ERR=false
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
