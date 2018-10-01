Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49115 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbeJBBlU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Oct 2018 21:41:20 -0400
MIME-Version: 1.0
References: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com>
 <1538387078-21892-3-git-send-email-yamada.masahiro@socionext.com> <CAKwvOd=R1FN_nmR4Wkpb=nTt+v2f2+uWOcQCFoB+B1hWzCXCXA@mail.gmail.com>
In-Reply-To: <CAKwvOd=R1FN_nmR4Wkpb=nTt+v2f2+uWOcQCFoB+B1hWzCXCXA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 2 Oct 2018 04:01:09 +0900
Message-ID: <CAK7LNAT=2k=v6C9q4oGNWY3WjfswtD60NVEzgkF4ACkxNYjRug@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: add -Wno-unused-but-set-variable compiler
 flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Nick,

2018=E5=B9=B410=E6=9C=882=E6=97=A5(=E7=81=AB) 2:18 Nick Desaulniers <ndesau=
lniers@google.com>:
>
> On Mon, Oct 1, 2018 at 2:45 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > We have raised the compiler requirement from time to time.
> > With commit cafa0010cd51 ("Raise the minimum required gcc version
> > to 4.6"), the minimum for GCC is 4.6 now.
> >
> > This flag was added by GCC 4.6, and it is recognized by Clang and
> > ICC as well.
>
> This doesn't seem to be the case for Clang:
> https://godbolt.org/z/qesF5o
>
> Nacked-by: Nick Desaulniers <ndesaulniers@google.com>

Hmm, I tested this patch with pre-built Clang 6.0.1 / 7.0.0
downloaded from http://releases.llvm.org/download.html

Was this option dropped by clang 8 ?


>
> >
> > Let's rip off the cc-disable-warning switch, and see if somebody
> > complains about it.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 8a23fee..2627266 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -716,7 +716,7 @@ else
> >
> >  # These warnings generated too much noise in a regular build.
> >  # Use make W=3D1 to enable them (see scripts/Makefile.extrawarn)
> > -KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-but-set-variable)
> > +KBUILD_CFLAGS +=3D -Wno-unused-but-set-variable
> >  endif
> >
> >  KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-const-variable)
> > --
> > 2.7.4
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Best Regards
Masahiro Yamada
