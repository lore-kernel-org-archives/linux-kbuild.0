Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:18591 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751726AbcLFMEY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Dec 2016 07:04:24 -0500
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] tags: honor COMPILED_SOURCE with apart output directory
References: <1476736079-11963-1-git-send-email-robert.jarzmik@free.fr>
Date: Tue, 06 Dec 2016 12:54:54 +0100
In-Reply-To: <1476736079-11963-1-git-send-email-robert.jarzmik@free.fr>
        (Robert Jarzmik's message of "Mon, 17 Oct 2016 22:27:59 +0200")
Message-ID: <8737i12rxt.fsf@belgarion.home>
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
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Hi Marek, ping about this patch ?

Cheers.

--
Robert

PS: The patch content top-posted
> ---
>  scripts/tags.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index b3775a9604ea..c0220fa05617 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -106,7 +106,9 @@ all_compiled_sources()
>  		case "$i" in
>  			*.[cS])
>  				j=${i/\.[cS]/\.o}
> -				if [ -e $j ]; then
> +				k=${i/"$tree"/"$O"\/}
> +				k=${k/\.[cS]/\.o}
> +				if [ -e $j -o -e "$k" ]; then
>  					echo $i
>  				fi
>  				;;
