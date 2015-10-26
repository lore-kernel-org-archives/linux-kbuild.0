Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42442 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752408AbbJZUVp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Oct 2015 16:21:45 -0400
Subject: Re: [PATCH 1/1] [RFC] kconfig: menuconfig make "Selected by:"
 readable
References: <1442257543-6194-1-git-send-email-petr.vorel@gmail.com>
 <1442257543-6194-2-git-send-email-petr.vorel@gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <562E8B55.1030607@suse.cz>
Date: Mon, 26 Oct 2015 21:21:41 +0100
MIME-Version: 1.0
In-Reply-To: <1442257543-6194-2-git-send-email-petr.vorel@gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>

Dne 14.9.2015 v 21:05 Petr Vorel napsal(a):
> From: Paul Bolle <pebolle@tiscali.nl>
> 
> rev_dep expressions can get rather unwieldy, especially if a symbol is
> selected by more than a handful of other symbols. Ie, it's possible to
> have near endless expressions like:
>    A && B && !C || D || F && (G || H) || [...]
> 
> Chop these expressions into actually readable chunks:
>    - A && B && !C
>    - D
>    - F && (G || H)
>    - [...]
> 
> Ie, transform the top level "||" tokens into newlines and prepend each
> line with a minus. This makes the "Selected by:" blurb much easier to
> read.
> ---
> Today I found myself wondering why a certain Kconfig was selected.
> Currently menuconfig's help is of no use in complicated cases. Please
> look at the help of USB or CRYPTO to see what I mean.
> 
> This is a _hack_ to show what might be a better way to do this. It
> parses a stringified version of the reverse dependency, and not the
> actual reverse dependecy expression. But that was easier to cobble
> together.
> 
> One cool improvement would be to change to minus in front of the
> subexpressions to Y or M for those that actually set the symbol. Anyhow,
> other suggestions and feedback is welcome.
> 
> Not-yet-signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> Tested-by: Petr Vorel <petr.vorel@gmail.com>
> Cc: Paul Bolle <pebolle@tiscali.nl>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Petr Vorel <petr.vorel@gmail.com>
> ---
>  scripts/kconfig/menu.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index b05cc3d..a8b37a2 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -613,6 +613,86 @@ static struct property *get_symbol_prop(struct symbol *sym)
>  }
>  
>  /*
> + * Assuming we're just past an opening parenthesis in a NUL terminated string,
> + * find it's closing parenthesis and return its postion. Die otherwise.
> + */
> +static const char *matching_paren(const char *s)
> +{
> +	int lvl = 1;
> +
> +	while (1) {
> +		if (*s == '(')
> +			lvl++;
> +		else if (*s == ')')
> +			lvl--;
> +		if (lvl == 0)
> +			break;
> +		if (*s == '\0')
> +			/* huh? */
> +			exit(1);

assert/abort?

BTW, the whole splitting can be done in a singe loop a-la

while (c = s++) {
	if (c == '(')
		lvl++;
	else if (c == ')')
		lvl--;
	else if (c == '|' && lvl == 0)
		/* insert newline and indent */
	/* output c */
}

No need to seek back and forth in the string.


> -		expr_gstr_print(sym->rev_dep.expr, r);
> -		str_append(r, "\n");
> +		rev_dep_gstr_print(sym->rev_dep.expr, r);

... and a cleaner fix would be to patch the printer, instead of
generating a string representation and converting it.

Michal

