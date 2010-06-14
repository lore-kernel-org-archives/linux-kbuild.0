Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55552 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751743Ab0FNMTd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Jun 2010 08:19:33 -0400
Message-ID: <4C161E54.2050105@suse.cz>
Date: Mon, 14 Jun 2010 14:19:32 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] kbuild: fix LOCALVERSION handling to match description
References: <1276508470-21731-1-git-send-email-apw@canonical.com>
In-Reply-To: <1276508470-21731-1-git-send-email-apw@canonical.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Whitcroft <apw@canonical.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, David Rientjes <rientjes@google.com>

On 14.6.2010 11:41, Andy Whitcroft wrote:
> In the commit below the version string handling was modified, adding
> a '+' where no other version information was supplied:
> 
>     commit 85a256d8e0116c8f5ad276730830f5d4d473344d
>     Author: David Rientjes <rientjes@google.com>
>     Date:   Wed Jan 13 13:01:05 2010 -0800
> 
> From the commit the intent was as below:
> 
>      - when CONFIG_LOCALVERSION_AUTO is disabled, a `+' is appended if the
>        repository has been revised beyond a tagged commit and LOCALVERSION=
>        was not passed to "make".
> 
> However if the user supplies an empty LOCALVERSION on the command line
> the plus suffix is still added.  This form is useful in the case where
> the build environment knows that the version as specified is correct and
> complete but does not correspond to a specific tag.
> 
> This patch changes the implementation to match the documentation
> such that specifying LOCALVERSION= on the build line is sufficient
> to suppress any suffix.
> 
> Signed-off-by: Andy Whitcroft <apw@canonical.com>
> ---
>  Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d49d96c..662e820 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -944,7 +944,7 @@ ifdef CONFIG_LOCALVERSION_AUTO
>  	localver-extra = $(scm-identifier)
>  else
>  	ifneq ($(scm-identifier),)
> -		ifeq ($(LOCALVERSION),)
> +		ifeq ("$(origin LOCALVERSION)", "undefined")
>  			localver-extra = +
>  		endif
>  	endif

David, do you Ack this change? To me this seems like a reasonable
compromise.

Michal

