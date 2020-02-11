Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51178 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgBKQjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 11:39:19 -0500
MIME-Version: 1.0
References: <20200207091351.18133-1-geert@linux-m68k.org> <CAK7LNAQGcw1jbb=fWd_CbWv5hQrkqG_QFCw3uY4LXroONGM6BA@mail.gmail.com>
 <20200211161905.GM4543@sirena.org.uk>
In-Reply-To: <20200211161905.GM4543@sirena.org.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Feb 2020 01:38:16 +0900
Message-ID: <CAK7LNARCr8afvs=h5-ZWVs=Bkk7PSMNvX+M_SeBSF-L99UencA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] ASoC: Use imply for SND_SOC_ALL_CODECS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 12, 2020 at 1:19 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 12, 2020 at 01:09:30AM +0900, Masahiro Yamada wrote:
>
> > Why does SND_SOC_ALL_CODECS exist in the first place?
> > Is this compile-test or run-test?
>
> It's for compile coverage.
>
> > If it is the former, allyesconfig / allmodconfig
> > covers all of them.
>
> No it doesn't.  Those only enable user selectable options, many CODEC
> drivers don't have user selectable options as they are selected by
> machine drivers some of which either have more platform specific
> dependencies that the CODEC drivers or aren't upstream.


Maybe, can you add a prompt which is only displayed
if COMPILE_TEST is enabled?



For example,

config SND_SOC_L3
        tristate "some prompt" if COMPILE_TEST




In normal use-cases, this CONFIG option is hidden
since we expect it to be selected by some machine options.

If COMPILE_TEST is enabled, we can toggle as you like.


If I run
 $ git grep  "if COMPILE_TEST"

I see many usages of this tip.


-- 
Best Regards
Masahiro Yamada
