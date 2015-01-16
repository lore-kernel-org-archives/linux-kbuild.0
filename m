Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10]:62392 "EHLO
	cpsmtpb-ews07.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752894AbbAPQZe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jan 2015 11:25:34 -0500
Message-ID: <1421425532.8562.32.camel@x220>
Subject: Re: [PATCH v2 1/2] kconfig: don't silently ignore unhandled
 characters
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 16 Jan 2015 17:25:32 +0100
In-Reply-To: <54B93FE60200007800055E84@mail.emea.novell.com>
References: <54B93FE60200007800055E84@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>

On Fri, 2015-01-16 at 15:44 +0000, Jan Beulich wrote:
> At the very least we should tell people that waht they wrote is not
                                               what

> what the utility understands.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> v2: printf() -> fprintf(stderr, ) upon Paul Bolle's request. Replace
>     two instances of double backslash line continuations with single
>     ones in sound/soc/intel/Kconfig.
> ---
>  scripts/kconfig/zconf.l             |    7 +
>  scripts/kconfig/zconf.lex.c_shipped |  195 +++++++++++++++++++-----------------
>  sound/soc/intel/Kconfig             |    4 

I guess Michal would like to split the c_shipped changes in this patch
too. (I personally don't care.) And I think the sound/soc/intel/Kconfig
should be a separate patch. 

>  3 files changed, 115 insertions(+), 91 deletions(-)
> 
> --- 3.19-rc4-kconfig.orig/scripts/kconfig/zconf.l
> +++ 3.19-rc4-kconfig/scripts/kconfig/zconf.l
> @@ -141,7 +141,12 @@ n	[A-Za-z0-9_]
>  	}
>  	#.*	/* comment */
>  	\\\n	current_file->lineno++;
> -	.
> +	[[:blank:]]+
> +	.	{

(Side note: I can't read lex, so is there a reason the dot is on a new
line? And I'm lazy too: what happens if you drop "[[:blank:]]+". In
other words: why was it added?) 

> +		fprintf(stderr,
> +		        "%s:%d:warning: ignoring unsupported character '%c'\n",
> +		        zconf_curname(), zconf_lineno(), *yytext);
> +	}
>  	<<EOF>> {
>  		BEGIN(INITIAL);
>  	}

Thanks!


Paul Bolle

