Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:46843 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932976AbeALNV4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 08:21:56 -0500
MIME-Version: 1.0
In-Reply-To: <1515567374-12722-2-git-send-email-yamada.masahiro@socionext.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com> <1515567374-12722-2-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 12 Jan 2018 14:21:55 +0100
Message-ID: <CAFkk2KR0eyT=8p_MK4i5Mgpg09mwcfVVz=kRYGdwWoPYJAdOBg@mail.gmail.com>
Subject: Re: [PATCH 2/6] kconfig: call sym_calc_value() for all symbols before
 writing to .config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Marc Herbert <marc.herbert@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 10, 2018 at 7:56 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> conf_write() skips sym_calc_value() for "choice", but we do not need
> to do so.
>
> conf_set_all_new_symbols() may have already called sym_calc_value()
> for "choice", but set_all_choice_value() has cleared SYMBOL_VALID away.
> So, conf_write() re-calculates "choice" here when calculating the
> visibility of its children (choice value).
>
> We can pass NULL to sym_calc_value() since it is no-op.
>
> This should give no impact on behavior, but make the logic more easier
> to understand.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/confdata.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 027f5b4..bc83965 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -790,6 +790,8 @@ int conf_write(const char *name)
>         menu = rootmenu.list;
>         while (menu) {
>                 sym = menu->sym;
> +               sym_calc_value(sym);
> +
>                 if (!sym) {
>                         if (!menu_is_visible(menu))
>                                 goto next;
> @@ -799,7 +801,6 @@ int conf_write(const char *name)
>                                      "# %s\n"
>                                      "#\n", str);
>                 } else if (!(sym->flags & SYMBOL_CHOICE)) {

Unrelated, but this could use !sym_is_choice(sym) as well.

> -                       sym_calc_value(sym);
>                         if (!(sym->flags & SYMBOL_WRITE))
>                                 goto next;
>                         sym->flags &= ~SYMBOL_WRITE;
> --
> 2.7.4
>

Not tested, but looks fine.

As a note if anyone else takes a look, choices get propagated to the
property conditions of the contained symbols, which indirectly causes
the choice to be calculated when the visibility of a contained symbol
is calculated.

Acked-by: Ulf Magnusson <ulfalizer@gmail.com>

Cheers,
Ulf
