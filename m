Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:47110 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030231Ab2CWUZb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Mar 2012 16:25:31 -0400
Message-ID: <4F6CDC0E.3050000@linux.intel.com>
Date: Fri, 23 Mar 2012 13:24:46 -0700
From: Darren Hart <dvhart@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] merge_config.sh: Add option to display redundant
 configs
References: <1332532328-32529-1-git-send-email-john.stultz@linaro.org>
In-Reply-To: <1332532328-32529-1-git-send-email-john.stultz@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Bruce.Ashfield@windriver.com



On 03/23/2012 12:52 PM, John Stultz wrote:
> Provide a -r option to display when fragments contain redundant
> options. This is really useful when breaking apart a config into
> fragments, as well as cleaning up older fragments.
> 
> v2:
> Now w/ spelling fixes! Thanks Darren!
> 
> CC: Michal Marek <mmarek@suse.cz>
> CC: Bruce.Ashfield@windriver.com
> CC: Darren Hart <dvhart@linux.intel.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  scripts/kconfig/merge_config.sh |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index ceadf0e..ad8c76e 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -31,10 +31,12 @@ usage() {
>  	echo "  -h    display this help text"
>  	echo "  -m    only merge the fragments, do not execute the make command"
>  	echo "  -n    use allnoconfig instead of alldefconfig"
> +	echo "  -r    list redundant entries when merging fragments"
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
> @@ -79,6 +86,8 @@ for MERGE_FILE in $MERGE_LIST ; do
>  			echo Previous  value: $PREV_VAL
>  			echo New value:       $NEW_VAL
>  			echo
> +			elif [ "$WARNREDUN" = "true" ]; then
> +			echo Value of $CFG is redundant by fragment $MERGE_FILE:
>  			fi
>  			sed -i "/$CFG[ =]/d" $TMP_FILE
>  		fi

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
