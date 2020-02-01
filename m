Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:33998 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgBAFMD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 00:12:03 -0500
MIME-Version: 1.0
References: <20200201050311.3458-1-masahiroy@kernel.org>
In-Reply-To: <20200201050311.3458-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2020 14:11:15 +0900
Message-ID: <CAK7LNATTZGrJmh0CsR8eJUo3b13T9sjZPV4dh+2fCSZ9F4U0YA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix broken dependency in randconfig-generated .config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Feb 1, 2020 at 2:03 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Running randconfig on arm64 using KCONFIG_SEED=0x40C5E904 (e.g. on v5.5)
> produces the .config with CONFIG_EFI=y and CONFIG_CPU_BIG_ENDIAN=y,
> which does not meet the !CONFIG_CPU_BIG_ENDIAN dependency.
>
> This is because the user choice for CONFIG_CPU_LITTLE_ENDIAN vs
> CONFIG_CPU_BIG_ENDIAN is set by randomize_choice_values() after the
> value of CONFIG_EFI is calculated.
>
> When this happens, the has_changed flag should be set.
>
> Currently, it takes the result from the last iteration. It should
> accumulate all the results of the loop.
>
> Reported-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Maybe, this could be tagged:

Fixes: 3b9a19e08960 ("kconfig: loop as long as we changed some symbols
in randconfig")





>  scripts/kconfig/confdata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 99f2418baa6c..eb1efa3abdee 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -1353,7 +1353,7 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
>
>                 sym_calc_value(csym);
>                 if (mode == def_random)
> -                       has_changed = randomize_choice_values(csym);
> +                       has_changed |= randomize_choice_values(csym);
>                 else {
>                         set_all_choice_values(csym);
>                         has_changed = true;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
