Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:53792 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751905AbbGEKAs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Jul 2015 06:00:48 -0400
Message-ID: <1436002433.20057.49.camel@tiscali.nl>
Subject: Re: [PATCH 1/2] kconfig: also warn of unhandled characters in
 statements
From: Paul Bolle <pebolle@tiscali.nl>
Date: Sat, 04 Jul 2015 11:33:53 +0200
In-Reply-To: <a2424e6c57a4d6c38369c393ba58e0d050b7c130.1435927467.git.andreas.ruprecht@fau.de>
References: <cover.1435927467.git.andreas.ruprecht@fau.de>
	 <a2424e6c57a4d6c38369c393ba58e0d050b7c130.1435927467.git.andreas.ruprecht@fau.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>, Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

On vr, 2015-07-03 at 14:46 +0200, Andreas Ruprecht wrote:
> While commit 2e0d737fc76f ("kconfig: don't silently ignore unhandled
> characters") introduced a warning for unsupported characters inside
> parameters,

What are "parameters"? The term doesn't show up in Documentation/kbuild.

There's TF_PARAM in zconf.gperf, but that's some odd category that
apparently only includes "on" and "if". zconf.l only has the
undocumented PARAM state.

> it does not cover situations where a statement
> has additional characters around it.
> 
> This change introduces a warning if superfluous characters are found
> around statements. As the 'help' statement sometimes is written as
> '---help---', the '-' character would now also be regarded as
> unhandled, this change also adds a special rule for this case.

         [...], but '-' characters will now also generate a warning,
  add a special rule for that case.

or something along those lines.

Should we elaborate here that currently "---help---" only is an alias
for "help" because we simply skip "---" when parsing Kconfig files? Or
is that trick so obscure that nobody else will care about it?

> Reported-by: Valentin Rothberg <valentinrothberg@gmail.com>
> Signed-off-by: Andreas Ruprecht <andreas.ruprecht@fau.de>
> ---
>  scripts/kconfig/zconf.l | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
> index 200a3fe..84a5d05 100644
> --- a/scripts/kconfig/zconf.l
> +++ b/scripts/kconfig/zconf.l
> @@ -106,7 +106,15 @@ n	[A-Za-z0-9_]
>  		zconflval.string = text;
>  		return T_WORD;
>  	}
> -	.
> +	"---help---"	{
> +		/* Support old syntax for help statement */

s/old/alternative/?

> +		return T_HELP;
> +	}
> +	.	{
> +		fprintf(stderr,
> +		        "%s:%d:warning: ignoring unsupported character '%c'\n",
> +		        zconf_curname(), zconf_lineno(), *yytext);
> +	}

Could you add and use a small helper function for this warning and the
identical warning that was added in commit 2e0d737fc76f?

>  	\n	{
>  		BEGIN(INITIAL);
>  		current_file->lineno++;
> @@ -132,7 +140,6 @@ n	[A-Za-z0-9_]
>  		BEGIN(STRING);
>  	}
>  	\n	BEGIN(INITIAL); current_file->lineno++; return T_EOL;
> -	---	/* ignore */
>  	({n}|[-/.])+	{
>  		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
>  		if (id && id->flags & TF_PARAM) {

Thanks,


Paul Bolle
