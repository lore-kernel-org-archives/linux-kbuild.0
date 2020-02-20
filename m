Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:63092 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbgBTQVm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Feb 2020 11:21:42 -0500
Date: Thu, 20 Feb 2020 11:21:37 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
In-Reply-To: <CAK7LNASubs2oJ8-a-amsEhWjYrfpAx8QxeTzH4PnKsELKyLaUw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.2002201117050.1559@knanqh.ubzr>
References: <20200219074950.23344-1-masahiroy@kernel.org> <nycvar.YSQ.7.76.2002191046520.1559@knanqh.ubzr> <CAK7LNASubs2oJ8-a-amsEhWjYrfpAx8QxeTzH4PnKsELKyLaUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Richard Cochran <richardcochran@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Josh Triplett <josh@joshtriplett.org>, Mark Brown <broonie@kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 20 Feb 2020, Masahiro Yamada wrote:

> Hi Nicolas,
> 
> On Thu, Feb 20, 2020 at 1:16 AM Nicolas Pitre <nico@fluxnic.net> wrote:
> >
> > On Wed, 19 Feb 2020, Masahiro Yamada wrote:
> >
> > > As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
> > > by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
> > > possible value is BAZ=n.
> >
> > I don't think this is right. The imply keyword provide influence over
> > another symbol but it should not impose any restrictions. If BAR=m then
> > BAZ should still be allowed to be m or n.
> >
> > > @@ -174,6 +174,9 @@ applicable everywhere (see syntax).
> > >       n               y               n               N/m/y
> > >       m               y               m               M/y/n
> > >       y               y               y               Y/n
> > > +     n               m               n               N/m
> > > +     m               m               m               M/n
> > > +     y               m               n               N
> >
> > Here the last line shoule be y m n N/m.
> >
> > Generally speaking, the code enabled by FOO may rely on functionalities
> > provided by BAZ only when BAZ >= FOO. This is accomplished with
> > IS_REACHABLE():
> >
> >         foo_init()
> >         {
> >                 if (IS_REACHABLE(CONFIG_BAZ))
> >                         baz_register(&foo);
> >                 ...
> >         }
> >
> > So if FOO=y and BAZ=m then IS_REACHABLE(CONFIG_BAZ) will be false. Maybe
> > adding a note to that effect linked to the "y m n N/m" line in the table
> > would be a good idea.
> >
> 
> I also thought so.
> 
> I agree IS_REACHABLE() is much saner approach.
> 
> So, do you agree to change the current behavior
> as follows?
> 
> 
> index d0111dd26410..47dbfd1ee003 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -173,7 +173,7 @@ applicable everywhere (see syntax).
>         ===             ===             =============   ==============
>         n               y               n               N/m/y
>         m               y               m               M/y/n
> -       y               y               y               Y/n
> +       y               y               y               Y/m/n
>         y               n               *               N
>         ===             ===             =============   ==============
> 

Yes. That should have been the case all along.


Nicolas
