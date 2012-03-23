Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:53388 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891Ab2CWNCo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Mar 2012 09:02:44 -0400
Message-ID: <4F6C7453.2090402@windriver.com>
Date: Fri, 23 Mar 2012 09:02:11 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] merge_config.sh: Add option to display redundant
 configs
References: <1332453949-5872-1-git-send-email-john.stultz@linaro.org> <1332453949-5872-3-git-send-email-john.stultz@linaro.org>
In-Reply-To: <1332453949-5872-3-git-send-email-john.stultz@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Darren Hart <dvhart@linux.intel.com>

On 12-03-22 06:05 PM, John Stultz wrote:
> Provide a -r option to display when fragments contain reundent
> options
>
> CC: Michal Marek<mmarek@suse.cz>
> CC: Bruce.Ashfield@windriver.com
> CC: Darren Hart<dvhart@linux.intel.com>
> Signed-off-by: John Stultz<john.stultz@linaro.org>

I've got a few similar tweaks that I'll dust off and send out
(but I'll likely miss this window), but this adds that little
prod needed to track down where the dup is coming from.

So I like the option.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Cheers,

Bruce

> ---
>   scripts/kconfig/merge_config.sh |   11 +++++++++++
>   1 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index ceadf0e..d92edc3 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -31,10 +31,12 @@ usage() {
>   	echo "  -h    display this help text"
>   	echo "  -m    only merge the fragments, do not execute the make command"
>   	echo "  -n    use allnoconfig instead of alldefconfig"
> +	echo "  -r    list redundant enteries when merging fragments"
>   }
>
>   MAKE=true
>   ALLTARGET=alldefconfig
> +WARNREDUN=false
>
>   while true; do
>   	case $1 in
> @@ -52,6 +54,11 @@ while true; do
>   		usage
>   		exit
>   		;;
> +	"-r")
> +		WARNREDUN=true
> +		shift
> +		continue
> +		;;
>   	*)
>   		break
>   		;;
> @@ -79,6 +86,10 @@ for MERGE_FILE in $MERGE_LIST ; do
>   			echo Previous  value: $PREV_VAL
>   			echo New value:       $NEW_VAL
>   			echo
> +			else
> +			if [ "$WARNREDUN" = "true" ]; then
> +			echo Value of $CFG is redundant by fragment $MERGE_FILE:
> +			fi
>   			fi
>   			sed -i "/$CFG[ =]/d" $TMP_FILE
>   		fi

