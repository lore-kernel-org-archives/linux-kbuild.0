Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24892 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbeJaAy7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 20:54:59 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w9UG0f41025741
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Oct 2018 01:00:42 +0900
Received: by mail-vs1-f44.google.com with SMTP id v205so5389467vsc.3
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Oct 2018 09:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20181029211058.7062-1-petr.vorel@gmail.com>
In-Reply-To: <20181029211058.7062-1-petr.vorel@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 31 Oct 2018 01:00:04 +0900
Message-ID: <CAK7LNATqRg=SEjVFfVLBsNs9q4R8wQy1up8Bf_JPdzh9uCB27w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] merge_config.sh: Allow to define config prefix
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, m.patzlaff@pilz.de, nasser afshin <afshin.nasser@gmail.com>, Angelo Compagnucci <angelo.compagnucci@gmail.com>, Arnout Vandecappelle <arnout@mind.be>, Matthew Weber <matthew.weber@rockwellcollins.com>, John Stultz <john.stultz@linaro.org>

On Tue, Oct 30, 2018 at 6:11 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> with CONFIG_ environment variable.
>
> merge_config.sh uses CONFIG_ which is used in kernel and other projects.
> There are some projects which use kconfig with different prefixes (e.g.
> buildroot: BR2_ prefix). CONFIG_ variable is already used for this
> purpose in kconfig binary (scripts/kconfig/lkc.h), let's use the same
> rule for in merge_config.sh.
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild. Thanks!



>  scripts/kconfig/merge_config.sh | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 67d131447631..7067a9fe0fa3 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -26,6 +26,8 @@ clean_up() {
>  }
>  trap clean_up HUP INT TERM
>
> +CONFIG_PREFIX=${CONFIG_-CONFIG_}
> +
>  usage() {
>         echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
>         echo "  -h    display this help text"
> @@ -33,6 +35,8 @@ usage() {
>         echo "  -n    use allnoconfig instead of alldefconfig"
>         echo "  -r    list redundant entries when merging fragments"
>         echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
> +       echo
> +       echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
>  }
>
>  RUNMAKE=true
> @@ -99,7 +103,8 @@ if [ ! -r "$INITFILE" ]; then
>  fi
>
>  MERGE_LIST=$*
> -SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> +SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
> +
>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
>
>  echo "Using $INITFILE as base"
> --
> 2.19.1
>


-- 
Best Regards
Masahiro Yamada
