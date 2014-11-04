Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews01.kpnxchange.com ([213.75.39.4]:56510 "EHLO
	cpsmtpb-ews01.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752853AbaKDOGr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 09:06:47 -0500
Message-ID: <1415110006.20372.165.camel@x220>
Subject: Re: [PATCH 1/2] kconfig: don't silently ignore unhandled characters
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 04 Nov 2014 15:06:46 +0100
In-Reply-To: <5458A4FC0200007800044AC1@mail.emea.novell.com>
References: <5458A4FC0200007800044AC1@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On Tue, 2014-11-04 at 09:05 +0000, Jan Beulich wrote:
> At the very least we should tell people that waht they wrote is not
> what the utility understands.

Yes, we should change this. I'm inclined to think the should die with an
error on invalid syntax. Would that be too strict?  

Anyhow, seems to work as advertised:
    $ make ARCH=arm menuconfig
    [...]
    sound/soc/intel/Kconfig:40:warning: ignoring unsupported character '\'
    sound/soc/intel/Kconfig:70:warning: ignoring unsupported character '\'
    arch/arm/Kconfig.debug:1268:warning: ignoring unsupported character '>'

The soc/intel warnings are for doubled line continuations! You've earned
a Reported-by:, I guess.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>  scripts/kconfig/zconf.l             |    6 -
>  scripts/kconfig/zconf.lex.c_shipped |  194 +++++++++++++++++++-----------------
>  2 files changed, 111 insertions(+), 89 deletions(-)
> 
> --- 3.18-rc3-kconfig.orig/scripts/kconfig/zconf.l
> +++ 3.18-rc3-kconfig/scripts/kconfig/zconf.l
> @@ -141,7 +141,11 @@ n	[A-Za-z0-9_]
>  	}
>  	#.*	/* comment */
>  	\\\n	current_file->lineno++;
> -	.
> +	[[:blank:]]+
> +	.	{
> +		printf("%s:%d:warning: ignoring unsupported character '%c'\n",

                 fprintf(stderr, [...]?

> +		       zconf_curname(), zconf_lineno(), *yytext);
> +	}
>  	<<EOF>> {
>  		BEGIN(INITIAL);
>  	}
> --- 3.18-rc3-kconfig.orig/scripts/kconfig/zconf.lex.c_shipped
> +++ 3.18-rc3-kconfig/scripts/kconfig/zconf.lex.c_shipped
> @@ -414,14 +414,14 @@ static yyconst flex_int16_t yy_nxt[][17]
>      },
>  
>      {
> -       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
> -       33,   34,   35,   35,   36,   37,   38
> +       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
> +       34,   35,   36,   36,   37,   38,   39
>  
>      },
>  
>      {
> -       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
> -       33,   34,   35,   35,   36,   37,   38
> +       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
> +       34,   35,   36,   36,   37,   38,   39
>      },
>  
>      {

I guess we must trust that you manually edited this _shipped file
correctly.

>[...]
> @@ -920,7 +931,7 @@ static int input (void );
>  /* This used to be an fputs(), but since the string might contain NUL's,
>   * we now use fwrite().
>   */
> -#define ECHO do { if (fwrite( zconftext, zconfleng, 1, zconfout )) {} } while (0)
> +#define ECHO fwrite( zconftext, zconfleng, 1, zconfout )
>  #endif
>  
>  /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,

But this hunk looks unrelated. Is this needed?


Paul Bolle

