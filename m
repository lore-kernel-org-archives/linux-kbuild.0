Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:35041 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751256AbdJEDOn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 23:14:43 -0400
MIME-Version: 1.0
In-Reply-To: <1507096094-14953-1-git-send-email-ulfalizer@gmail.com>
References: <1507096094-14953-1-git-send-email-ulfalizer@gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 5 Oct 2017 05:14:41 +0200
Message-ID: <CAFkk2KTp4njaTw5xAPC7V1cArui=7jqu3ORMTCzaACz6dngnyA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Document the 'symbol' struct
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnaud Lacombe <lacombar@gmail.com>

On Wed, Oct 4, 2017 at 7:48 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> Visibility and choices in particular might be a bit tricky to figure
> out.
>
> Also fix existing comment to point out that P_MENU is also used for
> menus.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  scripts/kconfig/expr.h | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index a73f762..6344067 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -74,17 +74,60 @@ enum {
>         S_DEF_COUNT
>  };
>
> +/*
> + * Represents a configuration symbol.
> + *
> + * Choices are represented as a special kind of symbol and have the
> + * SYMBOL_CHOICE bit set in 'flags'.
> + */
>  struct symbol {
> +       /* The next symbol in the same bucket in the symbol hash table */
>         struct symbol *next;
> +
> +       /* The name of the symbol, e.g. "FOO" for 'config FOO' */
>         char *name;
> +
> +       /* S_BOOLEAN, S_TRISTATE, ... */
>         enum symbol_type type;
> +
> +       /*
> +        * The calculated value of the symbol. The SYMBOL_VALID bit is set in
> +        * 'flags' when this is up to date. Note that this value might differ
> +        * from the user value set in e.g. a .config file, due to visibility.
> +        */
>         struct symbol_value curr;
> +
> +       /*
> +        * Values for the symbol provided from outside. def[S_DEF_USER] holds
> +        * the .config value.
> +        */
>         struct symbol_value def[S_DEF_COUNT];
> +
> +       /*
> +        * An upper bound on the tristate value the user can set for the symbol
> +        * if it is a boolean or tristate. Calculated from prompt dependencies,
> +        * which also inherit dependencies from enclosing menus, choices, and
> +        * ifs. If 'n', the user value will be ignored.
> +        *
> +        * Symbols lacking prompts always have visibility 'n'.
> +        */
>         tristate visible;
> +
> +       /* SYMBOL_* flags */
>         int flags;
> +
> +       /* List of properties. See prop_type. */
>         struct property *prop;
> +
> +       /* Dependencies from enclosing menus, choices, and ifs */
>         struct expr_value dir_dep;
> +
> +       /* Reverse dependencies through being selected by other symbols */
>         struct expr_value rev_dep;
> +
> +       /*
> +        * "Weak" reverse dependencies through being implied by other symbols
> +        */
>         struct expr_value implied;
>  };
>
> @@ -133,7 +176,7 @@ enum prop_type {
>         P_UNKNOWN,
>         P_PROMPT,   /* prompt "foo prompt" or "BAZ Value" */
>         P_COMMENT,  /* text associated with a comment */
> -       P_MENU,     /* prompt associated with a menuconfig option */
> +       P_MENU,     /* prompt associated with a menu or menuconfig symbol */
>         P_DEFAULT,  /* default y */
>         P_CHOICE,   /* choice value */
>         P_SELECT,   /* select BAR */
> --
> 2.7.4
>

Adding some CCs just because I forgot. No panic.

Cheers,
Ulf
