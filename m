Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:47980 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725724AbeKHFId (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Nov 2018 00:08:33 -0500
Date: Wed, 7 Nov 2018 11:36:43 -0800
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] scripts/kconfig/merge_config: don't redefine 'y' to 'm'
Message-ID: <20181107193643.GB95239@fedora.eng.vmware.com>
References: <20181102114119.23859-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181102114119.23859-1-anders.roxell@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de

On Fri, Nov 02, 2018 at 12:41:19PM +0100, Anders Roxell wrote:
> In today's merge_config.sh the order of the config fragment files dictates
> the output of a config option. With this approach we will get different
> .config files depending on the order of the config fragment files.
> Adding a switch to add precedence for builtin over modules, this will
> make the .config file the same
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the patch Anders!

> ---
>  scripts/kconfig/merge_config.sh | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index da66e7742282..902a60b45614 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -32,6 +32,7 @@ usage() {
>  	echo "  -m    only merge the fragments, do not execute the make command"
>  	echo "  -n    use allnoconfig instead of alldefconfig"
>  	echo "  -r    list redundant entries when merging fragments"
> +	echo "  -y    make builtin have precedence over modules"
>  	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
>  	echo
>  	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
> @@ -40,6 +41,7 @@ usage() {
>  RUNMAKE=true
>  ALLTARGET=alldefconfig
>  WARNREDUN=false
> +BUILTIN=false
>  OUTPUT=.
>  CONFIG_PREFIX=${CONFIG_-CONFIG_}
>  
> @@ -64,6 +66,11 @@ while true; do
>  		shift
>  		continue
>  		;;
> +	"-y")
> +		BUILTIN=true
> +		shift
> +		continue
> +		;;
>  	"-O")
>  		if [ -d $2 ];then
>  			OUTPUT=$(echo $2 | sed 's/\/*$//')
> @@ -122,7 +129,13 @@ for MERGE_FILE in $MERGE_LIST ; do
>  		grep -q -w $CFG $TMP_FILE || continue
>  		PREV_VAL=$(grep -w $CFG $TMP_FILE)
>  		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
> -		if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
> +		if test "$BUILTIN" = "true" && echo $PREV_VAL |grep -Eq '^\w+=y' && echo $NEW_VAL |grep -Eq '^\w+=m' ; then

I think we can avoid the rather lengthy/forky "echo | grep" mechanism
with POSIX substring parameter expansion (should work in bash, dash,
etc.).

http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#tag_02_06_02

We can also be more consistent with the other tests in the script, consider:

		if [ "$BUILTIN" = "true" ] && [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; then


> +			echo Value of $CFG is \'y\' and we don\'t want to redefine the fragment $MERGE_FILE:

I think we can drop the above and perhaps update the last line with...

> +			echo Previous  value: $PREV_VAL
> +			echo New value:       $NEW_VAL
> +			echo Will use previous value.

echo "-y passed, will not demote y to m"

Or something along those lines.

> +			echo
> +		elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
>  			echo Value of $CFG is redefined by fragment $MERGE_FILE:
>  			echo Previous  value: $PREV_VAL
>  			echo New value:       $NEW_VAL
> -- 
> 2.11.0
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
