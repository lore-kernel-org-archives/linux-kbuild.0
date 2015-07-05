Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35472 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbbGEIpB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Jul 2015 04:45:01 -0400
MIME-Version: 1.0
In-Reply-To: <a2424e6c57a4d6c38369c393ba58e0d050b7c130.1435927467.git.andreas.ruprecht@fau.de>
References: <cover.1435927467.git.andreas.ruprecht@fau.de>
	<a2424e6c57a4d6c38369c393ba58e0d050b7c130.1435927467.git.andreas.ruprecht@fau.de>
Date: Sun, 5 Jul 2015 08:06:33 +0200
Message-ID: <CAEMqcmrBWGFGTZXvASDXRtTUtb=5=q-b_9a3A_hQ8RC47zNhUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: also warn of unhandled characters in statements
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

A more exact commit title would be something like "warn for unhandled
characters before the initial token on a line".

On Fri, Jul 3, 2015 at 2:46 PM, Andreas Ruprecht
<andreas.ruprecht@fau.de> wrote:
> While commit 2e0d737fc76f ("kconfig: don't silently ignore unhandled
> characters") introduced a warning for unsupported characters inside
> parameters, it does not cover situations where a statement
> has additional characters around it.

This could say something like "...introduces a warning for unhandled characters
after the initial token on a line, but does not cover unhandled characters
before the initial token, which are ignored using a different mechanism."

>
> This change introduces a warning if superfluous characters are found
> around statements. As the 'help' statement sometimes is written as
> '---help---', the '-' character would now also be regarded as
> unhandled, this change also adds a special rule for this case.

Similarly above.

>
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
> @@ -106,7 +106,15 @@ n  [A-Za-z0-9_]
>                 zconflval.string = text;
>                 return T_WORD;
>         }
> -       .
> +       "---help---"    {
> +               /* Support old syntax for help statement */
> +               return T_HELP;
> +       }

I haven't tried it out to see if there would be problems, but adding '-' to the

n    [A-Za-z0-9_]

definition in zconf.l and adding '---help---' to zconf.gperf seems cleaner than
special-casing it in zconf.l. If '---help---' is treated as a token, then it
makes sense to include '-' among the token characters.

(I also rambled a bit in
http://www.spinics.net/lists/linux-kbuild/msg11393.html.)

With that change, '-' could be removed from the parameter regex ({n}|[-/.])+ in
zconf.l too.

> +       .       {
> +               fprintf(stderr,
> +                       "%s:%d:warning: ignoring unsupported character '%c'\n",
> +                       zconf_curname(), zconf_lineno(), *yytext);
> +       }
>         \n      {
>                 BEGIN(INITIAL);
>                 current_file->lineno++;
> @@ -132,7 +140,6 @@ n   [A-Za-z0-9_]
>                 BEGIN(STRING);
>         }
>         \n      BEGIN(INITIAL); current_file->lineno++; return T_EOL;
> -       ---     /* ignore */
>         ({n}|[-/.])+    {
>                 const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
>                 if (id && id->flags & TF_PARAM) {
> --
> 1.9.1
>

Cheers,
Ulf
