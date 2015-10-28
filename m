Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42522 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752330AbbJ1H2T (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 03:28:19 -0400
Date: Wed, 28 Oct 2015 16:28:08 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 08/10] merge_config.sh: use trap for cleanup
Message-ID: <20151028072808.GM1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-9-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-9-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:09AM +0900, Olof Johansson wrote:
> Use the trap to cleanup even on regular exit.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>

Looks like this should trade spots in the series with 9 where CLEAN_FILES is
defined. Otherwise:

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  scripts/kconfig/merge_config.sh | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 1945b2c..b26c0ef 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -23,10 +23,12 @@
>  EXITVAL=0
>  
>  clean_up() {
> -	rm -f $TMP_FILE
> +	if [ -n "$CLEAN_FILES" ] ; then
> +		rm -f $CLEAN_FILES
> +	fi
>  	exit $EXITVAL
>  }
> -trap clean_up HUP INT TERM
> +trap clean_up HUP INT TERM EXIT
>  
>  usage() {
>  	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
> @@ -178,4 +180,4 @@ for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
>  	fi >&2
>  done
>  
> -clean_up
> +# Note: clean_up will run here due to EXIT being trapped
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
