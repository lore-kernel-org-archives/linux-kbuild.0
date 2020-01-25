Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:38538 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgAYEG0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:06:26 -0500
MIME-Version: 1.0
References: <20200115162529.11089-1-masahiroy@kernel.org> <20200115162529.11089-4-masahiroy@kernel.org>
 <cea3ceee6be7c9554f139db6e96c99f2a5b93be2.camel@decadent.org.uk>
In-Reply-To: <cea3ceee6be7c9554f139db6e96c99f2a5b93be2.camel@decadent.org.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 25 Jan 2020 13:05:28 +0900
Message-ID: <CAK7LNATDRakOYQKLjCDkLz=SY3jPG8OSY5KZCvreKC+JfDW0yA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] builddeb: avoid invoking sub-shells where possible
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ben,

On Wed, Jan 22, 2020 at 4:21 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Thu, 2020-01-16 at 01:25 +0900, Masahiro Yamada wrote:
> > The commands surrounded by ( ... ) is run in a sub-shell, but you do
> > not have to spawn a sub-shell for every single line.
> >
> > Use just one ( ... ) for creating debian/hdrsrcfiles.
> >
> > For tar, use -C option instead.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >  - fix misconversion pointed out by Ben
> >
> >  scripts/package/builddeb | 39 ++++++++++++++++++++++++++-------------
> >  1 file changed, 26 insertions(+), 13 deletions(-)
> >
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index 9b92745bf13a..7d7e0abe62b6 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -165,21 +165,34 @@ EOF
> >  done
> >
> >  # Build kernel header package
> > -(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > debian/hdrsrcfiles
> > -(cd $srctree; find include scripts -type f -o -type l) >> debian/hdrsrcfiles
> > -(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> debian/hdrsrcfiles
> > -(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> debian/hdrsrcfiles
> > -if is_enabled CONFIG_STACK_VALIDATION; then
> > -     echo tools/objtool/objtool >> debian/hdrobjfiles
> > -fi
> > -find arch/$SRCARCH/include Module.symvers include scripts -type f >> debian/hdrobjfiles
> > -if is_enabled CONFIG_GCC_PLUGINS; then
> > -     find scripts/gcc-plugins -name \*.so >> debian/hdrobjfiles
> > -fi
> > +(
> > +     cd $srctree
> > +     find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
> > +     find include scripts -type f -o -type l
> > +     find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
> > +     find arch/$SRCARCH/include -type f
> [...]
>
> This last command is still wrong as I commented on v1.  I think it
> should be:
>
>         find $(find arch/$SRCARCH -name include -type d) -type f
>
> Ben.


Sorry, I missed your comment in v1.

I will keep the original code here.



-- 
Best Regards
Masahiro Yamada
