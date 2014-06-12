Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41427 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932506AbaFLIbk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Jun 2014 04:31:40 -0400
Message-ID: <539963D4.3040409@suse.cz>
Date: Thu, 12 Jun 2014 10:24:52 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/Makefile.clean: clean also $(extra-m) and $(extra-)
References: <1402019035-2190-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402019035-2190-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

Dne 6.6.2014 03:43, Masahiro Yamada napsal(a):
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  scripts/Makefile.clean | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
> index 686cb0d..a651cee 100644
> --- a/scripts/Makefile.clean
> +++ b/scripts/Makefile.clean
> @@ -40,8 +40,8 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
>  # build a list of files to remove, usually relative to the current
>  # directory
>  
> -__clean-files	:= $(extra-y) $(always)                  \
> -		   $(targets) $(clean-files)             \
> +__clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
> +		   $(always) $(targets) $(clean-files)   \

Do you have an example where generated files are left in the tree after
make clean? This should go into the changelog.


Dne 12.6.2014 07:46, Masahiro Yamada napsal(a):> Hi Michal,
> If possible, please consider to include this patch in GIT-PULL.

Sorry,  I need to do a cut off at some point :). I'll merge it right
after the merge window. If you provide a reproducer in the changelog,
I'll send it to Linus for the next -rc.

Michal
