Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18802 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgCFRb1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 12:31:27 -0500
MIME-Version: 1.0
References: <20200302062340.21453-1-masahiroy@kernel.org> <nycvar.YSQ.7.76.2003021024370.1559@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2003021024370.1559@knanqh.ubzr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Mar 2020 02:30:28 +0900
Message-ID: <CAK7LNAQVsOoNgSCUj1EwHgPKrGrwWduzrtQbrtOWa=2EA+hTfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: allow symbols implied by y to become m
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

Hi Nicolas,

On Tue, Mar 3, 2020 at 12:31 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Mon, 2 Mar 2020, Masahiro Yamada wrote:
>
> > The 'imply' keyword restricts a symbol to y or n, excluding m
> > when it is implied by y. This is the original behavior since
> > commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword").
> >
> > However, the author of the 'imply' keyword, Nicolas Pitre, stated
> > that the 'imply' keyword should not impose any restrictions. [1]
> >
> > I agree, and want to get rid of this tricky behavior.
> >
> > [1]: https://lkml.org/lkml/2020/2/19/714
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Acked-by: Nicolas Pitre <nico@fluxnic.net>
>
> In addition to the IS_REACHABLE() note, it might be a good idea to
> suggest adding an "imply" reference to the dependency if the feature
> provided by BAZ is highli desirable, e.g.:
>
> config FOO
>         tristate
>         imply BAR
>         imply BAZ
>


OK, this info is more relevant to the 2nd patch.

I folded this following to 2/2.

diff --git a/Documentation/kbuild/kconfig-language.rst
b/Documentation/kbuild/kconfig-language.rst
index 68719e78ff85..a1601ec3317b 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -194,6 +194,14 @@ applicable everywhere (see syntax).
                ...
        }

+  Note: If the feature provided by BAZ is highly desirable for FOO,
+  FOO should imply not only BAZ, but also its dependency BAR::
+
+    config FOO
+       tristate "foo"
+       imply BAR
+       imply BAZ
+
 - limiting menu display: "visible if" <expr>

   This attribute is only applicable to menu blocks, if the condition is




Both applied.



> > ---
> >
> >  Documentation/kbuild/kconfig-language.rst | 12 +++++++++++-
> >  scripts/kconfig/symbol.c                  |  5 +----
> >  2 files changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> > index d0111dd26410..d4d988aea679 100644
> > --- a/Documentation/kbuild/kconfig-language.rst
> > +++ b/Documentation/kbuild/kconfig-language.rst
> > @@ -173,7 +173,7 @@ applicable everywhere (see syntax).
> >       ===             ===             =============   ==============
> >       n               y               n               N/m/y
> >       m               y               m               M/y/n
> > -     y               y               y               Y/n
> > +     y               y               y               Y/m/n
> >       y               n               *               N
> >       ===             ===             =============   ==============
> >
> > @@ -181,6 +181,16 @@ applicable everywhere (see syntax).
> >    ability to hook into a secondary subsystem while allowing the user to
> >    configure that subsystem out without also having to unset these drivers.
> >
> > +  Note: If the combination of FOO=y and BAR=m causes a link error,
> > +  you can guard the function call with IS_REACHABLE()::
> > +
> > +     foo_init()
> > +     {
> > +             if (IS_REACHABLE(CONFIG_BAZ))
> > +                     baz_register(&foo);
> > +             ...
> > +     }
> > +
> >  - limiting menu display: "visible if" <expr>
> >
> >    This attribute is only applicable to menu blocks, if the condition is
> > diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> > index 8d38b700b314..b101ef3c377a 100644
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -401,8 +401,7 @@ void sym_calc_value(struct symbol *sym)
> >                               sym_warn_unmet_dep(sym);
> >                       newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
> >               }
> > -             if (newval.tri == mod &&
> > -                 (sym_get_type(sym) == S_BOOLEAN || sym->implied.tri == yes))
> > +             if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
> >                       newval.tri = yes;
> >               break;
> >       case S_STRING:
> > @@ -484,8 +483,6 @@ bool sym_tristate_within_range(struct symbol *sym, tristate val)
> >               return false;
> >       if (sym->visible <= sym->rev_dep.tri)
> >               return false;
> > -     if (sym->implied.tri == yes && val == mod)
> > -             return false;
> >       if (sym_is_choice_value(sym) && sym->visible == yes)
> >               return val == yes;
> >       return val >= sym->rev_dep.tri && val <= sym->visible;
> > --
> > 2.17.1
> >
> >



-- 
Best Regards
Masahiro Yamada
