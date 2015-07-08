Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34621 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755061AbbGHUOc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 16:14:32 -0400
MIME-Version: 1.0
In-Reply-To: <5a5844d23d18500aacbed671fd0c77019f5e32bd.1436264921.git.andreas.ruprecht@fau.de>
References: <cover.1436264921.git.andreas.ruprecht@fau.de>
	<5a5844d23d18500aacbed671fd0c77019f5e32bd.1436264921.git.andreas.ruprecht@fau.de>
Date: Wed, 8 Jul 2015 22:14:31 +0200
Message-ID: <CAEMqcmq4eZ7ohuRSyAnRwraBm4Pp4eqkwaE1krucoqckGQ0xVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kconfig: warn of unhandled characters in Kconfig commands
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

On Tue, Jul 7, 2015 at 12:31 PM, Andreas Ruprecht
<andreas.ruprecht@fau.de> wrote:
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
> @@ -22,6 +22,7 @@ comment,      T_COMMENT,      TF_COMMAND
>  config,                T_CONFIG,       TF_COMMAND
>  menuconfig,    T_MENUCONFIG,   TF_COMMAND
>  help,          T_HELP,         TF_COMMAND
> +"---help---",   T_HELP,     TF_COMMAND
>  if,            T_IF,           TF_COMMAND|TF_PARAM
>  endif,         T_ENDIF,        TF_COMMAND
>  depends,       T_DEPENDS,      TF_COMMAND
> diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
> index 200a3fe..3078244 100644
> --- a/scripts/kconfig/zconf.l
> +++ b/scripts/kconfig/zconf.l
> @@ -66,9 +66,16 @@ static void alloc_string(const char *str, int size)
>         memcpy(text, str, size);
>         text[size] = 0;
>  }
> +
> +static void warn_ignored_character(const char chr)
> +{
> +       fprintf(stderr,
> +               "%s:%d:warning: ignoring unsupported character '%c'\n",
> +               zconf_curname(), zconf_lineno(), chr);
> +}

Was the 'const' on the non-pointer 'chr' parameter intended here?

>  %}
>
> -n      [A-Za-z0-9_]
> +n      [A-Za-z0-9_-]
>
>  %%
>         int str = 0;
> @@ -106,7 +113,9 @@ n   [A-Za-z0-9_]
>                 zconflval.string = text;
>                 return T_WORD;
>         }
> -       .
> +       .       {
> +               warn_ignored_character(*yytext);
> +       }
>         \n      {
>                 BEGIN(INITIAL);
>                 current_file->lineno++;
> @@ -132,7 +141,6 @@ n   [A-Za-z0-9_]
>                 BEGIN(STRING);
>         }
>         \n      BEGIN(INITIAL); current_file->lineno++; return T_EOL;
> -       ---     /* ignore */
>         ({n}|[-/.])+    {

Removing '-' from [-/.] too works fine on my system (Flex 2.5.39, Bison 3.0.2,
as shipped with Ubuntu 15.04). What problems did you run into?

>                 const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
>                 if (id && id->flags & TF_PARAM) {
> @@ -147,9 +155,7 @@ n   [A-Za-z0-9_]
>         \\\n    current_file->lineno++;
>         [[:blank:]]+
>         .       {
> -               fprintf(stderr,
> -                       "%s:%d:warning: ignoring unsupported character '%c'\n",
> -                       zconf_curname(), zconf_lineno(), *yytext);
> +               warn_ignored_character(*yytext);
>         }
>         <<EOF>> {
>                 BEGIN(INITIAL);
> --
> 1.9.1
>

Cheers,
Ulf
