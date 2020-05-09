Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:52554 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgEILJA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 May 2020 07:09:00 -0400
MIME-Version: 1.0
References: <20200503001141.9647-1-changbin.du@gmail.com> <CAK7LNATBt1NxRSWiv8Ab-pKBRemp43WUs96KWELTf+vFq_VPTA@mail.gmail.com>
 <20200507091807.0a789fbd@gandalf.local.home> <20200508140047.rln4iogroxw7esxa@mail.google.com>
In-Reply-To: <20200508140047.rln4iogroxw7esxa@mail.google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 9 May 2020 20:07:53 +0900
Message-ID: <CAK7LNARt3k47OSJYFTcc6z6MWb2oSLmQZwRwecsxu6j9r9dnVw@mail.gmail.com>
Subject: Re: [PATCH v4] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

On Fri, May 8, 2020 at 11:00 PM Changbin Du <changbin.du@gmail.com> wrote:
>
> On Thu, May 07, 2020 at 09:18:07AM -0400, Steven Rostedt wrote:
> > On Thu, 7 May 2020 12:19:57 +0900
> > Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > > On Sun, May 3, 2020 at 9:11 AM Changbin Du <changbin.du@gmail.com> wrote:
> > > >
> > > > Sometimes it is useful to preserve batches of configs when making
> > > > localmodconfig. For example, I usually don't want any usb and fs
> > > > modules to be disabled. Now we can do it by:
> > > >
> > > >  $ make LMC_KEEP="drivers/usb;fs" localmodconfig
> > > >
> > > > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > > >
> > > > ---
> > > > v4: fix typo.
> > > > v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> > > > v2: fix typo in documentation. (Randy Dunlap)
> > > > ---
> > >
> > >
> > > Personally, I do not mind the long LOCALMODCONFIG_PRESERVE,
> >
> > Perhasp we allow both? ;-)
> >
> > And just have one set to the other.
> >
> > > but this tends to be bike-sheding.
> > > I do not have a strong opinion.
> > >
> > >
> > > >  Documentation/admin-guide/README.rst |  8 +++++++-
> > > >  scripts/kconfig/Makefile             |  1 +
> > > >  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
> > > >  3 files changed, 31 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> > > > index cc6151fc0845..1371deab8bc7 100644
> > > > --- a/Documentation/admin-guide/README.rst
> > > > +++ b/Documentation/admin-guide/README.rst
> > > > @@ -209,10 +209,16 @@ Configuring the kernel
> > > >                             store the lsmod of that machine into a file
> > > >                             and pass it in as a LSMOD parameter.
> > > >
> > > > +                           Also, you can preserve modules in certain folders
> > > > +                           or kconfig files by specifying their paths in
> > > > +                           parameter LMC_KEEP.
> > > > +
> > > >                     target$ lsmod > /tmp/mylsmod
> > > >                     target$ scp /tmp/mylsmod host:/tmp
> > > >
> > > > -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> > > > +                   host$ make LSMOD=/tmp/mylsmod \
> > > > +                           LMC_KEEP="drivers/usb;drivers/gpu;fs" \
> > >
> > >
> > > This might be another bike-sheding item, but
> > > can you use a space for the delimiter?
> > >
> > >
> > > LMC_KEEP="drivers/usb drivers/gpu fs"
> > >
> > > If you pass multiple directories,
> > > you will need to surround them with double-quotes.
> >
> > I agree that spaces look better.
> >
> I am okay with space. But what about ":" which is used by shell PATH and many
> others?


I am not sure 'many others',
but you can pick what you like.





-- 
Best Regards
Masahiro Yamada
