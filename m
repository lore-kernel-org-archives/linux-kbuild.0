Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:27186 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752377AbaFFP2v (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Jun 2014 11:28:51 -0400
Date: Fri, 6 Jun 2014 11:28:47 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 2/7] scripts: objdiff: direct error messages to stderr
Message-ID: <20140606152847.GJ8664@titan.lakedaemon.net>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
 <1401448315-800-3-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401448315-800-3-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

Masahiro,

Thanks for the patch series!

On Fri, May 30, 2014 at 08:11:50PM +0900, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> ---
>  scripts/objdiff | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/objdiff b/scripts/objdiff
> index b8f7fc6..cc67365 100755
> --- a/scripts/objdiff
> +++ b/scripts/objdiff
> @@ -28,17 +28,17 @@
>  SRCTREE=$(git rev-parse --show-toplevel 2>/dev/null)
>  
>  if [ -z "$SRCTREE" ]; then
> -	echo "ERROR: Not a git repository."
> +	echo >&2 "ERROR: Not a git repository."
>  	exit 1
>  fi
>  
>  TMPD=$SRCTREE/.tmp_objdiff
>  
>  usage() {
> -	echo "Usage: $0 <command> <args>"
> -	echo "  record    <list of object files>"
> -	echo "  diff      <commitA> <commitB>"
> -	echo "  clean     all | <commit>"
> +	echo >&2 "Usage: $0 <command> <args>"
> +	echo >&2 "  record    <list of object files>"
> +	echo >&2 "  diff      <commitA> <commitB>"
> +	echo >&2 "  clean     all | <commit>"

I must admit I've never seen it written this way, but my CDO [1]
definitely likes it :)

>  	exit 1
>  }
>  
> @@ -88,12 +88,12 @@ dodiff() {
>  	DSTD="$TMPD/$DST"
>  
>  	if [ ! -d "$SRCD" ]; then
> -		echo "ERROR: $SRCD doesn't exist"
> +		echo >&2 "ERROR: $SRCD doesn't exist"
>  		exit 1
>  	fi
>  
>  	if [ ! -d "$DSTD" ]; then
> -		echo "ERROR: $DSTD doesn't exist"
> +		echo >&2 "ERROR: $DSTD doesn't exist"
>  		exit 1
>  	fi
>  
> @@ -112,7 +112,7 @@ doclean() {
>  		if [ -d "$TMPD/$CMT" ]; then
>  			rm -rf $TMPD/$CMT
>  		else
> -			echo "$CMT not found"
> +			echo >&2 "$CMT not found"
>  		fi
>  	fi
>  }
> @@ -133,7 +133,7 @@ case "$1" in
>  		doclean $*
>  		;;
>  	*)
> -		echo "Unrecognized command '$1'"
> +		echo >&2 "Unrecognized command '$1'"
>  		exit 1
>  		;;
>  esac


thx,

Jason.

[1] CDO: OCD with the letters neatly arranged in alphabetical order.
