Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:55760 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgBADN1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 22:13:27 -0500
MIME-Version: 1.0
References: <20200122100344.50751-1-vincenzo.frascino@arm.com>
In-Reply-To: <20200122100344.50751-1-vincenzo.frascino@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2020 12:12:44 +0900
Message-ID: <CAK7LNATxbGWGW19N9H-HAiSY0AL0iFs8D_H0DEKmEfTGTT88iA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Sanitize make randconfig generated .config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.


On Wed, Jan 22, 2020 at 7:03 PM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
>
> "make randconfig" calculates the probability of a tristate option (yes,
> mod, no) based on srand()/rand() and can be fed with a seed.
> At the last step of randconfig some option are chosen randomly and their
> tristate set based on similar mechanism.
> After this passage the resulting .config is not sanitized, hence it
> might result in an inconsistent set of options being selected.
>
> This was noticed on arm64 using KCONFIG_SEED=0x40C5E904. During
> randomize_choice_values() CONFIG_BIG_ENDIAN is enabled. Since CONFIG_EFI
> was enabled at a previous step, and depends on !CONFIG_BIG_ENDIAN the
> resulting .config is inconsistent.
>
> Fix the issue making sure that randconfig sanitizes the generated
> .config as a last step.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  scripts/kconfig/conf.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 1f89bf1558ce..c0fcaa4e9762 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -654,6 +654,11 @@ int main(int ac, char **av)
>         case randconfig:
>                 /* Really nothing to do in this loop */
>                 while (conf_set_all_new_symbols(def_random)) ;
> +               /*
> +                * .config at this point might contain
> +                * incompatible options. Sanitize it.
> +                */
> +               sym_clear_all_valid();

Thanks for the report, but clearing
all the valid flags is a big hammer.
I do not think it is a proper fix.


I checked the code, and I noticed the root cause of
this bug.

I will send a different patch later.




>                 break;
>         case defconfig:
>                 conf_set_all_new_symbols(def_default);
> --
> 2.25.0
>


-- 
Best Regards
Masahiro Yamada
