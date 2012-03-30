Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37619 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935794Ab2C3W1y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Mar 2012 18:27:54 -0400
Date: Fri, 30 Mar 2012 15:14:24 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 2/2] merge_config.sh: Add option to display redundant
 configs
Message-ID: <20120330131424.GA11444@sepie.suse.cz>
References: <1332532328-32529-1-git-send-email-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1332532328-32529-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Bruce.Ashfield@windriver.com, Darren Hart <dvhart@linux.intel.com>

On Fri, Mar 23, 2012 at 12:52:08PM -0700, John Stultz wrote:
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

Applied.


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

If you are using true/false for flag variables, then you can simply say

			elif $WARNREDUN; then

Michal
