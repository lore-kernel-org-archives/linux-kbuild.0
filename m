Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:27093 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbeK3VDZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Nov 2018 16:03:25 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id wAU9sUMB011900
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Nov 2018 18:54:31 +0900
Received: by mail-vs1-f44.google.com with SMTP id r14so2953849vsc.13
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Nov 2018 01:54:31 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUPaoEf0JzXJO6T5xBBrr8tcw2NmNXBk4=HD6WBbLtEdw@mail.gmail.com>
 <CA+icZUWrbTPk7ws+LBjzMSKsbfwbZODjCoBt7uQU0Z4ykzd6mw@mail.gmail.com>
 <CAK7LNAQ_8RYQaLbouR84=HH+xoxvVGX=gN5z-vQqu0=PCVzOuQ@mail.gmail.com>
 <CA+icZUXU8z_zke=3HCkceZo_becUL2Q=5j=QtAKkqYn8o-5-vw@mail.gmail.com> <5db14c4980ab9d8d23606b2a336a6b8dbbb255d0.camel@decadent.org.uk>
In-Reply-To: <5db14c4980ab9d8d23606b2a336a6b8dbbb255d0.camel@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 30 Nov 2018 18:53:54 +0900
Message-ID: <CAK7LNAQ7UtVBNqShtgmLJxNgkJc1wdzwCtWZz_LHe+iaZiWx+g@mail.gmail.com>
Subject: Re: builddeb: Missing arch/x86/kernel/macros.s when building modules
 with dkms
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: sedat.dilek@gmail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, Nov 25, 2018 at 2:51 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Sat, 2018-11-24 at 07:51 +0100, Sedat Dilek wrote:
> > On Sat, Nov 24, 2018 at 1:53 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> [...]
> > > Maybe like this?
> > >
> > >
> > > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > > index f43a274..4cf5a5c 100755
> > > --- a/scripts/package/builddeb
> > > +++ b/scripts/package/builddeb
> > > @@ -165,6 +165,9 @@ fi
> > >  if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
> > >         (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
> > > gcc-common.h) >> "$objtree/debian/hdrobjfiles"
> > >  fi
> > > +if [ -r arch/$SRCARCH/kernel/macros.s ]; then
> > > +       echo arch/$SRCARCH/kernel/macros.s >> "$objtree/debian/hdrobjfiles"
> > > +fi
> > >  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
> > >  mkdir -p "$destdir"
> > >  (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd
> > > $destdir; tar -xf -)
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
> >
> > Hi Masahiro Yamada,
> >
> > thanks, that fixes here the problem with building DKMS kernel modules:
> >
> > # find /usr/src/linux-headers-4.20.0-rc3-7-amd64-cbl -name macros.s
> > /usr/src/linux-headers-4.20.0-rc3-7-amd64-cbl/arch/x86/kernel/macros.
> >
> > I guess commit...
> >
> > 77b0bf55bc67 kbuild/Makefile: Prepare for using macros in inline
> > assembly code to work around asm() related GCC inlining bugs
> >
> > ...is the root cause (mention as a "Fixes:" tag in a future patch)?
> >
> > Not sure if the according script for building Linux RPM packages needs
> > the same fix, too.
> >
> > I can send a fix for the builddeb part or if you want to do it, it's OK for me.
> >
> > I highly appreciate to see a fix in Linux v4.20-rcN if possible.
>
> Perhaps it would make more sense to move this file under
> arch/x86/include/generated, so there's no need to add a special case to
> the packaging rules.


Yeah, moving the file under include/ would be nicer.

But, I am asking if they are fine with reverting the commits causing
the problems.
(https://lkml.org/lkml/2018/11/29/910)

Please give me time to decide what to do.


-- 
Best Regards
Masahiro Yamada
