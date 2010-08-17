Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:34697 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755646Ab0HQL1L (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 07:27:11 -0400
Message-ID: <4C6A7167.3060608@suse.cz>
Date: Tue, 17 Aug 2010 13:24:23 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: implement the `mainmenu' directive
References: <AANLkTinuJJXAB6b0ap6yn0X9nM7grQmYxoJSdyOPVmVj@mail.gmail.com> <1282023725-20428-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1282023725-20428-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 17.8.2010 07:42, Arnaud Lacombe wrote:
> note: the prompt is voluntarily still a bare `const char *'. It may need
> to be represented in a more detailled way, say a `struct property'.
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

Keep the "Linux Kernel Configuration" default here.

> +
> +void mainmenu_set_prompt(char *prompt)
> +{
> +	if (mainmenu_prompt != NULL)
> +		fprintf(stderr, "%s:%d:warning: mainmenu redefined\n",
> +		    current_file->name, zconf_lineno());

... and do not warn here.

> +
> +	if (isspace(*prompt)) {
> +		fprintf(stderr, "%s:%d:warning: leading whitespace ignored\n",
> +		    current_file->name, zconf_lineno());
> +		while (isspace(*prompt))
> +			prompt++;
> +	}

The lexer already eats whitespace I think, so this might not be necessary.

Michal

> +
> +	mainmenu_prompt = prompt;
> +}
> +
> +const char *mainmenu_get_prompt(void)
> +{
> +	return mainmenu_prompt;
> +}
> +
>  void _menu_init(void)
>  {
>  	current_entry = current_menu = &rootmenu;
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 23dfd3b..18c9a28 100644
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

