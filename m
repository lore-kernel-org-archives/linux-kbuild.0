Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48325 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbeJ3EJ1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 00:09:27 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w9TJJA8r017111
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Oct 2018 04:19:10 +0900
Received: by mail-ua1-f48.google.com with SMTP id e16so3498212uam.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Oct 2018 12:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20181028125510.9346-1-petr.vorel@gmail.com> <CAK7LNARccwZNM=4jOEoHNiZ-x4FrzNDG6uZtEXhQMA0z7Pnunw@mail.gmail.com>
 <20181029154006.GC14084@x230> <CAK7LNATFij3J+y=LuUvdrGonFa4gpcC8GBwNKN+Av2FOYbM_rQ@mail.gmail.com>
 <20181029182728.GB24489@x230>
In-Reply-To: <20181029182728.GB24489@x230>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 30 Oct 2018 04:18:33 +0900
Message-ID: <CAK7LNARinvoLMkFKfWpxMfUS_0sJbSPaB5Ds-SrODVyiBpaXAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] merge_config.sh: Replace prefix CONFIG_ with any prefix
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, m.patzlaff@pilz.de, nasser afshin <afshin.nasser@gmail.com>, Angelo Compagnucci <angelo.compagnucci@gmail.com>, Arnout Vandecappelle <arnout@mind.be>, Matthew Weber <matthew.weber@rockwellcollins.com>, John Stultz <john.stultz@linaro.org>

On Tue, Oct 30, 2018 at 3:27 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi Masahiro,
>
> > Please send v2 with the commit log properly filled.
> OK I'll do.
>
> > I will take my credit as Suggested-by.
> Sure :).
>
> > > > +# Check the environment variable "CONFIG_" for the config option prefix.
> > > > +# If unset, the default is "CONFIG_".
> > > > +: ${CONFIG_=CONFIG_}
> > > Although I guess this could be less cryptic:
> > > CONFIG_="${CONFIG_:-CONFIG_}"
>
> > You should not use the colon
> > because we want to allow the environment variable
> > 'CONFIG_' being set as empty.
> How about having default 'CONFIG_' and if it's empty change it to
> '[A-Z0-9_]\+' ?

No, I'd like to have the same rule for prefix.



> I know, it's different from C definition in lkc.h, but IMHO it'd
> make sense. But I guess you prefer your suggestion CONFIG_PREFIX=${CONFIG_-CONFIG_}

Yeah, I prefer this.


> > In fact, Buildroot uses empty prefix instead of "BR2_".
> > In my understanding, Buildroot just has a convention where
> > symbols in Config.in files start with "BR2_".
> IMHO buildroot uses 'BR2_' prefix. That's what we want to use with
> merge_config.sh.

Yes, you can use 'BR2_' prefix for merge_config.

I just wanted to point out that
Buildroot's own patch specifies the prefix as empty
wrt the kconfig binary.

https://github.com/buildroot/buildroot/blob/2018.08.2/support/kconfig/patches/10-br-build-system.patch#L32



>
> Kind regards,
> Petr



-- 
Best Regards
Masahiro Yamada
