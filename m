Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57500 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933365AbbFWNxw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Jun 2015 09:53:52 -0400
Message-ID: <558964EE.7090009@suse.cz>
Date: Tue, 23 Jun 2015 15:53:50 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC 1/4] scripts: add stackusage script
References: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk> <1434849046-19920-2-git-send-email-linux@rasmusvillemoes.dk>
In-Reply-To: <1434849046-19920-2-git-send-email-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2015-06-21 03:10, Rasmus Villemoes wrote:
> The current checkstack.pl script has a few problems, stemming from the
> overly simplistic attempt at parsing objdump output with regular
> expresions: For example, on x86_64 it doesn't take the push
> instruction into account, making it consistently underestimate the
> real stack use, and it also doesn't capture stack pointer adjustments
> of exactly 128 bytes [1].
> 
> Since newer gcc (>= 4.6) knows about -fstack-usage, we might as well
> take the information straight from the horse's mouth. This patch
> introduces scripts/stackusage, which is a simple wrapper for running
> make with EXTRA_CFLAGS set to -fstack-usage. Example use is
> 
> scripts/stackusage -o out.su -- -j8 fs/ext4/
> 
> Arguments after -- are passed to make. Afterwards, we find all newly
> created .su files, massage them a little, sort by stack use and
> concatenate the result to a single output file.
> 
> [1] Since gcc encodes that by
> 
> 48 83 c4 80             add    $0xffffffffffffff80,%rsp
> 
> and not
> 
> 48 81 ec 80 00 00 00    sub    $0x80,%rsp
> 
> since -128 fits in an imm8.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  scripts/stackusage | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100755 scripts/stackusage
> 
> diff --git a/scripts/stackusage b/scripts/stackusage
> new file mode 100755
> index 000000000000..d631af648ae7
> --- /dev/null
> +++ b/scripts/stackusage
> @@ -0,0 +1,40 @@
> +#!/bin/sh
> +
> +outfile=""
> +now=`date +%s`
> +
> +while [ $# -gt 0 ]
> +do
> +    case "$1" in
> +        -o)
> +	    outfile="$2"
> +	    echo "$outfile"
> +	    shift 2;;
> +	-h)
> +	    echo "usage: $0 [-o outfile] -- <make options/args>"
> +	    exit 0;;
> +	--)
> +	    shift
> +	    break;;
> +	-*)
> +            echo >&2 "usage: $0 [-o outfile] -- <make options/args>"
> +	    exit 1;;
> +	*)  break;;
> +    esac
> +done
> +
> +if [ -z "$outfile" ]
> +then
> +    outfile=`mktemp --tmpdir stackusage.$$.XXXX`
> +fi
> +
> +make EXTRA_CFLAGS="-fstack-usage" "$@"

EXTRA_CFLAGS is reserved for use by Makefiles, please use KCFLAGS
instead. I wonder whether it worked at all, because EXTRA_CFLAGS is
reset by scripts/Makefile.build.

Michal
