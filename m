Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48072 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgBTHqH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Feb 2020 02:46:07 -0500
MIME-Version: 1.0
References: <20200219074950.23344-1-masahiroy@kernel.org> <nycvar.YSQ.7.76.2002191046520.1559@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2002191046520.1559@knanqh.ubzr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 20 Feb 2020 16:45:13 +0900
Message-ID: <CAK7LNASubs2oJ8-a-amsEhWjYrfpAx8QxeTzH4PnKsELKyLaUw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Richard Cochran <richardcochran@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Josh Triplett <josh@joshtriplett.org>, Mark Brown <broonie@kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Nicolas,

On Thu, Feb 20, 2020 at 1:16 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Wed, 19 Feb 2020, Masahiro Yamada wrote:
>
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
>
> I don't think this is right. The imply keyword provide influence over
> another symbol but it should not impose any restrictions. If BAR=m then
> BAZ should still be allowed to be m or n.
>
> > @@ -174,6 +174,9 @@ applicable everywhere (see syntax).
> >       n               y               n               N/m/y
> >       m               y               m               M/y/n
> >       y               y               y               Y/n
> > +     n               m               n               N/m
> > +     m               m               m               M/n
> > +     y               m               n               N
>
> Here the last line shoule be y m n N/m.
>
> Generally speaking, the code enabled by FOO may rely on functionalities
> provided by BAZ only when BAZ >= FOO. This is accomplished with
> IS_REACHABLE():
>
>         foo_init()
>         {
>                 if (IS_REACHABLE(CONFIG_BAZ))
>                         baz_register(&foo);
>                 ...
>         }
>
> So if FOO=y and BAZ=m then IS_REACHABLE(CONFIG_BAZ) will be false. Maybe
> adding a note to that effect linked to the "y m n N/m" line in the table
> would be a good idea.
>

I also thought so.

I agree IS_REACHABLE() is much saner approach.

So, do you agree to change the current behavior
as follows?


index d0111dd26410..47dbfd1ee003 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -173,7 +173,7 @@ applicable everywhere (see syntax).
        ===             ===             =============   ==============
        n               y               n               N/m/y
        m               y               m               M/y/n
-       y               y               y               Y/n
+       y               y               y               Y/m/n
        y               n               *               N
        ===             ===             =============   ==============






-- 
Best Regards
Masahiro Yamada
