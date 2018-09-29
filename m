Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:43238 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbeI2XWH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Sep 2018 19:22:07 -0400
MIME-Version: 1.0
References: <1538117388-11945-1-git-send-email-yamada.masahiro@socionext.com> <CAK8P3a16pR5e1js7JiGreqHqxv5RNJZZY=JLFwLRE8i3nbg5hQ@mail.gmail.com>
In-Reply-To: <CAK8P3a16pR5e1js7JiGreqHqxv5RNJZZY=JLFwLRE8i3nbg5hQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Sep 2018 01:52:05 +0900
Message-ID: <CAK7LNAT+mYBfjtO+MrRhedLCqwPnTLrK6nKSpFd=TVrMnQxx9Q@mail.gmail.com>
Subject: Re: [PATCH] samples: run headers_install for host arch instead of
 target arch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, David Howells <dhowells@redhat.com>, Kees Cook <keescook@chromium.org>, Richard Weinberger <richard@nod.at>, Jeff Dike <jdike@addtoit.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andy Gross <andy.gross@linaro.org>, Alex Williamson <alex.williamson@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>

2018=E5=B9=B49=E6=9C=8829=E6=97=A5(=E5=9C=9F) 4:38 Arnd Bergmann <arnd@arnd=
b.de>:
>
> On Fri, Sep 28, 2018 at 8:51 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Some samples search headers in $(objtree)/usr/include, which is made
> > available by "make headers_install".  It is not kernel-space code but
> > host programs that need this header search path.
> >
> > Commit 3fca1700c4c3 ("kbuild: make samples really depend on
> > headers_install") is wrong because it installs headers of the target
> > architecture.  Besides, UML fails to build with CONFIG_SAMPLES=3Dy
> > because UML does not support headers_install.
> >
> > Invoke "make headers_install" for the _host_ architecture in the
> > prepare stage.  Introduce CONFIG_HOST_HEADERS_INSTALL so that this
> > happens only for samples that need it.
> >
> > I also removed 'Documentation/: headers_install', which I guess is
> > stale code.
> >
> > Fixes: 3fca1700c4c3 ("kbuild: make samples really depend on headers_ins=
tall")
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: David Howells <dhowells@redhat.com>
>
> I don't understand this one. Why would we want to build the samples for
> the host architecture rather than the target architecture?
>
> I would think that the bug is that we try to build them using
> HOSTCC, and they end up being unusable on the target as
> a consequence.


I just read Makefiles under samples/, and
all that require -I$(objtree)/usr/include
are listed in hostprogs-y,
so they are built for host architectures.

If this is different from our intent,
we need to fix this first.




--=20
Best Regards
Masahiro Yamada
