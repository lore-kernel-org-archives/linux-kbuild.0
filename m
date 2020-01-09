Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qv1-f66.google.com ([209.85.219.66]:43847 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387741AbgAIQiQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:38:16 -0500
Received: by mail-qv1-f66.google.com with SMTP id p2so3202196qvo.10
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 08:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20200109161724.9546-1-brgl@bgdev.pl> <CAK7LNAQQcGLq46QOhqHArQvQG8DP2uQDtpn8XoUthNhwu8Aiyg@mail.gmail.com>
In-Reply-To: <CAK7LNAQQcGLq46QOhqHArQvQG8DP2uQDtpn8XoUthNhwu8Aiyg@mail.gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 9 Jan 2020 17:38:03 +0100
Message-ID: <CAMpxmJUp_sEzf7sO1m=A+16eAhMJtu2Z_O2cZk7XCQeSjNj9+A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: ignore temporary generated files
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

czw., 9 sty 2020 o 17:36 Masahiro Yamada <masahiroy@kernel.org> napisa=C5=
=82(a):
>
> On Fri, Jan 10, 2020 at 1:17 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > If building gconfig fails, a temporary gtk config file is left in the
> > kconfig directory and is not ignored by git. Add an appropriate pattern
> > to .gitignore.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  scripts/kconfig/.gitignore | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
> > index b5bf92f66d11..d22e6753397d 100644
> > --- a/scripts/kconfig/.gitignore
> > +++ b/scripts/kconfig/.gitignore
> > @@ -3,6 +3,7 @@
> >  #
> >  *.moc
> >  *conf-cfg
> > +*conf-cfg.tmp
>
> I have no idea in which situation this pattern is left.
>
> Could you tell me the way to reproduce it?

Sure:

1. Don't have gtk+ development files installed.
2. Run `make gconfig`.
3. Watch it fail with the following error message:

---
$ make gconfig
*
* Unable to find the GTK+ installation. Please make sure that
* the GTK+ 2.0 development package is correctly installed.
* You need gtk+-2.0 gmodule-2.0 libglade-2.0
*
make[1]: *** [scripts/kconfig/Makefile:212: scripts/kconfig/gconf-cfg] Erro=
r 1
make: *** [Makefile:568: gconfig] Error 2
---

4. See the file `gconf-cfg.tmp` under scripts/kconfig.

Bart
