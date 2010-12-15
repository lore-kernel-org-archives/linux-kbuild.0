Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:58648 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752061Ab0LOG10 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:27:26 -0500
Received: by iwn9 with SMTP id 9so1670977iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:27:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291530919-5601-1-git-send-email-lacombar@gmail.com>
References: <1291530919-5601-1-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:27:25 -0500
Message-ID: <AANLkTikxp+4WtD_OzSLUE7PfOkPA=HbgNfOSAEm1fK++@mail.gmail.com>
Subject: Re: [PATCH 1/2] [RFC] kconfig: introduce specialized printer
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:35 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> The goal of this patch is to make conf_write_symbol() grammar agnostic to be
> able to use it from different code path. These path pass a printer callback
> which will print a symbol's name and its value in different format.
>
> conf_write_symbol()'s job became mostly only to prepare a string for the
> printer. This avoid to have to pass specialized flag to generic functions.
>
> CC: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/confdata.c  |  284 +++++++++++++++++++++++++-----------------
>  scripts/kconfig/lkc.h       |    5 +
>  scripts/kconfig/lkc_proto.h |    1 +
>  scripts/kconfig/symbol.c    |   46 +++++++-
>  4 files changed, 220 insertions(+), 116 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 6fd43d7..31d06da 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -417,64 +417,182 @@ int conf_read(const char *name)
>        return 0;
>  }
>
> -/* Write a S_STRING */
> -static void conf_write_string(bool headerfile, const char *name,
> -                              const char *str, FILE *out)
> +/*
> + * Generic printers
> + */
> +static void
> +kconfig_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
>  {
> -       int l;
> -       if (headerfile)
> -               fprintf(out, "#define %s%s \"", CONFIG_, name);
> -       else
> -               fprintf(out, "%s%s=\"", CONFIG_, name);
> -
> -       while (1) {
> -               l = strcspn(str, "\"\\");
> +
> +
> +       switch (sym->type) {
> +       case S_BOOLEAN:
> +       case S_TRISTATE:
> +               switch (*value) {
> +               case 'n':
> +                       if (arg != NULL)
> +                               return;
> +
> +                       fprintf(fp, "# %s%s is not set\n", CONFIG_, sym->name);
> +                       return;
> +               default:
> +                       break;
> +               }
> +       default:
> +               break;
> +       }
> +
> +       fprintf(fp, "%s%s=%s\n", CONFIG_, sym->name, value);
> +}
> +
> +static void
> +kconfig_print_comment(FILE *fp, const char *value, void *arg)
> +{
> +       const char *p = value;
> +       size_t l;
> +
> +       for (;;) {
> +               l = strcspn(p, "\n");
> +               fprintf(fp, "#");
>                if (l) {
> -                       xfwrite(str, l, 1, out);
> -                       str += l;
> +                       fprintf(fp, " ");
> +                       fwrite(p, l, 1, fp);
> +                       p += l;
>                }
> -               if (!*str)
> +               fprintf(fp, "\n");
> +               if (*p++ == '\0')
>                        break;
> -               fprintf(out, "\\%c", *str++);
>        }
> -       fputs("\"\n", out);
>  }
>
> -static void conf_write_symbol(struct symbol *sym, FILE *out, bool write_no)
> +static struct conf_printer kconfig_printer_cb =
>  {
> -       const char *str;
> +       .print_symbol = kconfig_print_symbol,
> +       .print_comment = kconfig_print_comment,
> +};
> +
> +static void
> +header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
> +{
> +       const char *suffix = "";
>
>        switch (sym->type) {
>        case S_BOOLEAN:
>        case S_TRISTATE:
> -               switch (sym_get_tristate_value(sym)) {
> -               case no:
> -                       if (write_no)
> -                               fprintf(out, "# %s%s is not set\n",
> -                                   CONFIG_, sym->name);
> -                       break;
> -               case mod:
> -                       fprintf(out, "%s%s=m\n", CONFIG_, sym->name);
> -                       break;
> -               case yes:
> -                       fprintf(out, "%s%s=y\n", CONFIG_, sym->name);
> -                       break;
> +               switch (*value) {
> +               case 'n':
> +                       return;
> +               case 'm':
> +                       suffix = "_MODULE";
> +               default:
> +                       value = "1";
>                }
>                break;
> -       case S_STRING:
> -               conf_write_string(false, sym->name, sym_get_string_value(sym), out);
> +       default:
>                break;
> -       case S_HEX:
> -       case S_INT:
> -               str = sym_get_string_value(sym);
> -               fprintf(out, "%s%s=%s\n", CONFIG_, sym->name, str);
> +       }
> +
> +       fprintf(fp, "#define %s%s%s %s\n",
> +           CONFIG_, sym->name, suffix, value);
> +}
> +
> +static void
> +header_print_comment(FILE *fp, const char *value, void *arg)
> +{
> +       const char *p = value;
> +       size_t l;
> +
> +       fprintf(fp, "/*\n");
> +       for (;;) {
> +               l = strcspn(p, "\n");
> +               fprintf(fp, " *");
> +               if (l) {
> +                       fprintf(fp, " ");
> +                       fwrite(p, l, 1, fp);
> +                       p += l;
> +               }
> +               fprintf(fp, "\n");
> +               if (*p++ == '\0')
> +                       break;
> +       }
> +       fprintf(fp, " */\n");
> +}
> +
> +static struct conf_printer header_printer_cb =
> +{
> +       .print_symbol = header_print_symbol,
> +       .print_comment = header_print_comment,
> +};
> +
> +static void
> +tristate_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
> +{
> +
> +       switch (sym->type) {
> +       case S_BOOLEAN:
> +       case S_TRISTATE:
> +               kconfig_print_symbol(fp, sym, value, arg);
> +               break;
> +       default:
>                break;
> +       }
> +}
> +
> +static struct conf_printer tristate_printer_cb =
> +{
> +       .print_symbol = tristate_print_symbol,
> +       .print_comment = kconfig_print_comment,
> +};
> +
> +/*
> + *
> + */
> +
> +static void conf_write_symbol(FILE *fp, struct symbol *sym,
> +                             struct conf_printer *printer, void *printer_arg)
> +{
> +       const char *str;
> +
> +       switch (sym->type) {
>        case S_OTHER:
>        case S_UNKNOWN:
>                break;
> +       case S_STRING:
> +               str = sym_get_string_value(sym);
> +               str = sym_escape_string_value(str);
> +               printer->print_symbol(fp, sym, str, printer_arg);
> +               free((void *)str);
> +               break;
> +       default:
> +               str = sym_get_string_value(sym);
> +               printer->print_symbol(fp, sym, str, printer_arg);
>        }
>  }
>
> +static void
> +conf_write_heading(FILE *fp, struct conf_printer *printer, void *printer_arg)
> +{
> +       const char *env;
> +       char buf[256];
> +       time_t now;
> +       int use_timestamp = 1;
> +
> +       time(&now);
> +       env = getenv("KCONFIG_NOTIMESTAMP");
> +       if (env && *env)
> +               use_timestamp = 0;
> +
> +       snprintf(buf, sizeof(buf),
> +           "\n"
> +           "Automatically generated file; DO NOT EDIT.\n"
> +           "%s\n"
> +           "%s",
> +           rootmenu.prompt->text,
> +           use_timestamp ? ctime(&now) : "");
> +
> +       printer->print_comment(fp, buf, printer_arg);
> +}
> +
>  /*
>  * Write out a minimal config.
>  * All values that has default values are skipped as this is redundant.
> @@ -531,7 +649,7 @@ int conf_write_defconfig(const char *filename)
>                                                goto next_menu;
>                                }
>                        }
> -                       conf_write_symbol(sym, out, true);
> +                       conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
>                }
>  next_menu:
>                if (menu->list != NULL) {
> @@ -561,9 +679,7 @@ int conf_write(const char *name)
>        const char *str;
>        char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
>        enum symbol_type type;
> -       time_t now;
> -       int use_timestamp = 1;
> -       char *env;
> +       const char *env;
>
>        dirname[0] = 0;
>        if (name && name[0]) {
> @@ -599,19 +715,7 @@ int conf_write(const char *name)
>        if (!out)
>                return 1;
>
> -       time(&now);
> -       env = getenv("KCONFIG_NOTIMESTAMP");
> -       if (env && *env)
> -               use_timestamp = 0;
> -
> -       fprintf(out, _("#\n"
> -                      "# Automatically generated make config: don't edit\n"
> -                      "# %s\n"
> -                      "%s%s"
> -                      "#\n"),
> -                    rootmenu.prompt->text,
> -                    use_timestamp ? "# " : "",
> -                    use_timestamp ? ctime(&now) : "");
> +       conf_write_heading(out, &kconfig_printer_cb, NULL);
>
>        if (!conf_get_changed())
>                sym_clear_all_valid();
> @@ -632,8 +736,8 @@ int conf_write(const char *name)
>                        if (!(sym->flags & SYMBOL_WRITE))
>                                goto next;
>                        sym->flags &= ~SYMBOL_WRITE;
> -                       /* Write config symbol to file */
> -                       conf_write_symbol(sym, out, true);
> +
> +                       conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
>                }
>
>  next:
> @@ -782,10 +886,8 @@ out:
>  int conf_write_autoconf(void)
>  {
>        struct symbol *sym;
> -       const char *str;
>        const char *name;
>        FILE *out, *tristate, *out_h;
> -       time_t now;
>        int i;
>
>        sym_clear_all_valid();
> @@ -812,71 +914,23 @@ int conf_write_autoconf(void)
>                return 1;
>        }
>
> -       time(&now);
> -       fprintf(out, "#\n"
> -                    "# Automatically generated make config: don't edit\n"
> -                    "# %s\n"
> -                    "# %s"
> -                    "#\n",
> -                    rootmenu.prompt->text, ctime(&now));
> -       fprintf(tristate, "#\n"
> -                         "# Automatically generated - do not edit\n"
> -                         "\n");
> -       fprintf(out_h, "/*\n"
> -                      " * Automatically generated C config: don't edit\n"
> -                      " * %s\n"
> -                      " * %s"
> -                      " */\n",
> -                      rootmenu.prompt->text, ctime(&now));
> +       conf_write_heading(out, &kconfig_printer_cb, NULL);
> +
> +       conf_write_heading(tristate, &tristate_printer_cb, NULL);
> +
> +       conf_write_heading(out_h, &header_printer_cb, NULL);
>
>        for_all_symbols(i, sym) {
>                sym_calc_value(sym);
>                if (!(sym->flags & SYMBOL_WRITE) || !sym->name)
>                        continue;
>
> -               /* write symbol to config file */
> -               conf_write_symbol(sym, out, false);
> +               /* write symbol to auto.conf, tristate and header files */
> +               conf_write_symbol(out, sym, &kconfig_printer_cb, (void *)1);
>
> -               /* update autoconf and tristate files */
> -               switch (sym->type) {
> -               case S_BOOLEAN:
> -               case S_TRISTATE:
> -                       switch (sym_get_tristate_value(sym)) {
> -                       case no:
> -                               break;
> -                       case mod:
> -                               fprintf(tristate, "%s%s=M\n",
> -                                   CONFIG_, sym->name);
> -                               fprintf(out_h, "#define %s%s_MODULE 1\n",
> -                                   CONFIG_, sym->name);
> -                               break;
> -                       case yes:
> -                               if (sym->type == S_TRISTATE)
> -                                       fprintf(tristate,"%s%s=Y\n",
> -                                           CONFIG_, sym->name);
> -                               fprintf(out_h, "#define %s%s 1\n",
> -                                   CONFIG_, sym->name);
> -                               break;
> -                       }
> -                       break;
> -               case S_STRING:
> -                       conf_write_string(true, sym->name, sym_get_string_value(sym), out_h);
> -                       break;
> -               case S_HEX:
> -                       str = sym_get_string_value(sym);
> -                       if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
> -                               fprintf(out_h, "#define %s%s 0x%s\n",
> -                                   CONFIG_, sym->name, str);
> -                               break;
> -                       }
> -               case S_INT:
> -                       str = sym_get_string_value(sym);
> -                       fprintf(out_h, "#define %s%s %s\n",
> -                           CONFIG_, sym->name, str);
> -                       break;
> -               default:
> -                       break;
> -               }
> +               conf_write_symbol(tristate, sym, &tristate_printer_cb, (void *)1);
> +
> +               conf_write_symbol(out_h, sym, &header_printer_cb, NULL);
>        }
>        fclose(out);
>        fclose(tristate);
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 753cdbd..3633d5a 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -89,6 +89,11 @@ void sym_set_change_count(int count);
>  void sym_add_change_count(int count);
>  void conf_set_all_new_symbols(enum conf_def_mode mode);
>
> +struct conf_printer {
> +       void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
> +       void (*print_comment)(FILE *, const char *, void *);
> +};
> +
>  /* confdata.c and expr.c */
>  static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
>  {
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index 17342fe..47fe9c3 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -31,6 +31,7 @@ P(symbol_hash,struct symbol *,[SYMBOL_HASHSIZE]);
>  P(sym_lookup,struct symbol *,(const char *name, int flags));
>  P(sym_find,struct symbol *,(const char *name));
>  P(sym_expand_string_value,const char *,(const char *in));
> +P(sym_escape_string_value, const char *,(const char *in));
>  P(sym_re_search,struct symbol **,(const char *pattern));
>  P(sym_type_name,const char *,(enum symbol_type type));
>  P(sym_calc_value,void,(struct symbol *sym));
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index ad7dbe7..e42240d 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -749,7 +749,8 @@ const char *sym_get_string_value(struct symbol *sym)
>                case no:
>                        return "n";
>                case mod:
> -                       return "m";
> +                       sym_calc_value(modules_sym);
> +                       return (modules_sym->curr.tri == no) ? "n" : "m";
>                case yes:
>                        return "y";
>                }
> @@ -891,6 +892,49 @@ const char *sym_expand_string_value(const char *in)
>        return res;
>  }
>
> +const char *sym_escape_string_value(const char *in)
> +{
> +       const char *p;
> +       size_t reslen;
> +       char *res;
> +       size_t l;
> +
> +       reslen = strlen(in) + strlen("\"\"") + 1;
> +
> +       p = in;
> +       for (;;) {
> +               l = strcspn(p, "\"\\");
> +               p += l;
> +
> +               if (p[0] == '\0')
> +                       break;
> +
> +               reslen++;
> +               p++;
> +       }
> +
> +       res = malloc(reslen);
> +       res[0] = '\0';
> +
> +       strcat(res, "\"");
> +
> +       p = in;
> +       for (;;) {
> +               l = strcspn(p, "\"\\");
> +               strncat(res, p, l);
> +               p += l;
> +
> +               if (p[0] == '\0')
> +                       break;
> +
> +               strcat(res, "\\");
> +               strncat(res, p++, 1);
> +       }
> +
> +       strcat(res, "\"");
> +       return res;
> +}
> +
>  struct symbol **sym_re_search(const char *pattern)
>  {
>        struct symbol *sym, **sym_arr = NULL;
> --
> 1.7.2.30.gc37d7.dirty
>
>
