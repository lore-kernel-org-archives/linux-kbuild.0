Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:38142 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752377Ab1GOPnx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Jul 2011 11:43:53 -0400
Date: Fri, 15 Jul 2011 08:43:50 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] kconfig: fix missing "0x" prefix from S_HEX symbol in
 autoconf.h
Message-Id: <20110715084350.efb30257.rdunlap@xenotime.net>
In-Reply-To: <1310671867-5107-1-git-send-email-lacombar@gmail.com>
References: <1310671867-5107-1-git-send-email-lacombar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Mauro Carvalho Chehab <mchehab@infradead.org>

On Thu, 14 Jul 2011 15:31:07 -0400 Arnaud Lacombe wrote:

> The specialized printer for headers (espectially autoconf.h) is missing fixup
> code for S_HEX symbol's "0x" prefix. As long as kconfig does not warn for such
> missing prefix, this code is needed. Fix this.
> 
> In the same time, fix some nits in `header_print_symbol()'.
> 
> Cc: Randy Dunlap <rdunlap@xenotime.net>
> Cc: Mauro Carvalho Chehab <mchehab@infradead.org>
> 
> Broken-by: Arnaud Lacombe <lacombar@gmail.com>
> (Somehow-)Reported-by: Randy Dunlap <rdunlap@xenotime.net>

http://marc.info/?l=linux-next&m=130981163121463&w=2

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> Reported-by: Mauro Carvalho Chehab <mchehab@infradead.org>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> 
> ---
>  scripts/kconfig/confdata.c |   26 +++++++++++++++++++++-----
>  1 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index be6952c..df629ec 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -487,27 +487,43 @@ static struct conf_printer kconfig_printer_cb =
>  static void
>  header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
>  {
> -	const char *suffix = "";
>  
>  	switch (sym->type) {
>  	case S_BOOLEAN:
> -	case S_TRISTATE:
> +	case S_TRISTATE: {
> +		const char *suffix = "";
> +
>  		switch (*value) {
>  		case 'n':
>  			return;
>  		case 'm':
>  			suffix = "_MODULE";
> -			/* FALLTHROUGH */
> +			/* fall through */
>  		default:
>  			value = "1";
>  		}
> +		fprintf(fp, "#define %s%s%s %s\n",
> +		    CONFIG_, sym->name, suffix, value);
> +		break;
> +	}
> +	case S_HEX: {
> +		const char *prefix = "";
> +
> +		if (value[0] != '0' || (value[1] != 'x' && value[1] != 'X'))
> +			prefix = "0x";
> +		fprintf(fp, "#define %s%s %s%s\n",
> +		    CONFIG_, sym->name, prefix, value);
> +		break;
> +	}
> +	case S_STRING:
> +	case S_INT:
> +		fprintf(fp, "#define %s%s %s\n",
> +		    CONFIG_, sym->name, value);
>  		break;
>  	default:
>  		break;
>  	}
>  
> -	fprintf(fp, "#define %s%s%s %s\n",
> -	    CONFIG_, sym->name, suffix, value);
>  }
>  
>  static void
> -- 
> 1.7.3.4.574.g608b.dirty
> 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
