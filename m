Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37006 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727491AbeJ3A3U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Oct 2018 20:29:20 -0400
Received: by mail-wm1-f68.google.com with SMTP id p2-v6so8396673wmc.2
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Oct 2018 08:40:11 -0700 (PDT)
Date: Mon, 29 Oct 2018 16:40:07 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 1/1] merge_config.sh: Replace prefix CONFIG_ with any
 prefix
Message-ID: <20181029154006.GC14084@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20181028125510.9346-1-petr.vorel@gmail.com>
 <CAK7LNARccwZNM=4jOEoHNiZ-x4FrzNDG6uZtEXhQMA0z7Pnunw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARccwZNM=4jOEoHNiZ-x4FrzNDG6uZtEXhQMA0z7Pnunw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, m.patzlaff@pilz.de, afshin.nasser@gmail.com, angelo.compagnucci@gmail.com, Arnout Vandecappelle <arnout@mind.be>, Matthew Weber <matthew.weber@rockwellcollins.com>, John Stultz <john.stultz@linaro.org>

Hi Masahiro,

thanks for a quick review and patch.

> I'd like to filter "CONFIG_", "BR2_", or whatever specified prefix.

> Some fragment files (e.g. arch/x86/configs/xen.config)
> have comment lines.

> Matching '# ' + arbitrary string
> might hit comment lines accidentally.
Make sense.

> The kconfig binary checks the environment variable 'CONFIG_'
> to override the default prefix:
> https://github.com/torvalds/linux/blob/v4.19/scripts/kconfig/lkc.h#L28
What a crazy variable name. But we're not going to change it.

> For similarity, how about doing in the same way in merge_config.sh ?
Make sense to keep the same approach.

> Does the following work for you ?
> (you can pass CONFIG_=BR2_ to merge_config.sh)
Patch is good (with one note bellow).

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Could you push your patch into your tree?
Or going to post a patch? If not here is mine:


> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 67d1314..391ee6c 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -90,6 +90,10 @@ if [ -z "$KCONFIG_CONFIG" ]; then
>         fi
>  fi

> +# Check the environment variable "CONFIG_" for the config option prefix.
> +# If unset, the default is "CONFIG_".
> +: ${CONFIG_=CONFIG_}
Although I guess this could be less cryptic:
CONFIG_="${CONFIG_:-CONFIG_}"
but too verbose, so I'm for your variant.

...
>  MERGE_LIST=$*
> -SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> +SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_}[a-zA-Z0-9_]*\)[= ].*/\2/p"
>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)

Kind regards,
Petr
