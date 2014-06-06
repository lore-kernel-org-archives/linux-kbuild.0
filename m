Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:46714 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752117AbaFFPdV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Jun 2014 11:33:21 -0400
Date: Fri, 6 Jun 2014 11:33:18 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 4/7] scripts: objdiff: improve path flexibility for
 record command
Message-ID: <20140606153318.GK8664@titan.lakedaemon.net>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
 <1401448315-800-5-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401448315-800-5-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

On Fri, May 30, 2014 at 08:11:52PM +0900, Masahiro Yamada wrote:
> Prior to this commit, scripts/objdiff expected to be run at the top
> directory and only the reltive path of objects.

nit: s/reltive/relative/

thx,

Jason.

> This commit provides more flexibility in terms of object path:
> 
> [1] scripts/objdiff can be run at any directory
> 
> For example,
> 
>   $ scripts/objdiff record init/main.o
> 
> and
> 
>   $ cd init; ../scripts/objdiff record main.o
> 
> produce the same result.
> 
> [2] Support absolute path for objects
> 
>   $ scripts/objdiff record /home/foo/bar/linux/init/main.o
> 
> work as well.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> ---
>  scripts/objdiff | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/objdiff b/scripts/objdiff
> index 6e72f96..499eb4b 100755
> --- a/scripts/objdiff
> +++ b/scripts/objdiff
> @@ -25,7 +25,7 @@
>  #
>  # Note: 'make mrproper' will also remove .tmp_objdiff
>  
> -SRCTREE=$(git rev-parse --show-toplevel 2>/dev/null)
> +SRCTREE=$(cd $(git rev-parse --show-toplevel 2>/dev/null); pwd)
>  
>  if [ -z "$SRCTREE" ]; then
>  	echo >&2 "ERROR: Not a git repository."
> @@ -42,6 +42,18 @@ usage() {
>  	exit 1
>  }
>  
> +get_output_dir() {
> +	dir=${1%/*}
> +
> +	if [ "$dir" = "$1" ]; then
> +		dir=.
> +	fi
> +
> +	dir=$(cd $dir; pwd)
> +
> +	echo $TMPD/$CMT${dir#$SRCTREE}
> +}
> +
>  dorecord() {
>  	[ $# -eq 0 ] && usage
>  
> @@ -50,18 +62,16 @@ dorecord() {
>  	CMT="`git rev-parse --short HEAD`"
>  
>  	OBJDUMP="${CROSS_COMPILE}objdump"
> -	OBJDIFFD="$TMPD/$CMT"
>  
>  	for f in $FILES; do
> -		dn="${f%/*}"
> +		dir=$(get_output_dir $f)
>  		bn="${f##*/}"
>  
> -		[ ! -d "$OBJDIFFD/$dn" ] && mkdir -p "$OBJDIFFD/$dn"
> +		[ ! -d "$dir" ] && mkdir -p $dir
>  
>  		# remove addresses for a more clear diff
>  		# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
> -		$OBJDUMP -D "$f" | sed "s/^[[:space:]]\+[0-9a-f]\+//" \
> -			>"$OBJDIFFD/$dn/$bn"
> +		$OBJDUMP -D $f | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dir/$bn
>  	done
>  }
>  
> -- 
> 1.9.1
> 
