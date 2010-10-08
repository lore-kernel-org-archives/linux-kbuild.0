Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47651 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752942Ab0JHOER (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Oct 2010 10:04:17 -0400
Message-ID: <4CAF24DF.4090002@suse.cz>
Date: Fri, 08 Oct 2010 16:04:15 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Fix LOCALVERSION append plus logic
References: <1286482732-12087-1-git-send-email-alan.tull@freescale.com>
In-Reply-To: <1286482732-12087-1-git-send-email-alan.tull@freescale.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: alan.tull@freescale.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 7.10.2010 22:18, alan.tull@freescale.com wrote:
> From: Alan Tull <alan.tull@freescale.com>
> 
> This change fixes the logic to do what the comment says
> when CONFIG_LOCALVERSION_AUTO and CONFIG_LOCALVERSION are
> both not set.
> 
> Also fix a spelling error in the comment.
> 
> If the kernel tree is in git, here's the config
> permutations (with CONFIG_LOCALVERSION_AUTO turned off)
> and the image name resulting:
> 
> CONFIG_LOCALVERSION=""
> results:
> patched   :   Linux-2.6.35.3+

That's a result of patching the kernel and thus moving away from the
v2.6.35.3 tag.


> unpatched :   Linux-2.6.35.3
> 
> CONFIG_LOCALVERSION="-something"
> results:
> patched   :   Linux-2.6.35.3-something
> unpatched :   Linux-2.6.35.3-something+

Dunno how you got this, was it really a clean 2.6.35.3?


> Signed-off-by: Alan Tull <alan.tull@freescale.com>
> ---
>  scripts/setlocalversion |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
> index 64a9cb5..4488a33 100755
> --- a/scripts/setlocalversion
> +++ b/scripts/setlocalversion
> @@ -160,9 +160,9 @@ if test "$CONFIG_LOCALVERSION_AUTO" = "y"; then
>  	# full scm version string
>  	res="$res$(scm_version)"
>  else
> -	# apped a plus sign if the repository is not in a clean tagged
> +	# append a plus sign if the repository is not in a clean tagged
>  	# state and  LOCALVERSION= is not specified
> -	if test "${LOCALVERSION+set}" != "set"; then
> +	if test "$CONFIG_LOCALVERSION" = ""; then
>  		scm=$(scm_version --short)
>  		res="$res${scm:++}"
>  	fi

CONFIG_LOCALVERSION does not play any role here, the documented way to
disable the plus sign is the LOCALVERSION environment or make variable:

make LOCALVERSION= all

Michal
