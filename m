Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:50933 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858Ab0HQUes (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 16:34:48 -0400
Date: Tue, 17 Aug 2010 22:34:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: implement the `mainmenu' directive
Message-ID: <20100817203446.GC11592@merkur.ravnborg.org>
References: <AANLkTinuJJXAB6b0ap6yn0X9nM7grQmYxoJSdyOPVmVj@mail.gmail.com> <1282023725-20428-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1282023725-20428-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Aug 17, 2010 at 01:42:05AM -0400, Arnaud Lacombe wrote:
> note: the prompt is voluntarily still a bare `const char *'. It may need
> to be represented in a more detailled way, say a `struct property'.

I actually attempted to go the "struct property" way.
This looks much simpler and I like how straight forward it is.

> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> 
> ---
>  scripts/kconfig/lkc.h   |    2 ++
>  scripts/kconfig/menu.c  |   23 +++++++++++++++++++++++
>  scripts/kconfig/zconf.y |    9 ++++++++-
>  3 files changed, 33 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index bdf71bd..f00854f 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -94,6 +94,8 @@ static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
>  void kconfig_load(void);
>  
>  /* menu.c */
> +void mainmenu_set_prompt(char *);
> +const char *mainmenu_get_prompt(void);
>  void _menu_init(void);
>  void menu_warn(struct menu *menu, const char *fmt, ...);
>  struct menu *menu_add_menu(void);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 4fb5902..6aa219e 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -38,6 +38,29 @@ static void prop_warn(struct property *prop, const char *fmt, ...)
>  	va_end(ap);
>  }
>  
> +static const char *mainmenu_prompt = NULL;
> +
> +void mainmenu_set_prompt(char *prompt)
> +{
> +	if (mainmenu_prompt != NULL)
> +		fprintf(stderr, "%s:%d:warning: mainmenu redefined\n",
> +		    current_file->name, zconf_lineno());
> +
> +	if (isspace(*prompt)) {
> +		fprintf(stderr, "%s:%d:warning: leading whitespace ignored\n",
> +		    current_file->name, zconf_lineno());
> +		while (isspace(*prompt))
> +			prompt++;

Any particular reason not to use menu_warn() ?

> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -111,7 +111,7 @@ stmt_list:
>  	| stmt_list common_stmt
>  	| stmt_list choice_stmt
>  	| stmt_list menu_stmt
> -	| stmt_list T_MAINMENU prompt nl
> +	| stmt_list mainmenu_stmt
>  	| stmt_list end			{ zconf_error("unexpected end statement"); }
>  	| stmt_list T_WORD error T_EOL	{ zconf_error("unknown statement \"%s\"", $2); }
>  	| stmt_list option_name error T_EOL
> @@ -342,6 +342,13 @@ if_block:
>  	| if_block choice_stmt
>  ;
>  
> +/* mainmenu entry */
> +
> +mainmenu_stmt: T_MAINMENU prompt nl
> +{
> +	mainmenu_set_prompt($2);
> +};
> +
>  /* menu entry */
>  
>  menu: T_MENU prompt T_EOL

When you submit the final patch then please divide it in two.
One patch that contains the zconf.y changes (like you do here),
and then a subsequent patch that updates the relevant _shipped files.
This makes review so much easier.

	Sam
