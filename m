Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34118 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728435AbeJ3DRX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Oct 2018 23:17:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id l6-v6so9822086wrt.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Oct 2018 11:27:33 -0700 (PDT)
Date: Mon, 29 Oct 2018 19:27:30 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 1/1] merge_config.sh: Replace prefix CONFIG_ with any
 prefix
Message-ID: <20181029182728.GB24489@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20181028125510.9346-1-petr.vorel@gmail.com>
 <CAK7LNARccwZNM=4jOEoHNiZ-x4FrzNDG6uZtEXhQMA0z7Pnunw@mail.gmail.com>
 <20181029154006.GC14084@x230>
 <CAK7LNATFij3J+y=LuUvdrGonFa4gpcC8GBwNKN+Av2FOYbM_rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATFij3J+y=LuUvdrGonFa4gpcC8GBwNKN+Av2FOYbM_rQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, m.patzlaff@pilz.de, afshin.nasser@gmail.com, angelo.compagnucci@gmail.com, Arnout Vandecappelle <arnout@mind.be>, Matthew Weber <matthew.weber@rockwellcollins.com>, John Stultz <john.stultz@linaro.org>

Hi Masahiro,

> Please send v2 with the commit log properly filled.
OK I'll do.

> I will take my credit as Suggested-by.
Sure :).

> > > +# Check the environment variable "CONFIG_" for the config option prefix.
> > > +# If unset, the default is "CONFIG_".
> > > +: ${CONFIG_=CONFIG_}
> > Although I guess this could be less cryptic:
> > CONFIG_="${CONFIG_:-CONFIG_}"

> You should not use the colon
> because we want to allow the environment variable
> 'CONFIG_' being set as empty.
How about having default 'CONFIG_' and if it's empty change it to
'[A-Z0-9_]\+' ? I know, it's different from C definition in lkc.h, but IMHO it'd
make sense. But I guess you prefer your suggestion CONFIG_PREFIX=${CONFIG_-CONFIG_}

> In fact, Buildroot uses empty prefix instead of "BR2_".
> In my understanding, Buildroot just has a convention where
> symbols in Config.in files start with "BR2_".
IMHO buildroot uses 'BR2_' prefix. That's what we want to use with
merge_config.sh.


Kind regards,
Petr
