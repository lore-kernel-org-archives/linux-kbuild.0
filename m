Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:54586 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750708AbdAWGY1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 01:24:27 -0500
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] tags: honor COMPILED_SOURCE with apart output directory
References: <1481819733-3002-1-git-send-email-robert.jarzmik@free.fr>
Date: Mon, 23 Jan 2017 07:22:54 +0100
In-Reply-To: <1481819733-3002-1-git-send-email-robert.jarzmik@free.fr> (Robert
        Jarzmik's message of "Thu, 15 Dec 2016 17:35:33 +0100")
Message-ID: <87lgu2cn29.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> When the kernel is compiled with an "O=" argument, the object files are
> not necessarily in the source tree, and more probably in another tree.
>
> In this situation, the current used check doesn't work, and
> COMPILED_SOURCE tags is broken with O= builds.
>
> This patch fixes it by looking for object files both in source tree and
> potential destination tree.
>
> It was verified that in the case of O= usage, the current directory is
> the build tree, ie. the tree referenced by O=xxx, and j is the source
> tree path concatenated with relative path of the object to the source
> tree root, hence the simple expression to compute "k" as the built
> object.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v1: amended k expression, Marek's comments
Hi Marek,

Is this version good for you ?

> ---
>  scripts/tags.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index a2ff3388e5ea..35cb64d5211c 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -106,7 +106,8 @@ all_compiled_sources()
>  		case "$i" in
>  			*.[cS])
>  				j=${i/\.[cS]/\.o}
> -				if [ -e $j ]; then
> +				k="${j#$tree}"
> +				if [ -e $j -o -e "$k" ]; then
>  					echo $i
>  				fi
>  				;;

Cheers.

-- 
Robert
