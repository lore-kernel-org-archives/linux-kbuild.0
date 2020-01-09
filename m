Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qv1-f65.google.com ([209.85.219.65]:36674 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732838AbgAIQDW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:03:22 -0500
Received: by mail-qv1-f65.google.com with SMTP id m14so3172949qvl.3
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 08:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20200109125627.24654-1-brgl@bgdev.pl> <CAK7LNASBLXzgy2=fGfyrGbbWq2wL7Y9uaSh-MQQcd7tpvUBbMg@mail.gmail.com>
In-Reply-To: <CAK7LNASBLXzgy2=fGfyrGbbWq2wL7Y9uaSh-MQQcd7tpvUBbMg@mail.gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 9 Jan 2020 17:03:09 +0100
Message-ID: <CAMpxmJX50pBQTDdsy=w1+uNQym+vGnZJiCrWBDmn0ti3igCjvQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix an "implicit declaration of function" warning
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

czw., 9 sty 2020 o 16:59 Masahiro Yamada <masahiroy@kernel.org> napisa=C5=
=82(a):
>
> On Thu, Jan 9, 2020 at 9:56 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > strncasecmp() & strcasecmp() functions are declared in strings.h, not
> > string.h. On most environments the former is implicitly included by
> > the latter but on some setups, building menuconfig results in the
> > following warning:
> >
> >   HOSTCC  scripts/kconfig/mconf.o
> > scripts/kconfig/mconf.c: In function =E2=80=98search_conf=E2=80=99:
> > scripts/kconfig/mconf.c:423:6: warning: implicit declaration of functio=
n =E2=80=98strncasecmp=E2=80=99 [-Wimplicit-function-declaration]
> >   if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) =3D=3D=
 0)
> >       ^~~~~~~~~~~
> > scripts/kconfig/mconf.c: In function =E2=80=98main=E2=80=99:
> > scripts/kconfig/mconf.c:1021:8: warning: implicit declaration of functi=
on =E2=80=98strcasecmp=E2=80=99 [-Wimplicit-function-declaration]
> >    if (!strcasecmp(mode, "single_menu"))
> >         ^~~~~~~~~~
> >
> > Fix it by explicitly including strings.h.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Thanks.
>
> I see strncasecmp() in
> scripts/kconfig/nconf.c too.
>
> Could you fix both in a single patch?
>
> You can try it with "make nconfig".

Sure. It seems gconf needs the same change too.

Bart
