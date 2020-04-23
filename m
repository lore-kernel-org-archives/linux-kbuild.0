Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp2.pobox.com ([64.147.108.71]:65029 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729405AbgDWQFU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 12:05:20 -0400
Date: Thu, 23 Apr 2020 12:05:17 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] kconfig: allow for conditional dependencies
In-Reply-To: <87imhqb3le.fsf@intel.com>
Message-ID: <nycvar.YSQ.7.76.2004231155060.2671@knanqh.ubzr>
References: <nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr> <87imhqb3le.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Saeed Mahameed <saeedm@mellanox.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

On Thu, 23 Apr 2020, Jani Nikula wrote:

> On Thu, 23 Apr 2020, Nicolas Pitre <nico@fluxnic.net> wrote:
> > This might appear to be a strange concept, but sometimes we want
> > a dependency to be conditionally applied. One such case is currently
> > expressed with:
> >
> >         depends on FOO || !FOO
> >
> > This pattern is strange enough to give one's pause. Given that it is
> > also frequent, let's make the intent more obvious with some syntaxic
> > sugar by effectively making dependencies optionally conditional.
> >
> > This also makes the kconfig language more uniform.
> 
> Thanks, I prefer this over all the previous proposals. Versatile yet
> self-explanatory.
> 
> > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> >
> > diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> > index d0111dd264..0f841e0037 100644
> > --- a/Documentation/kbuild/kconfig-language.rst
> > +++ b/Documentation/kbuild/kconfig-language.rst
> > @@ -114,7 +114,7 @@ applicable everywhere (see syntax).
> >    This is a shorthand notation for a type definition plus a value.
> >    Optionally dependencies for this default value can be added with "if".
> >  
> > -- dependencies: "depends on" <expr>
> > +- dependencies: "depends on" <expr> ["if" <expr>]
> >  
> >    This defines a dependency for this menu entry. If multiple
> >    dependencies are defined, they are connected with '&&'. Dependencies
> > @@ -130,6 +130,16 @@ applicable everywhere (see syntax).
> >  	bool "foo"
> >  	default y
> >  
> > +  The dependency definition itself may be conditional by appending "if"
> > +  followed by an expression. If such expression is false (n) then this
> > +  dependency is ignored. One possible use case is:
> > +
> > +    config FOO
> > +	tristate
> > +	depends on BAZ if BAZ != n
> 
> I presume this is the same as
> 
> 	depends on BAZ if BAZ
> 
> which makes me wonder if that should be the example. At least current
> usage for select is predominantly
> 
> 	select FOO if BAR
> 
> without "!= n".

Yes, it is the same thing. I prefer making the documentation a little 
more explicit than necessary so the explanation is really obvious.


Nicolas
