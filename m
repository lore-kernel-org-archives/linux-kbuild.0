Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:58492 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932456Ab1GNXUn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 Jul 2011 19:20:43 -0400
Message-ID: <4E1F79C5.9080301@infradead.org>
Date: Thu, 14 Jul 2011 20:20:37 -0300
From: Mauro Carvalho Chehab <mchehab@infradead.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: fix missing "0x" prefix from S_HEX symbol in
 autoconf.h
References: <1310671867-5107-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1310671867-5107-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@xenotime.net>

Em 14-07-2011 16:31, Arnaud Lacombe escreveu:
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
> Reported-by: Mauro Carvalho Chehab <mchehab@infradead.org>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

Patch looks good for me.

Feel free to add my ack, if you want.

Acked-by: Mauro Carvalho Chehab <mchehab@redhat.com>
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

