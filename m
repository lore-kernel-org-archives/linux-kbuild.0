Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:45616 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730811AbfDXPDA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Apr 2019 11:03:00 -0400
Received: by mail-vk1-f196.google.com with SMTP id h127so4089527vkd.12
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Apr 2019 08:02:59 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id y1sm10794953uai.0.2019.04.24.08.02.57
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Apr 2019 08:02:57 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id x2so4094101vkx.13
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Apr 2019 08:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <1556107369-7655-1-git-send-email-alex.popov@linux.com>
In-Reply-To: <1556107369-7655-1-git-send-email-alex.popov@linux.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 24 Apr 2019 08:02:45 -0700
Message-ID: <CAGXu5jLJeC4oAagPGSquKi_EVvA9+aZkjtASGwriGMeR_dxwnQ@mail.gmail.com>
Subject: Re: [v2 1/1] kconfig: Terminate menu blocks with a comment in the
 generated config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Popov <alex.popov@linux.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Apr 24, 2019 at 5:03 AM Alexander Popov <alex.popov@linux.com> wrote:
>
> Currently menu blocks start with a pretty header but end with nothing in
> the generated config. So next config options stick together with the
> options from the menu block.
>
> Let's terminate menu blocks in the generated config with a comment and
> a newline if needed. Example:
>
> ...
> CONFIG_BPF_STREAM_PARSER=y
> CONFIG_NET_FLOW_LIMIT=y
>
> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=y
> CONFIG_NET_DROP_MONITOR=y
> # end of Network testing
> # end of Networking options
>
> CONFIG_HAMRADIO=y
> ...
>
> Signed-off-by: Alexander Popov <alex.popov@linux.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  scripts/kconfig/confdata.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 08ba146..486b4c7 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -819,6 +819,7 @@ int conf_write(const char *name)
>         struct menu *menu;
>         const char *basename;
>         const char *str;
> +       bool need_newline = false;
>         char dirname[PATH_MAX+1], tmpname[PATH_MAX+22], newname[PATH_MAX+8];
>         char *env;
>
> @@ -871,12 +872,16 @@ int conf_write(const char *name)
>                                      "#\n"
>                                      "# %s\n"
>                                      "#\n", str);
> +                       need_newline = false;
>                 } else if (!(sym->flags & SYMBOL_CHOICE)) {
>                         sym_calc_value(sym);
>                         if (!(sym->flags & SYMBOL_WRITE))
>                                 goto next;
> +                       if (need_newline) {
> +                               fprintf(out, "\n");
> +                               need_newline = false;
> +                       }
>                         sym->flags &= ~SYMBOL_WRITE;
> -
>                         conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
>                 }
>
> @@ -888,6 +893,11 @@ int conf_write(const char *name)
>                 if (menu->next)
>                         menu = menu->next;
>                 else while ((menu = menu->parent)) {
> +                       if (!menu->sym && menu_is_visible(menu)) {
> +                               str = menu_get_prompt(menu);
> +                               fprintf(out, "# end of %s\n", str);
> +                               need_newline = true;
> +                       }
>                         if (menu->next) {
>                                 menu = menu->next;
>                                 break;
> --
> 2.7.4
>


-- 
Kees Cook
