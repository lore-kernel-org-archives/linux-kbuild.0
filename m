Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:43237 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932740AbeALLEk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 06:04:40 -0500
MIME-Version: 1.0
In-Reply-To: <1515718701-4552-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515718701-4552-1-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 12 Jan 2018 12:04:38 +0100
Message-ID: <CAFkk2KSQ00TQxtW5+zMnxsJhUNoHwK_X+2cPnGkrc7bhXr_=AA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: use default 'yy' prefix for lexer and parser
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 12, 2018 at 1:58 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Flex and Bison provide an option to change the prefix of globally-
> visible symbols.  This is useful to link multiple lexers and/or
> parsers into the same executable.  However, Kconfig (and any other
> host programs in kernel) uses a single lexer and parser.  I do not
> see a good reason to change the default 'yy' prefix.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/Makefile |  3 ---
>  scripts/kconfig/zconf.l  | 16 ++++++++--------
>  scripts/kconfig/zconf.y  | 22 +++++++++++-----------
>  3 files changed, 19 insertions(+), 22 deletions(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 61cdc5e..2ad1cf5 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -211,9 +211,6 @@ HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC)
>  HOSTCFLAGS_zconf.lex.o := -I$(src)
>  HOSTCFLAGS_zconf.tab.o := -I$(src)
>
> -LEX_PREFIX_zconf       := zconf
> -YACC_PREFIX_zconf      := zconf
> -
>  HOSTLOADLIBES_qconf    = $(KC_QT_LIBS)
>  HOSTCXXFLAGS_qconf.o   = $(KC_QT_CFLAGS)
>
> diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
> index c410d25..07e074d 100644
> --- a/scripts/kconfig/zconf.l
> +++ b/scripts/kconfig/zconf.l
> @@ -106,11 +106,11 @@ n [A-Za-z0-9_-]
>                 current_pos.file = current_file;
>                 current_pos.lineno = current_file->lineno;
>                 if (id && id->flags & TF_COMMAND) {
> -                       zconflval.id = id;
> +                       yylval.id = id;
>                         return id->token;
>                 }
>                 alloc_string(yytext, yyleng);
> -               zconflval.string = text;
> +               yylval.string = text;
>                 return T_WORD;
>         }
>         .       warn_ignored_character(*yytext);
> @@ -142,11 +142,11 @@ n [A-Za-z0-9_-]
>         ({n}|[/.])+     {
>                 const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
>                 if (id && id->flags & TF_PARAM) {
> -                       zconflval.id = id;
> +                       yylval.id = id;
>                         return id->token;
>                 }
>                 alloc_string(yytext, yyleng);
> -               zconflval.string = text;
> +               yylval.string = text;
>                 return T_WORD;
>         }
>         #.*     /* comment */
> @@ -161,7 +161,7 @@ n   [A-Za-z0-9_-]
>  <STRING>{
>         [^'"\\\n]+/\n   {
>                 append_string(yytext, yyleng);
> -               zconflval.string = text;
> +               yylval.string = text;
>                 return T_WORD_QUOTE;
>         }
>         [^'"\\\n]+      {
> @@ -169,7 +169,7 @@ n   [A-Za-z0-9_-]
>         }
>         \\.?/\n {
>                 append_string(yytext + 1, yyleng - 1);
> -               zconflval.string = text;
> +               yylval.string = text;
>                 return T_WORD_QUOTE;
>         }
>         \\.?    {
> @@ -178,7 +178,7 @@ n   [A-Za-z0-9_-]
>         \'|\"   {
>                 if (str == yytext[0]) {
>                         BEGIN(PARAM);
> -                       zconflval.string = text;
> +                       yylval.string = text;
>                         return T_WORD_QUOTE;
>                 } else
>                         append_string(yytext, 1);
> @@ -261,7 +261,7 @@ void zconf_starthelp(void)
>
>  static void zconf_endhelp(void)
>  {
> -       zconflval.string = text;
> +       yylval.string = text;
>         BEGIN(INITIAL);
>  }
>
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 600deb1..dd0c09d 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -20,10 +20,10 @@
>
>  int cdebug = PRINTD;
>
> -extern int zconflex(void);
> +int yylex(void);
> +static void yyerror(const char *err);
>  static void zconfprint(const char *err, ...);
>  static void zconf_error(const char *err, ...);
> -static void zconferror(const char *err);
>  static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
>
>  struct symbol *symbol_hash[SYMBOL_HASHSIZE];
> @@ -529,9 +529,9 @@ void conf_parse(const char *name)
>         _menu_init();
>
>         if (getenv("ZCONF_DEBUG"))
> -               zconfdebug = 1;
> -       zconfparse();
> -       if (zconfnerrs)
> +               yydebug = 1;
> +       yyparse();
> +       if (yynerrs)
>                 exit(1);
>         if (!modules_sym)
>                 modules_sym = sym_find( "n" );
> @@ -544,9 +544,9 @@ void conf_parse(const char *name)
>         menu_finalize(&rootmenu);
>         for_all_symbols(i, sym) {
>                 if (sym_check_deps(sym))
> -                       zconfnerrs++;
> +                       yynerrs++;
>         }
> -       if (zconfnerrs)
> +       if (yynerrs)
>                 exit(1);
>         sym_set_change_count(1);
>  }
> @@ -571,7 +571,7 @@ static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtok
>         if (id->token != endtoken) {
>                 zconf_error("unexpected '%s' within %s block",
>                         id->name, zconf_tokenname(starttoken));
> -               zconfnerrs++;
> +               yynerrs++;
>                 return false;
>         }
>         if (current_menu->file != current_file) {
> @@ -580,7 +580,7 @@ static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtok
>                 fprintf(stderr, "%s:%d: location of the '%s'\n",
>                         current_menu->file->name, current_menu->lineno,
>                         zconf_tokenname(starttoken));
> -               zconfnerrs++;
> +               yynerrs++;
>                 return false;
>         }
>         return true;
> @@ -601,7 +601,7 @@ static void zconf_error(const char *err, ...)
>  {
>         va_list ap;
>
> -       zconfnerrs++;
> +       yynerrs++;
>         fprintf(stderr, "%s:%d: ", zconf_curname(), zconf_lineno());
>         va_start(ap, err);
>         vfprintf(stderr, err, ap);
> @@ -609,7 +609,7 @@ static void zconf_error(const char *err, ...)
>         fprintf(stderr, "\n");
>  }
>
> -static void zconferror(const char *err)
> +static void yyerror(const char *err)
>  {
>         fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
>  }
> --
> 2.7.4
>

Looks good to me. Less cryptic.

Acked-by: Ulf Magnusson <ulfalizer@gmail.com>

Cheers,
Ulf
