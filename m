Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:11439 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752327Ab2CWDqP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Mar 2012 23:46:15 -0400
Message-ID: <4F6BF1D9.107@linux.intel.com>
Date: Thu, 22 Mar 2012 20:45:29 -0700
From: Darren Hart <dvhart@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] merge_config.sh: Add option to display redundant
 configs
References: <1332453949-5872-1-git-send-email-john.stultz@linaro.org> <1332453949-5872-3-git-send-email-john.stultz@linaro.org>
In-Reply-To: <1332453949-5872-3-git-send-email-john.stultz@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Bruce.Ashfield@windriver.com

A few spelling nitpics :-)

On 03/22/2012 03:05 PM, John Stultz wrote:
> Provide a -r option to display when fragments contain reundent

s/reundent/redundant/

> options
> 
> CC: Michal Marek <mmarek@suse.cz>
> CC: Bruce.Ashfield@windriver.com
> CC: Darren Hart <dvhart@linux.intel.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  scripts/kconfig/merge_config.sh |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index ceadf0e..d92edc3 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -31,10 +31,12 @@ usage() {
>  	echo "  -h    display this help text"
>  	echo "  -m    only merge the fragments, do not execute the make command"
>  	echo "  -n    use allnoconfig instead of alldefconfig"
> +	echo "  -r    list redundant enteries when merging fragments"

s/enteries/entries/

>  }
>  
>  MAKE=true
>  ALLTARGET=alldefconfig
> +WARNREDUN=false
>  
>  while true; do
>  	case $1 in
> @@ -52,6 +54,11 @@ while true; do
>  		usage
>  		exit
>  		;;
> +	"-r")
> +		WARNREDUN=true
> +		shift
> +		continue
> +		;;
>  	*)
>  		break
>  		;;
> @@ -79,6 +86,10 @@ for MERGE_FILE in $MERGE_LIST ; do
>  			echo Previous  value: $PREV_VAL
>  			echo New value:       $NEW_VAL
>  			echo
> +			else

Can this just be an elif and avoid the nested if block?

> +			if [ "$WARNREDUN" = "true" ]; then
> +			echo Value of $CFG is redundant by fragment $MERGE_FILE:
> +			fi

No indentation... is that just my MUA?

>  			fi
>  			sed -i "/$CFG[ =]/d" $TMP_FILE
>  		fi

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
