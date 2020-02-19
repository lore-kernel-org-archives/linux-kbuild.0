Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32638 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgBSJYh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 04:24:37 -0500
MIME-Version: 1.0
References: <20200219074950.23344-1-masahiroy@kernel.org> <CAMuHMdU7=jRNCWvtiFhJwUM6P4xNmqwXdPX14qvE=6by1V7APA@mail.gmail.com>
In-Reply-To: <CAMuHMdU7=jRNCWvtiFhJwUM6P4xNmqwXdPX14qvE=6by1V7APA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Feb 2020 18:23:37 +0900
Message-ID: <CAK7LNATKh9Y_QmO19iPw+zXT8RG-HfXBFY5bvpX0YSyOO-=NGA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>, Richard Cochran <richardcochran@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Josh Triplett <josh@joshtriplett.org>, Mark Brown <broonie@kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 19, 2020 at 5:42 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yamada-san,
>
> On Wed, Feb 19, 2020 at 8:51 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > The 'imply' statement may create unmet direct dependency when the
> > implied symbol depends on m.
> >
> > [Test Code]
> >
> >   config FOO
> >           tristate "foo"
> >           imply BAZ
> >
> >   config BAZ
> >           tristate "baz"
> >           depends on BAR
> >
> >   config BAR
> >           def_tristate m
> >
> >   config MODULES
> >           def_bool y
> >           option modules
> >
> > If you set FOO=y, BAZ is also promoted to y, which results in the
> > following .config file:
> >
> >   CONFIG_FOO=y
> >   CONFIG_BAZ=y
> >   CONFIG_BAR=m
> >   CONFIG_MODULES=y
> >
> > This ignores the dependency "BAZ depends on BAR".
> >
> > Unlike 'select', what is worse, Kconfig never shows the
> > "WARNING: unmet direct dependencies detected for ..." for this case.
> >
> > Because 'imply' should be weaker than 'depends on', Kconfig should
> > take the direct dependency into account.
> >
> > Describe this case in Documentation/kbuild/kconfig-language.rst for
> > clarification.
> >
> > Commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword") says that
> > a symbol implied by y is restricted to y or n, excluding m.
> >
> > As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
> > by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
> > possible value is BAZ=n.
> >
> > Having said that, this case was probably "We don't care" at that time
> > because Kconfig did not handle 'depends on m' correctly until
> > commit f622f8279581 ("kconfig: warn unmet direct dependency of tristate
> > symbols selected by y") fixed it.
> >
> > Backporting this to 4.19+ will probably be fine. If you care this
> > problem on 4.14.x, you need to backport f622f8279581 as well.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks a lot! This fixes the build issues in
> https://lore.kernel.org/alsa-devel/CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com/
>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>

Even if this patch fixes the build issues,
the result may not be what you expect.

The very subtle part of 'imply' is that
symbols implied by 'y' cannot be 'm'.

When CONFIG_SND_SOC_ALL_CODECS=y,
the select'ed drivers were previously able to be 'm'.

After ea00d95200d02, drivers that were previously
'm' are now 'n'.

Probably, it shrunk the test-coverage.

I'd recommend to compare the .config file.


-- 
Best Regards
Masahiro Yamada
