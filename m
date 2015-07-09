Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:32868 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753046AbbGIRww (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Jul 2015 13:52:52 -0400
Date: Thu, 9 Jul 2015 19:52:42 +0200
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: Re: [PATCH v2 1/2] kconfig: warn of unhandled characters in Kconfig
 commands
Message-ID: <20150709175242.GA8271@huvuddator>
References: <cover.1436264921.git.andreas.ruprecht@fau.de>
 <5a5844d23d18500aacbed671fd0c77019f5e32bd.1436264921.git.andreas.ruprecht@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5a5844d23d18500aacbed671fd0c77019f5e32bd.1436264921.git.andreas.ruprecht@fau.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

One more nitpick:

On Tue, Jul 07, 2015 at 12:31:16PM +0200, Andreas Ruprecht wrote:
> In Kconfig, definitions of options take the following form:
> "<COMMAND> <PARAM> <PARAM> ...". COMMANDs and PARAMs are treated
> slightly different by the underlying parser.
> 
> While commit 2e0d737fc76f ("kconfig: don't silently ignore unhandled
> characters") introduced a warning for unsupported characters around
> PARAMs, it does not cover situations where a COMMAND has additional
> characters around it.
> 
> This change makes Kconfig emit a warning if superfluous characters
> are found around COMMANDs. As the 'help' statement sometimes is
> written as '---help---', the '-' character would now also be regarded
> as unhandled and generate a warning. To avoid that, '-' is added to
> the list of allowed characters, and the token '---help---' is included
> in the zconf.gperf file.
> 
> Reported-by: Valentin Rothberg <valentinrothberg@gmail.com>
> Signed-off-by: Andreas Ruprecht <andreas.ruprecht@fau.de>
> ---
>  scripts/kconfig/zconf.gperf |  1 +
>  scripts/kconfig/zconf.l     | 18 ++++++++++++------
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/kconfig/zconf.gperf b/scripts/kconfig/zconf.gperf
> index b6ac02d..7aceb7b 100644
> --- a/scripts/kconfig/zconf.gperf
> +++ b/scripts/kconfig/zconf.gperf
> @@ -22,6 +22,7 @@ comment,	T_COMMENT,	TF_COMMAND
>  config,		T_CONFIG,	TF_COMMAND
>  menuconfig,	T_MENUCONFIG,	TF_COMMAND
>  help,		T_HELP,		TF_COMMAND
> +"---help---",   T_HELP,     TF_COMMAND
>  if,		T_IF,		TF_COMMAND|TF_PARAM
>  endif,		T_ENDIF,	TF_COMMAND
>  depends,	T_DEPENDS,	TF_COMMAND
> diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
> index 200a3fe..3078244 100644
> --- a/scripts/kconfig/zconf.l
> +++ b/scripts/kconfig/zconf.l
> @@ -66,9 +66,16 @@ static void alloc_string(const char *str, int size)
>  	memcpy(text, str, size);
>  	text[size] = 0;
>  }
> +
> +static void warn_ignored_character(const char chr)
> +{
> +	fprintf(stderr,
> +	        "%s:%d:warning: ignoring unsupported character '%c'\n",
> +	        zconf_curname(), zconf_lineno(), chr);
> +}
>  %}
>  
> -n	[A-Za-z0-9_]
> +n	[A-Za-z0-9_-]
>  
>  %%
>  	int str = 0;
> @@ -106,7 +113,9 @@ n	[A-Za-z0-9_]
>  		zconflval.string = text;
>  		return T_WORD;
>  	}
> -	.
> +	.	{
> +		warn_ignored_character(*yytext);
> +	}

I'd shorten this to just

	.	warn_ignored_character(*yytext);

Not that the rest of zonf.l is very consistent.

>  	\n	{
>  		BEGIN(INITIAL);
>  		current_file->lineno++;
> @@ -132,7 +141,6 @@ n	[A-Za-z0-9_]
>  		BEGIN(STRING);
>  	}
>  	\n	BEGIN(INITIAL); current_file->lineno++; return T_EOL;
> -	---	/* ignore */
>  	({n}|[-/.])+	{
>  		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
>  		if (id && id->flags & TF_PARAM) {
> @@ -147,9 +155,7 @@ n	[A-Za-z0-9_]
>  	\\\n	current_file->lineno++;
>  	[[:blank:]]+
>  	.	{
> -		fprintf(stderr,
> -		        "%s:%d:warning: ignoring unsupported character '%c'\n",
> -		        zconf_curname(), zconf_lineno(), *yytext);
> +		warn_ignored_character(*yytext);
>  	}

Ditto.

>  	<<EOF>> {
>  		BEGIN(INITIAL);
> -- 
> 1.9.1
> 

Cheers,
Ulf
