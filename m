Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:52804 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbeJ3BMG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Oct 2018 21:12:06 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id w9TGMh01007843
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Oct 2018 01:22:44 +0900
Received: by mail-ua1-f53.google.com with SMTP id s26so1127433uao.0
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Oct 2018 09:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20181028125510.9346-1-petr.vorel@gmail.com> <CAK7LNARccwZNM=4jOEoHNiZ-x4FrzNDG6uZtEXhQMA0z7Pnunw@mail.gmail.com>
 <20181029154006.GC14084@x230>
In-Reply-To: <20181029154006.GC14084@x230>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 30 Oct 2018 01:22:06 +0900
Message-ID: <CAK7LNATFij3J+y=LuUvdrGonFa4gpcC8GBwNKN+Av2FOYbM_rQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] merge_config.sh: Replace prefix CONFIG_ with any prefix
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, m.patzlaff@pilz.de, afshin.nasser@gmail.com, angelo.compagnucci@gmail.com, Arnout Vandecappelle <arnout@mind.be>, Matthew Weber <matthew.weber@rockwellcollins.com>, John Stultz <john.stultz@linaro.org>

Hi Petr,

On Tue, Oct 30, 2018 at 12:40 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi Masahiro,
>
> thanks for a quick review and patch.
>
> > I'd like to filter "CONFIG_", "BR2_", or whatever specified prefix.
>
> > Some fragment files (e.g. arch/x86/configs/xen.config)
> > have comment lines.
>
> > Matching '# ' + arbitrary string
> > might hit comment lines accidentally.
> Make sense.
>
> > The kconfig binary checks the environment variable 'CONFIG_'
> > to override the default prefix:
> > https://github.com/torvalds/linux/blob/v4.19/scripts/kconfig/lkc.h#L28
> What a crazy variable name. But we're not going to change it.
>
> > For similarity, how about doing in the same way in merge_config.sh ?
> Make sense to keep the same approach.
>
> > Does the following work for you ?
> > (you can pass CONFIG_=BR2_ to merge_config.sh)
> Patch is good (with one note bellow).
>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
>
> Could you push your patch into your tree?
> Or going to post a patch? If not here is mine:


Please send v2 with the commit log properly filled.

I will take my credit as Suggested-by.



> > diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> > index 67d1314..391ee6c 100755
> > --- a/scripts/kconfig/merge_config.sh
> > +++ b/scripts/kconfig/merge_config.sh
> > @@ -90,6 +90,10 @@ if [ -z "$KCONFIG_CONFIG" ]; then
> >         fi
> >  fi
>
> > +# Check the environment variable "CONFIG_" for the config option prefix.
> > +# If unset, the default is "CONFIG_".
> > +: ${CONFIG_=CONFIG_}
> Although I guess this could be less cryptic:
> CONFIG_="${CONFIG_:-CONFIG_}"

You should not use the colon
because we want to allow the environment variable
'CONFIG_' being set as empty.

In fact, Buildroot uses empty prefix instead of "BR2_".
In my understanding, Buildroot just has a convention where
symbols in Config.in files start with "BR2_".


So, in order to make your idea even less cryptic,
how about this?


CONFIG_PREFIX=${CONFIG_-CONFIG_}

Then,

SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"








-- 
Best Regards
Masahiro Yamada
