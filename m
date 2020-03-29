Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:28448 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgC2LEp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 07:04:45 -0400
MIME-Version: 1.0
References: <20200325031433.28223-1-masahiroy@kernel.org> <202003251905.6D43E64@keescook>
In-Reply-To: <202003251905.6D43E64@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 29 Mar 2020 20:03:39 +0900
Message-ID: <CAK7LNATWkXiWtR+=eWxqxewsJjy_nvSmcByCR-ZehO95yN-c+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: remove unused variable in qconf.cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Mar 26, 2020 at 11:06 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Mar 25, 2020 at 12:14:31PM +0900, Masahiro Yamada wrote:
> > If this file were compiled with -Wall, the following warning would be
> > reported:
> >
> > scripts/kconfig/qconf.cc:312:6: warning: unused variable =E2=80=98i=E2=
=80=99 [-Wunused-variable]
> >   int i;
> >       ^
> >
> > The commit prepares to turn on -Wall for C++ host programs.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>

Applied to linux-kbuild.



> -Kees
>
> > ---
> >
> >  scripts/kconfig/qconf.cc | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > index 82773cc35d35..50a5245d87bb 100644
> > --- a/scripts/kconfig/qconf.cc
> > +++ b/scripts/kconfig/qconf.cc
> > @@ -309,8 +309,6 @@ ConfigList::ConfigList(ConfigView* p, const char *n=
ame)
> >         showName(false), showRange(false), showData(false), mode(single=
Mode), optMode(normalOpt),
> >         rootEntry(0), headerPopup(0)
> >  {
> > -     int i;
> > -
> >       setObjectName(name);
> >       setSortingEnabled(false);
> >       setRootIsDecorated(true);
> > --
> > 2.17.1
> >
>
> --
> Kees Cook



--=20
Best Regards
Masahiro Yamada
