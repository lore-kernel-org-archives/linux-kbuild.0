Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:38460 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751029AbeBQQzD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Feb 2018 11:55:03 -0500
Received: by mail-ua0-f193.google.com with SMTP id e25so3778680uan.5
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Feb 2018 08:55:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0ed37972989a9ba7a8b50777bd60ea8f46495a2a.1518826148.git.erosca@de.adit-jv.com>
References: <cover.1518826148.git.erosca@de.adit-jv.com> <0ed37972989a9ba7a8b50777bd60ea8f46495a2a.1518826148.git.erosca@de.adit-jv.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sat, 17 Feb 2018 17:55:01 +0100
Message-ID: <CAFkk2KT8gQz+wmMagq-v4zLX7XuZ6MahN8KQ6SqtaAMRo5o7sA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] kconfig: Print reverse dependencies in groups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Feb 17, 2018 at 3:05 AM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
>
> Assuming commit 617aebe6a97e ("Merge tag 'usercopy-v4.16-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=arm64
> and vanilla arm64 defconfig, here is the top 10 CONFIG options with
> the highest amount of top level "||" sub-expressions/tokens that make
> up the final "{Selected,Implied} by" reverse dependency expression.
>
> | Config                        | Revdep all | Revdep ![=n] |
> |-------------------------------|------------|--------------|
> | REGMAP_I2C                    | 212        | 9            |
> | CRC32                         | 167        | 25           |
> | FW_LOADER                     | 128        | 5            |
> | MFD_CORE                      | 124        | 9            |
> | FB_CFB_IMAGEBLIT              | 114        | 2            |
> | FB_CFB_COPYAREA               | 111        | 2            |
> | FB_CFB_FILLRECT               | 110        | 2            |
> | SND_PCM                       | 103        | 2            |
> | CRYPTO_HASH                   | 87         | 19           |
> | WATCHDOG_CORE                 | 86         | 6            |
>
> The story behind the above is that users need to visually
> review/evaluate 212 expressions which *potentially* select REGMAP_I2C
> in order to identify the expressions which *actually* select REGMAP_I2C,
> for a particular ARCH and for a particular defconfig used.
>
> To make this experience smoother, change the way reverse dependencies
> are displayed to the user from [1] to [2].
>
> [1] Old representation of reverse dependencies for DMA_ENGINE_RAID:
>   Selected by:
>   - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || 440SP)
>   - BCM_SBA_RAID [=m] && DMADEVICES [=y] && (ARM64 [=y] || ...
>   - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
>   - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64
>   - MV_XOR [=n] && DMADEVICES [=y] && (PLAT_ORION || ARCH_MVEBU [=y] ...
>   - MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
>   - XGENE_DMA [=n] && DMADEVICES [=y] && (ARCH_XGENE [=y] || ...
>   - DMATEST [=n] && DMADEVICES [=y] && DMA_ENGINE [=y]
>
> [2] New representation of reverse dependencies for DMA_ENGINE_RAID:
>   Selected by [y]:
>   - MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
>   Selected by [m]:
>   - BCM_SBA_RAID [=m] && DMADEVICES [=y] && (ARM64 [=y] || ...
>   Selected by [n]:
>   - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || ...
>   - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
>   - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64
>   - MV_XOR [=n] && DMADEVICES [=y] && (PLAT_ORION || ARCH_MVEBU [=y] ...
>   - XGENE_DMA [=n] && DMADEVICES [=y] && (ARCH_XGENE [=y] || ...
>   - DMATEST [=n] && DMADEVICES [=y] && DMA_ENGINE [=y]
>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  scripts/kconfig/expr.c      | 59 ++++++++++++++++++++++++++++++++++++++++++++-
>  scripts/kconfig/expr.h      |  4 +++
>  scripts/kconfig/lkc_proto.h |  1 +
>  scripts/kconfig/menu.c      | 37 ++++++++++++++++++++--------
>  4 files changed, 90 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index c610cb14284f..48b99371d276 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1213,6 +1213,18 @@ __expr_print(struct expr *e,
>                         case PRINT_REVDEP_ALL:
>                                 expr_print_newline(e, fn, data, E_OR);
>                                 break;
> +                       case PRINT_REVDEP_YES:
> +                               if (expr_calc_value(e) == yes)
> +                                       expr_print_newline(e, fn, data, E_OR);
> +                               break;
> +                       case PRINT_REVDEP_MOD:
> +                               if (expr_calc_value(e) == mod)
> +                                       expr_print_newline(e, fn, data, E_OR);
> +                               break;
> +                       case PRINT_REVDEP_NO:
> +                               if (expr_calc_value(e) == no)
> +                                       expr_print_newline(e, fn, data, E_OR);
> +                               break;

Perhaps this logic could be moved into expr_print_newline() (which
could be renamed to something like expr_print_select() in that case).
Could have it take 'enum print_type' as an argument.

>                         default:
>                                 break;
>                         }
> @@ -1273,6 +1285,18 @@ __expr_print(struct expr *e,
>                 case PRINT_REVDEP_ALL:
>                         expr_print_newline(e, fn, data, E_OR);
>                         break;
> +               case PRINT_REVDEP_YES:
> +                       if (expr_calc_value(e) == yes)
> +                               expr_print_newline(e, fn, data, E_OR);
> +                       break;
> +               case PRINT_REVDEP_MOD:
> +                       if (expr_calc_value(e) == mod)
> +                               expr_print_newline(e, fn, data, E_OR);
> +                       break;
> +               case PRINT_REVDEP_NO:
> +                       if (expr_calc_value(e) == no)
> +                               expr_print_newline(e, fn, data, E_OR);
> +                       break;

That would simplify this part as well, since they're equal.

>                 default:
>                         break;
>                 }
> @@ -1353,10 +1377,43 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
>         expr_print(e, expr_print_gstr_helper, gs, E_NONE);
>  }
>
> +/*
> + * Allow front ends to check if a specific reverse dependency expression
> + * has at least one top level "||" member which evaluates to "val". This,
> + * will allow front ends to, as example, avoid printing "Selected by [y]:"
> + * line when there are actually no top level "||" sub-expressions which
> + * evaluate to =y.
> + */
> +bool expr_revdep_contains(struct expr *e, tristate val)
> +{
> +       bool ret = false;
> +
> +       if (!e)
> +               return ret;
> +
> +       switch (e->type) {
> +       case E_SYMBOL:
> +       case E_AND:
> +               if (expr_calc_value(e) == val)
> +                       ret = true;
> +               break;
> +       case E_OR:
> +               if (expr_revdep_contains(e->left.expr, val))
> +                       ret = true;
> +               else if (expr_revdep_contains(e->right.expr, val))
> +                       ret = true;
> +               break;
> +       default:
> +               break;
> +       }
> +       return ret;
> +}
> +
>  /*
>   * Transform the top level "||" tokens into newlines and prepend each
>   * line with a minus. This makes expressions much easier to read.
> - * Suitable for reverse dependency expressions.
> + * Suitable for reverse dependency expressions. In addition, allow
> + * selective printing of tokens/sub-expressions by their tristate value.
>   */
>  void expr_gstr_print_revdep(struct expr *e, struct gstr *gs, enum print_type t)
>  {
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 21cb67c15091..d5b096725ca8 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -37,6 +37,9 @@ enum expr_type {
>  enum print_type {
>         PRINT_NORMAL,
>         PRINT_REVDEP_ALL,

PRINT_REVDEP_ALL is unused now, right?

Guess it doesn't hurt that much to have it there, though I'm more of a
"it won't be needed" person.

> +       PRINT_REVDEP_YES,
> +       PRINT_REVDEP_MOD,
> +       PRINT_REVDEP_NO,
>  };
>
>  union expr_data {
> @@ -316,6 +319,7 @@ void expr_fprint(struct expr *e, FILE *out);
>  struct gstr; /* forward */
>  void expr_gstr_print(struct expr *e, struct gstr *gs);
>  void expr_gstr_print_revdep(struct expr *e, struct gstr *gs, enum print_type t);
> +bool expr_revdep_contains(struct expr *e, tristate val);
>
>  static inline int expr_is_yes(struct expr *e)
>  {
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index 9dc8abfb1dc3..69ed1477e4ef 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -25,6 +25,7 @@ bool menu_has_help(struct menu *menu);
>  const char * menu_get_help(struct menu *menu);
>  struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
>  void menu_get_ext_help(struct menu *menu, struct gstr *help);
> +void get_revdep_by_type(struct expr *e, char *s, struct gstr *r);
>
>  /* symbol.c */
>  extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 5b8edba105f2..d13ffa69d65b 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -790,6 +790,31 @@ static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
>                 str_append(r, "\n");
>  }
>
> +void get_revdep_by_type(struct expr *e, char *s, struct gstr *r)
> +{
> +       if (!e)
> +               return;
> +
> +       if (expr_revdep_contains(e, yes)) {
> +               str_append(r, s);
> +               str_append(r, _(" [y]:"));
> +               expr_gstr_print_revdep(e, r, PRINT_REVDEP_YES);
> +               str_append(r, "\n");
> +       }
> +       if (expr_revdep_contains(e, mod)) {
> +               str_append(r, s);
> +               str_append(r, _(" [m]:"));
> +               expr_gstr_print_revdep(e, r, PRINT_REVDEP_MOD);
> +               str_append(r, "\n");
> +       }
> +       if (expr_revdep_contains(e, no)) {
> +               str_append(r, s);
> +               str_append(r, _(" [n]:"));
> +               expr_gstr_print_revdep(e, r, PRINT_REVDEP_NO);
> +               str_append(r, "\n");
> +       }
> +}

Those _() are for gettext btw. Not sure those strings need
translations (or if anyone is translating Kconfig), so I think they
could be removed here.

> +
>  /*
>   * head is optional and may be NULL
>   */
> @@ -826,18 +851,10 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
>         }
>
>         get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
> -       if (sym->rev_dep.expr) {
> -               str_append(r, _("  Selected by: "));
> -               expr_gstr_print_revdep(sym->rev_dep.expr, r, PRINT_REVDEP_ALL);
> -               str_append(r, "\n");
> -       }
> +       get_revdep_by_type(sym->rev_dep.expr, "  Selected by", r);
>
>         get_symbol_props_str(r, sym, P_IMPLY, _("  Implies: "));
> -       if (sym->implied.expr) {
> -               str_append(r, _("  Implied by: "));
> -               expr_gstr_print_revdep(sym->implied.expr, r, PRINT_REVDEP_ALL);
> -               str_append(r, "\n");
> -       }
> +       get_revdep_by_type(sym->implied.expr, "  Implied by", r);
>
>         str_append(r, "\n\n");
>  }
> --
> 2.16.1
>

Looks like a very nice patchset in general to me.

Cheers,
Ulf
