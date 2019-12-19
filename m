Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35503 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfLSISU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 03:18:20 -0500
Date: Thu, 19 Dec 2019 09:18:14 +0100
From: Johan Hovold <johan@kernel.org>
Subject: Re: kbuild obj-m directory descend (was: Re: [PATCH] serdev: fix
 builds with CONFIG_SERIAL_DEV_BUS=m)
Message-ID: <20191219081814.GP22665@localhost>
References: <201912181000.82Z7czbN%lkp@intel.com>
 <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
 <20191218172353.GO22665@localhost>
 <CAK7LNATztV-a3maL+vqQhbVsLBD_dsy+wbOZQ5ofQfbZQGGuLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATztV-a3maL+vqQhbVsLBD_dsy+wbOZQ5ofQfbZQGGuLA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Rob Herring <robh@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, kbuild test robot <lkp@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Dec 19, 2019 at 11:00:15AM +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Thu, Dec 19, 2019 at 2:23 AM Johan Hovold <johan@kernel.org> wrote:

> > The offending patch is broken since it effectively makes
> > CONFIG_SERIAL_DEV_BUS bool (built-in or disabled), but for some reason
> > those symbols do not end up in vmlinux (despite being compiled) when you
> > add a built-in object goal under a directory that was entered using
> > obj-m.
> >
> > That seems like a bug to me and contradicts the kbuild documentation
> > (3.6):
> >
> >         Example:
> >
> >         #fs/Makefile
> >         obj-$(CONFIG_EXT2_FS) += ext2/
> >
> >         If CONFIG_EXT2_FS is set to either ‘y’ (built-in) or ‘m’
> >         (modular) the corresponding obj- variable will be set, and
> >         kbuild will descend down in the ext2 directory. Kbuild only uses
> >         this information to decide that it needs to visit the directory,
> >         it is the Makefile in the subdirectory that specifies what is
> >         modular and what is built-in.
> >
> > I tried adding other targets to obj-y directly and they are also are not
> > included, seemingly since the directory was entered using obj-m.
> >
> > Masahiro or Michal, can you shed some light?

> I saw similar questions in ML in the past.
> Yes, this is how Kbuild works;
> Kbuild only links objects in Makefiles visited by obj-y.
> 
> If you use
>     obj-m += serdev/
> all objects in serdev/ are considered as modular.

Well, any objects in serdev/ specified in obj-y would currently be built
but never included in either built-in.a or any module.

> I think it is better to make the document
> clarify this.

Yeah, I don't have a use case for this, but the documentation would need
to be updated to not have more people look into this.

And at least this behaviour allowed us to catch this bug, but only
because we had dependent modules that failed to build. I see now that
you posted a patch adding a general warning about obj-y under obj-m last
fall, but that was apparently never merged.

But when was this behaviour changed? And was that done on purpose?

Johan
