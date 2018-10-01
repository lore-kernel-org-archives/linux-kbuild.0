Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40946 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbeJBChh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Oct 2018 22:37:37 -0400
Received: by mail-pf1-f196.google.com with SMTP id s5-v6so10011854pfj.7
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Oct 2018 12:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com>
 <1538387078-21892-3-git-send-email-yamada.masahiro@socionext.com>
 <CAKwvOd=R1FN_nmR4Wkpb=nTt+v2f2+uWOcQCFoB+B1hWzCXCXA@mail.gmail.com> <CAK7LNAT=2k=v6C9q4oGNWY3WjfswtD60NVEzgkF4ACkxNYjRug@mail.gmail.com>
In-Reply-To: <CAK7LNAT=2k=v6C9q4oGNWY3WjfswtD60NVEzgkF4ACkxNYjRug@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 1 Oct 2018 12:58:00 -0700
Message-ID: <CAKwvOdm9VA-MqM0M+m-y0On9jN3cfRZOHev_8PWc7TFTA9F3xg@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: add -Wno-unused-but-set-variable compiler
 flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Mon, Oct 1, 2018 at 12:02 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Nick,
>
> 2018=E5=B9=B410=E6=9C=882=E6=97=A5(=E7=81=AB) 2:18 Nick Desaulniers <ndes=
aulniers@google.com>:
> >
> > On Mon, Oct 1, 2018 at 2:45 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > We have raised the compiler requirement from time to time.
> > > With commit cafa0010cd51 ("Raise the minimum required gcc version
> > > to 4.6"), the minimum for GCC is 4.6 now.
> > >
> > > This flag was added by GCC 4.6, and it is recognized by Clang and
> > > ICC as well.
> >
> > This doesn't seem to be the case for Clang:
> > https://godbolt.org/z/qesF5o
> >
> > Nacked-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Hmm, I tested this patch with pre-built Clang 6.0.1 / 7.0.0
> downloaded from http://releases.llvm.org/download.html
>
> Was this option dropped by clang 8 ?

From the Godbolt link above, it seems all versions of Clang do not
recognize this flag.  It doesn't look like the kernel sets
-Wno-unknown-warning-option to prevent this warning.  Can you please
triple check that compiling with Clang and this patch causes no
warnings?  I suspect something might be amiss then if this patch
doesn't produce warnings with Clang, since on the smaller Godbolt
example it does.

>
>
> >
> > >
> > > Let's rip off the cc-disable-warning switch, and see if somebody
> > > complains about it.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > ---
> > >
> > >  Makefile | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 8a23fee..2627266 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -716,7 +716,7 @@ else
> > >
> > >  # These warnings generated too much noise in a regular build.
> > >  # Use make W=3D1 to enable them (see scripts/Makefile.extrawarn)
> > > -KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-but-set-variabl=
e)
> > > +KBUILD_CFLAGS +=3D -Wno-unused-but-set-variable
> > >  endif
> > >
> > >  KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-const-variable)
> > > --
> > > 2.7.4
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Best Regards
> Masahiro Yamada



--=20
Thanks,
~Nick Desaulniers
