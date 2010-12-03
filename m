Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:34504 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755364Ab0LCMXt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Dec 2010 07:23:49 -0500
Date: Fri, 3 Dec 2010 13:23:47 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Kbuild: kconfig: Verbose version of --listnewconfig
Message-ID: <20101203122347.GA12395@sepie.suse.cz>
References: <1290488397.6770.1404.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1290488397.6770.1404.camel@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

On Tue, Nov 23, 2010 at 04:59:57AM +0000, Ben Hutchings wrote:
> If the KBUILD_VERBOSE environment variable is set to non-zero, show
> the default values of new symbols and not just their names.
> 
> Based on work by Bastian Blank <waldi@debian.org> and
> maximilian attems <max@stro.at>.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  scripts/kconfig/conf.c     |   90 +++++++++++++++++++++++++++++++++++++++-----
>  scripts/kconfig/confdata.c |    1 +
>  scripts/kconfig/expr.h     |    2 +
>  3 files changed, 83 insertions(+), 10 deletions(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 5459a38..6d37d5c 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -363,7 +363,6 @@ static void conf(struct menu *menu)
>  		switch (prop->type) {
>  		case P_MENU:
>  			if ((input_mode == silentoldconfig ||
> -			     input_mode == listnewconfig ||
>  			     input_mode == oldnoconfig) &&
>  			    rootEntry != menu) {
>  				check_conf(menu);
> @@ -423,11 +422,7 @@ static void check_conf(struct menu *menu)
>  	if (sym && !sym_has_value(sym)) {
>  		if (sym_is_changable(sym) ||
>  		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
> -			if (input_mode == listnewconfig) {
> -				if (sym->name && !sym_is_choice_value(sym)) {
> -					printf("%s%s\n", CONFIG_, sym->name);
> -				}
> -			} else if (input_mode != oldnoconfig) {
> +			if (input_mode != oldnoconfig) {
>  				if (!conf_cnt++)
>  					printf(_("*\n* Restart config...\n*\n"));
>  				rootEntry = menu_get_parent_menu(menu);
> @@ -440,6 +435,78 @@ static void check_conf(struct menu *menu)
>  		check_conf(child);
>  }
>  
> +static void report_conf(struct menu *menu, bool verbose)
> +{
> +	struct symbol *sym;
> +	struct menu *child;
> +	int l;
> +	const char *str;
> +
> +	if (!menu_is_visible(menu))
> +		return;
> +
> +	if (verbose && menu == &rootmenu) {
> +		printf("\n#\n"
> +		       "# Changes:\n"
> +		       "#\n");
> +	}
> +
> +	sym = menu->sym;
> +	if (sym && (sym->flags & SYMBOL_NEW) &&
> +	    sym_is_changable(sym) && sym->name && !sym_is_choice_value(sym)) {
> +		if (verbose) {
> +			switch (sym->type) {
> +			case S_BOOLEAN:
> +			case S_TRISTATE:
> +				switch (sym_get_tristate_value(sym)) {
> +				case no:
> +					printf("# CONFIG_%s is not set\n", sym->name);
> +					break;
> [...]

Hi,

this is almost a 1:1 copy of the conf_write_symbol() function, so what
about reusing it like this? Otherwise the patch looks OK.

Michal


Subject: [PATCH] kconfig: Use conf_write_symbol() in listnewconfig

Signed-off-by: Michal Marek <mmarek@suse.cz>

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 6d37d5c..41731c7 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -439,8 +439,6 @@ static void report_conf(struct menu *menu, bool verbose)
 {
 	struct symbol *sym;
 	struct menu *child;
-	int l;
-	const char *str;
 
 	if (!menu_is_visible(menu))
 		return;
@@ -455,49 +453,7 @@ static void report_conf(struct menu *menu, bool verbose)
 	if (sym && (sym->flags & SYMBOL_NEW) &&
 	    sym_is_changable(sym) && sym->name && !sym_is_choice_value(sym)) {
 		if (verbose) {
-			switch (sym->type) {
-			case S_BOOLEAN:
-			case S_TRISTATE:
-				switch (sym_get_tristate_value(sym)) {
-				case no:
-					printf("# CONFIG_%s is not set\n", sym->name);
-					break;
-				case mod:
-					printf("CONFIG_%s=m\n", sym->name);
-					break;
-				case yes:
-					printf("CONFIG_%s=y\n", sym->name);
-					break;
-				}
-				break;
-			case S_STRING:
-				str = sym_get_string_value(sym);
-				printf("CONFIG_%s=\"", sym->name);
-				while (1) {
-					l = strcspn(str, "\"\\");
-					if (l) {
-						fwrite(str, l, 1, stdout);
-						str += l;
-					}
-					if (!*str)
-						break;
-					printf("\\%c", *str++);
-				}
-				fputs("\"\n", stdout);
-				break;
-			case S_HEX:
-				str = sym_get_string_value(sym);
-				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-					printf("CONFIG_%s=%s\n", sym->name, str);
-					break;
-				}
-			case S_INT:
-				str = sym_get_string_value(sym);
-				printf("CONFIG_%s=%s\n", sym->name, str);
-				break;
-			default:
-				break;
-			}
+			conf_write_symbol(sym, sym->type, stdout, true);
 		} else {
 			printf("CONFIG_%s\n", sym->name);
 		}
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 44c9d62..1955b48 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -440,7 +440,7 @@ static void conf_write_string(bool headerfile, const char *name,
 	fputs("\"\n", out);
 }
 
-static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
+void conf_write_symbol(struct symbol *sym, enum symbol_type type,
                               FILE *out, bool write_no)
 {
 	const char *str;
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 17342fe..6da571b 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -7,6 +7,7 @@ P(conf_read_simple,int,(const char *name, int));
 P(conf_write_defconfig,int,(const char *name));
 P(conf_write,int,(const char *name));
 P(conf_write_autoconf,int,(void));
+P(conf_write_symbol, void,(struct symbol*, enum symbol_type, FILE*, bool));
 P(conf_get_changed,bool,(void));
 P(conf_set_changed_callback, void,(void (*fn)(void)));
 P(conf_set_message_callback, void,(void (*fn)(const char *fmt, va_list ap)));
