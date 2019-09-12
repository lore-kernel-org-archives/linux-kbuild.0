Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38867 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727576AbfILBst (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 21:48:49 -0400
MIME-Version: 1.0
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
 <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
 <21a058586badfd42df46d94d539aae08658cde5b.camel@decadent.org.uk> <0c7c99639df61572aeb37c461df4cca101f78d3a.camel@decadent.org.uk>
In-Reply-To: <0c7c99639df61572aeb37c461df4cca101f78d3a.camel@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Sep 2019 10:47:56 +0900
Message-ID: <CAK7LNAQsmWGKF+gogON0pZHYAsUFH17sV+CkDv0DuoervwuJzg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible builds
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, ab@php.net

On Wed, Sep 11, 2019 at 10:15 PM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Wed, 2019-09-11 at 14:04 +0100, Ben Hutchings wrote:
> > On Wed, 2019-09-11 at 21:17 +0900, Masahiro Yamada wrote:
> > > Hi Ben,
> > >
> > >
> > > Thanks for this.
> > > Please let me add some comments.
> > >
> > >
> > > On Wed, Sep 11, 2019 at 8:54 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> > [...]
> > > > +Absolute filenames
> > > > +------------------
> > > > +
> > > > +When the kernel is built out-of-tree, debug information may include
> > > > +absolute filenames for the source files.  The ``__FILE__`` macro may
> > > > +also expand to an absolute filename.  This must be overridden by
> > > > +including `prefix-map options`_ in the `KCFLAGS`_ variable.
> > >
> > > Do you mean -fmacro-prefix-map ?
> >
> > No, I mean -ffile-prefix-map or the older -fdebug-prefix-map.
> >
> > > If so, it is already taken care of by the top Makefile.
> > > If you use GCC 8 or newer, it is automatically added to
> > > KBUILD_CFLAGS.
> >
> > Ah, that's helpful.  So, I suppose I should just mention
> > -fdebug-prefix-map here and warn that __FILE__ will still be a proble
> > if using older compiler versions.
>
> My revised text for this section is:
>
> ---
> When the kernel is built out-of-tree, debug information may include
> absolute filenames for the source files.  This must be overridden by
> including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
>
> Depending on the compiler used, the ``__FILE__`` macro may also expand
> to an absolute filename in an out-of-tree build.  Kbuild automatically
> uses the ``-fmacro-prefix-map`` option to prevent this, if it is
> supported.
>
> The Reproducible Builds web site has more information about these
> `prefix-map options`_.
> ---
>
> Does that look OK to you?


Both hunks sound good.

Thanks.






> > > > +Generated files in source packages
> > > > +----------------------------------
> > > > +
> > > > +The build processes for some programs under the ``tools/``
> > > > +subdirectory do not completely support out-of-tree builds.  This may
> > > > +cause source packages built using e.g. ``make rpm-pkg`` to include
> > > > +generated files and so be unreproducible.  It may be necessary to
> > > > +clean the source tree completely (``make mrproper`` or
> > > > +``git clean -d -f -x``) before building a source package.
> > >
> > > Currently, the source package building does not support
> > > out-of-tree build anyway.
> >
> > Yes, I realise that.
> >
> > > 'make O=foo rpm-pkg' fails with an error message.
> > >
> > > Building in a pristine source will solve the issue.
> > [...]
> >
> > The issue I'm thinking about is that an out-of-tree build, prior to the
> > package build, *should* leave the source pristine and sometimes does
> > not.
> >
> > For Debian's official kernel packages, we build a binary package of the
> > upstream source, and at some times this has unexpectedly included some
> > generated files.  I believe a similar issue would affect the upstream
> > package scripts.
>
> My revised text for this section is:
>
> ---
> The build processes for some programs under the ``tools/``
> subdirectory do not completely support out-of-tree builds.  This may
> cause a later source package build using e.g. ``make rpm-pkg`` to
> include generated files.  You should ensure the source tree is
> pristine by running ``make mrproper`` or ``git clean -d -f -x`` before
> building a source package.
> ---
>
> Ben.
>
> --
> Ben Hutchings
> The obvious mathematical breakthrough [to break modern encryption]
> would be development of an easy way to factor large prime numbers.
>                                                            - Bill Gates
>
>


-- 
Best Regards
Masahiro Yamada
