Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:49534 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752802Ab0KYRGr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Nov 2010 12:06:47 -0500
MIME-Version: 1.0
In-Reply-To: <1289079027-3037-2-git-send-email-lacombar@gmail.com>
References: <4CD300AC.3010708@redhat.com>
	<1289079027-3037-2-git-send-email-lacombar@gmail.com>
Date: Thu, 25 Nov 2010 12:06:46 -0500
Message-ID: <AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com>
Subject: Re: [PATCH 1/5] kconfig: add an option to determine a menu's visibility
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Hi folks,

On Sat, Nov 6, 2010 at 5:30 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> This option is aimed to add the possibility to control a menu's visibility
> without adding dependency to the expression to all the submenu.
>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/expr.h      |    1 +
>  scripts/kconfig/lkc.h       |    1 +
>  scripts/kconfig/menu.c      |   11 +++++++++++
>  scripts/kconfig/zconf.gperf |    1 +
>  scripts/kconfig/zconf.y     |   21 ++++++++++++++++++---
>  5 files changed, 32 insertions(+), 3 deletions(-)
>
As there seem to be no interested from Michal to either, ACK, NACK, or
even comment this series, please let me withdraw these patches. If
this mail is not enough to void the patch, I hope to still be able to
withdraw my Signed-off-by from this particular series, and thus no
longer be able to certify the origin of the patches to prevent their
merge.

I guess lot of people will keep being pissed by these warnings.

I hope another solution will be found or someone will have fun wasting
time re-writting the patch.

Thanks,
 - Arnaud

ps: as we all live a world of consensus, I can still be convinced to
change my mind if interest arise.

> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 184eb6a..e57826c 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -164,6 +164,7 @@ struct menu {
>        struct menu *list;
>        struct symbol *sym;
>        struct property *prompt;
> +       struct expr *visibility;
>        struct expr *dep;
>        unsigned int flags;
>        char *help;
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 753cdbd..3f7240d 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -107,6 +107,7 @@ void menu_end_menu(void);
>  void menu_add_entry(struct symbol *sym);
>  void menu_end_entry(void);
>  void menu_add_dep(struct expr *dep);
> +void menu_add_visibility(struct expr *dep);
>  struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep);
>  struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
>  void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 7e83aef..b9d9aa1 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -152,6 +152,12 @@ struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr
>        return menu_add_prop(type, prompt, NULL, dep);
>  }
>
> +void menu_add_visibility(struct expr *expr)
> +{
> +       current_entry->visibility = expr_alloc_and(current_entry->visibility,
> +           expr);
> +}
> +
>  void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep)
>  {
>        menu_add_prop(type, NULL, expr, dep);
> @@ -410,6 +416,11 @@ bool menu_is_visible(struct menu *menu)
>        if (!menu->prompt)
>                return false;
>
> +       if (menu->visibility) {
> +               if (expr_calc_value(menu->visibility) == no)
> +                       return no;
> +       }
> +
>        sym = menu->sym;
>        if (sym) {
>                sym_calc_value(sym);
> diff --git a/scripts/kconfig/zconf.gperf b/scripts/kconfig/zconf.gperf
> index d8bc742..c9e690e 100644
> --- a/scripts/kconfig/zconf.gperf
> +++ b/scripts/kconfig/zconf.gperf
> @@ -38,6 +38,7 @@ hex,          T_TYPE,         TF_COMMAND, S_HEX
>  string,                T_TYPE,         TF_COMMAND, S_STRING
>  select,                T_SELECT,       TF_COMMAND
>  range,         T_RANGE,        TF_COMMAND
> +visible,       T_VISIBLE,      TF_COMMAND
>  option,                T_OPTION,       TF_COMMAND
>  on,            T_ON,           TF_PARAM
>  modules,       T_OPT_MODULES,  TF_OPTION
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 2abd3c7..49fb4ab 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -36,7 +36,7 @@ static struct menu *current_menu, *current_entry;
>  #define YYERROR_VERBOSE
>  #endif
>  %}
> -%expect 28
> +%expect 30
>
>  %union
>  {
> @@ -68,6 +68,7 @@ static struct menu *current_menu, *current_entry;
>  %token <id>T_DEFAULT
>  %token <id>T_SELECT
>  %token <id>T_RANGE
> +%token <id>T_VISIBLE
>  %token <id>T_OPTION
>  %token <id>T_ON
>  %token <string> T_WORD
> @@ -123,7 +124,7 @@ stmt_list:
>  ;
>
>  option_name:
> -       T_DEPENDS | T_PROMPT | T_TYPE | T_SELECT | T_OPTIONAL | T_RANGE | T_DEFAULT
> +       T_DEPENDS | T_PROMPT | T_TYPE | T_SELECT | T_OPTIONAL | T_RANGE | T_DEFAULT | T_VISIBLE
>  ;
>
>  common_stmt:
> @@ -359,7 +360,7 @@ menu: T_MENU prompt T_EOL
>        printd(DEBUG_PARSE, "%s:%d:menu\n", zconf_curname(), zconf_lineno());
>  };
>
> -menu_entry: menu depends_list
> +menu_entry: menu visibility_list depends_list
>  {
>        $$ = menu_add_menu();
>  };
> @@ -430,6 +431,19 @@ depends: T_DEPENDS T_ON expr T_EOL
>        printd(DEBUG_PARSE, "%s:%d:depends on\n", zconf_curname(), zconf_lineno());
>  };
>
> +/* visibility option */
> +
> +visibility_list:
> +         /* empty */
> +       | visibility_list visible
> +       | visibility_list T_EOL
> +;
> +
> +visible: T_VISIBLE if_expr
> +{
> +       menu_add_visibility($2);
> +};
> +
>  /* prompt statement */
>
>  prompt_stmt_opt:
> @@ -526,6 +540,7 @@ static const char *zconf_tokenname(int token)
>        case T_IF:              return "if";
>        case T_ENDIF:           return "endif";
>        case T_DEPENDS:         return "depends";
> +       case T_VISIBLE:         return "visible";
>        }
>        return "<token>";
>  }
> --
> 1.7.2.30.gc37d7.dirty
>
>
