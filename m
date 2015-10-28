Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49676 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752945AbbJ1FYs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 01:24:48 -0400
Date: Wed, 28 Oct 2015 14:24:34 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 01/10] merge_config.sh: factor out value parsing
Message-ID: <20151028052434.GC1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-2-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-2-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:02AM +0900, Olof Johansson wrote:
> Since we want to adjust the line later on to deal with CONFIG_FOO=n,
> let's make a function for it so we have only one place to change it in.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  scripts/kconfig/merge_config.sh | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 67d1314..d8cd913 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -35,6 +35,10 @@ usage() {
>  	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
>  }
>  
> +getval() {
> +	grep -w -e "$1" "$2"

So the inclusion of -e makes sense from a common-denominator perspective... but
is it necessary at all? It's not a big deal either way though. I believe we are
searching only for whole CONFIG_FEATURE options, not a pattern. However, this is
minimal change and is correct.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

> +}
> +
>  RUNMAKE=true
>  ALLTARGET=alldefconfig
>  WARNREDUN=false
> @@ -116,8 +120,8 @@ for MERGE_FILE in $MERGE_LIST ; do
>  
>  	for CFG in $CFG_LIST ; do
>  		grep -q -w $CFG $TMP_FILE || continue
> -		PREV_VAL=$(grep -w $CFG $TMP_FILE)
> -		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
> +		PREV_VAL=$(getval "$CFG" "$TMP_FILE")
> +		NEW_VAL=$(getval "$CFG" "$MERGE_FILE")
>  		if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
>  			echo Value of $CFG is redefined by fragment $MERGE_FILE:
>  			echo Previous  value: $PREV_VAL
> @@ -157,8 +161,8 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>  # Check all specified config values took (might have missed-dependency issues)
>  for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
>  
> -	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
> -	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
> +	REQUESTED_VAL=$(getval "$CFG" "$TMP_FILE")
> +	ACTUAL_VAL=$(getval "$CFG" "$KCONFIG_CONFIG")
>  	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
>  		echo "Value requested for $CFG not in final .config"
>  		echo "Requested value:  $REQUESTED_VAL"
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
