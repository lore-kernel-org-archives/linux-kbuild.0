Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39790 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730055AbgEFQoV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 12:44:21 -0400
MIME-Version: 1.0
References: <nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr>
 <87imhqb3le.fsf@intel.com> <nycvar.YSQ.7.76.2004231155060.2671@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.2004231155060.2671@knanqh.ubzr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 7 May 2020 01:43:08 +0900
Message-ID: <CAK7LNARpRMZb18FFnX1WPV4Xzh2B_n2E+KLf5QXqiqkZEKhTbQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: allow for conditional dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Saeed Mahameed <saeedm@mellanox.com>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Apr 24, 2020 at 1:05 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Thu, 23 Apr 2020, Jani Nikula wrote:
>
> > On Thu, 23 Apr 2020, Nicolas Pitre <nico@fluxnic.net> wrote:
> > > This might appear to be a strange concept, but sometimes we want
> > > a dependency to be conditionally applied. One such case is currently
> > > expressed with:
> > >
> > >         depends on FOO || !FOO
> > >
> > > This pattern is strange enough to give one's pause. Given that it is
> > > also frequent, let's make the intent more obvious with some syntaxic
> > > sugar by effectively making dependencies optionally conditional.
> > >
> > > This also makes the kconfig language more uniform.
> >
> > Thanks, I prefer this over all the previous proposals. Versatile yet
> > self-explanatory.
> >
> > > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> > >
> > > diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> > > index d0111dd264..0f841e0037 100644
> > > --- a/Documentation/kbuild/kconfig-language.rst
> > > +++ b/Documentation/kbuild/kconfig-language.rst
> > > @@ -114,7 +114,7 @@ applicable everywhere (see syntax).
> > >    This is a shorthand notation for a type definition plus a value.
> > >    Optionally dependencies for this default value can be added with "if".
> > >
> > > -- dependencies: "depends on" <expr>
> > > +- dependencies: "depends on" <expr> ["if" <expr>]
> > >
> > >    This defines a dependency for this menu entry. If multiple
> > >    dependencies are defined, they are connected with '&&'. Dependencies
> > > @@ -130,6 +130,16 @@ applicable everywhere (see syntax).
> > >     bool "foo"
> > >     default y
> > >
> > > +  The dependency definition itself may be conditional by appending "if"
> > > +  followed by an expression. If such expression is false (n) then this
> > > +  dependency is ignored. One possible use case is:
> > > +
> > > +    config FOO
> > > +   tristate
> > > +   depends on BAZ if BAZ != n
> >
> > I presume this is the same as
> >
> >       depends on BAZ if BAZ
> >
> > which makes me wonder if that should be the example. At least current
> > usage for select is predominantly
> >
> >       select FOO if BAR
> >
> > without "!= n".
>
> Yes, it is the same thing. I prefer making the documentation a little
> more explicit than necessary so the explanation is really obvious.


For the case of 'select',

  select FOO if BAR != n

is NOT equivalent to:

  select FOO if BAR



I do not think "if <expr>" in Kconfig
is so easy to understand.
I tend to hesitate to extend it.

Sometimes, it means "the property is visible if <expr> != n".
Sometimes, not.




For the case of 'depends on',
the 'depends on' is effective if <expr> != n
because Nicolas implemented it in this way.



We can do:

    depends on X || X = n

instead of:

    depends on X || !X

        or

    depends on X if X






I guess the source of the complaint is
!X is difficult to understand
when X is tristate.

But, is there any confusion in 'X = n' ?
I think not.

-- 
Best Regards
Masahiro Yamada
