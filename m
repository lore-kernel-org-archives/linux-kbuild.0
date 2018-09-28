Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:59305 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbeI1NSq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Sep 2018 09:18:46 -0400
MIME-Version: 1.0
References: <1537243113-1710-1-git-send-email-yamada.masahiro@socionext.com>
 <2024081.XhWFmWp6tJ@blindfold> <CAK7LNAQrOhJpkUf=zxvwcbf8oWTAhKiWxemweHz8QPT55H+R-g@mail.gmail.com>
In-Reply-To: <CAK7LNAQrOhJpkUf=zxvwcbf8oWTAhKiWxemweHz8QPT55H+R-g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 28 Sep 2018 15:55:35 +0900
Message-ID: <CAK7LNAQ87H72iMEyrTin=CPRWiyfuiU_sEpxmCT-qCovjREHtw@mail.gmail.com>
Subject: Re: [PATCH] samples: disable CONFIG_SAMPLES for UML
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org, David Howells <dhowells@redhat.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Alex Williamson <alex.williamson@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>

2018=E5=B9=B49=E6=9C=8819=E6=97=A5(=E6=B0=B4) 15:58 Masahiro Yamada <yamada=
.masahiro@socionext.com>:
>
> Hi.
>
> 2018-09-18 17:21 GMT+09:00 Richard Weinberger <richard@nod.at>:
> > Am Dienstag, 18. September 2018, 05:58:33 CEST schrieb Masahiro Yamada:
> >> Some samples require headers installation, so commit 3fca1700c4c3
> >> ("kbuild: make samples really depend on headers_install") added
> >> such dependency in the top Makefile.  However, UML fails to build
> >> with CONFIG_SAMPLES=3Dy because UML does not support headers_install.
> >>
> >> Fixes: 3fca1700c4c3 ("kbuild: make samples really depend on headers_in=
stall")
> >> Reported-by: Kees Cook <keescook@chromium.org>
> >> Cc: David Howells <dhowells@redhat.com>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> > Is there anything UML can do better?
> > Not sure whether an arch like is supposed to install headers at all,
> > I guess no. :)
>
> I just thought suppressing CONFIG_SAMPLES was a big hammer.
>
> We could install host-arch headers for UML if we like,
> but I am not sure whether is is sensible...
>
> Wait for comments in case somebody has a better solution.
>


I started to think this is a wrong hack.


I posted a different solution:
https://patchwork.kernel.org/patch/10619043/



--=20
Best Regards
Masahiro Yamada
