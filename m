Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:35951 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752017AbbGLBqp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Jul 2015 21:46:45 -0400
Date: Sun, 12 Jul 2015 03:46:37 +0200
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: Re: [PATCH v3 1/2] kconfig: warn of unhandled characters in Kconfig
 commands
Message-ID: <20150712014637.GA28517@huvuddator>
References: <cover.1436516211.git.andreas.ruprecht@fau.de>
 <855bbd871fe1c6b64f65d329501837ba1aff9b92.1436516211.git.andreas.ruprecht@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <855bbd871fe1c6b64f65d329501837ba1aff9b92.1436516211.git.andreas.ruprecht@fau.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

One more nitpick (should be the last one):

On Fri, Jul 10, 2015 at 10:25:32AM +0200, Andreas Ruprecht wrote:
> In Kconfig, definitions of options take the following form:
> "<COMMAND> <PARAM> <PARAM> ...". COMMANDs and PARAMs are treated
> slightly different by the underlying parser.
> 
> While commit 2e0d737fc76f ("kconfig: don't silently ignore unhandled
> characters") introduced a warning for unsupported characters around
> PARAMs, it does not cover situations where a COMMAND has additional
> characters before it.
> 
> This change makes Kconfig emit a warning if superfluous characters
> are found before COMMANDs. As the 'help' statement sometimes is
> written as '---help---', the '-' character would now also be regarded
> as unhandled and generate a warning. To avoid that, '-' is added to
> the list of allowed characters, and the token '---help---' is included
> in the zconf.gperf file.
> 
> Reported-by: Valentin Rothberg <valentinrothberg@gmail.com>
> Signed-off-by: Andreas Ruprecht <andreas.ruprecht@fau.de>
> ---
> Changes to v1:
> 	- add '---help---' in zconf.gperf instead of special casing
> 	  it in zconf.l
> 
> Changes to v2:
> 	- Do no constify char parameter to warn_ignored_character
> 	- Shorten rule definitions for '.'
> 
>  scripts/kconfig/zconf.gperf |  1 +
>  scripts/kconfig/zconf.l     | 20 +++++++++++---------
>  2 files changed, 12 insertions(+), 9 deletions(-)
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

I think the quotes are redundant here, and tabs instead of spaces would
be consistent with the other entries. Make sure everything lines up with
8-space tabstops.

>  if,		T_IF,		TF_COMMAND|TF_PARAM
>  endif,		T_ENDIF,	TF_COMMAND
>  depends,	T_DEPENDS,	TF_COMMAND
> diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
> index 200a3fe..c410d25 100644
> --- a/scripts/kconfig/zconf.l
> +++ b/scripts/kconfig/zconf.l
> @@ -66,9 +66,16 @@ static void alloc_string(const char *str, int size)
>  	memcpy(text, str, size);
>  	text[size] = 0;
>  }
> +
> +static void warn_ignored_character(char chr)
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
> @@ -106,7 +113,7 @@ n	[A-Za-z0-9_]
>  		zconflval.string = text;
>  		return T_WORD;
>  	}
> -	.
> +	.	warn_ignored_character(*yytext);
>  	\n	{
>  		BEGIN(INITIAL);
>  		current_file->lineno++;
> @@ -132,8 +139,7 @@ n	[A-Za-z0-9_]
>  		BEGIN(STRING);
>  	}
>  	\n	BEGIN(INITIAL); current_file->lineno++; return T_EOL;
> -	---	/* ignore */
> -	({n}|[-/.])+	{
> +	({n}|[/.])+	{
>  		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
>  		if (id && id->flags & TF_PARAM) {
>  			zconflval.id = id;
> @@ -146,11 +152,7 @@ n	[A-Za-z0-9_]
>  	#.*	/* comment */
>  	\\\n	current_file->lineno++;
>  	[[:blank:]]+
> -	.	{
> -		fprintf(stderr,
> -		        "%s:%d:warning: ignoring unsupported character '%c'\n",
> -		        zconf_curname(), zconf_lineno(), *yytext);
> -	}
> +	.	warn_ignored_character(*yytext);
>  	<<EOF>> {
>  		BEGIN(INITIAL);
>  	}
> -- 
> 1.9.1
> 

Cheers,
Ulf
