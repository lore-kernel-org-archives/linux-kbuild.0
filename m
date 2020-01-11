Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45449 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgAKHTI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:19:08 -0500
MIME-Version: 1.0
References: <20200109161724.9546-1-brgl@bgdev.pl> <CAK7LNAQQcGLq46QOhqHArQvQG8DP2uQDtpn8XoUthNhwu8Aiyg@mail.gmail.com>
 <CAMpxmJUp_sEzf7sO1m=A+16eAhMJtu2Z_O2cZk7XCQeSjNj9+A@mail.gmail.com>
In-Reply-To: <CAMpxmJUp_sEzf7sO1m=A+16eAhMJtu2Z_O2cZk7XCQeSjNj9+A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 16:18:01 +0900
Message-ID: <CAK7LNAT8ZgeMRgm1jjnj6P+UPWF-uuJtJj8hmgCsx6JRD2h5rg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: ignore temporary generated files
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 10, 2020 at 1:38 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> czw., 9 sty 2020 o 17:36 Masahiro Yamada <masahiroy@kernel.org> napisa=C5=
=82(a):
> >
> > On Fri, Jan 10, 2020 at 1:17 AM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > If building gconfig fails, a temporary gtk config file is left in the
> > > kconfig directory and is not ignored by git. Add an appropriate patte=
rn
> > > to .gitignore.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  scripts/kconfig/.gitignore | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
> > > index b5bf92f66d11..d22e6753397d 100644
> > > --- a/scripts/kconfig/.gitignore
> > > +++ b/scripts/kconfig/.gitignore
> > > @@ -3,6 +3,7 @@
> > >  #
> > >  *.moc
> > >  *conf-cfg
> > > +*conf-cfg.tmp
> >
> > I have no idea in which situation this pattern is left.
> >
> > Could you tell me the way to reproduce it?
>
> Sure:
>
> 1. Don't have gtk+ development files installed.
> 2. Run `make gconfig`.
> 3. Watch it fail with the following error message:
>
> ---
> $ make gconfig
> *
> * Unable to find the GTK+ installation. Please make sure that
> * the GTK+ 2.0 development package is correctly installed.
> * You need gtk+-2.0 gmodule-2.0 libglade-2.0
> *
> make[1]: *** [scripts/kconfig/Makefile:212: scripts/kconfig/gconf-cfg] Er=
ror 1
> make: *** [Makefile:568: gconfig] Error 2
> ---
>
> 4. See the file `gconf-cfg.tmp` under scripts/kconfig.
>
> Bart

Thanks for this info.

This seems a kbuild bug, so I fixed the root cause
instead of hiding the garbage files.

https://patchwork.kernel.org/patch/11326631/


--=20
Best Regards
Masahiro Yamada
