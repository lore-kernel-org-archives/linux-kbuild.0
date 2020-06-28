Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgF1Pvh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 11:51:37 -0400
Date: Sun, 28 Jun 2020 17:51:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] kconfig: qconf: make debug links work again
Message-ID: <20200628175133.6a82ca42@coco.lan>
In-Reply-To: <9ed32076053cd860900366dc9e12e5cb76d031b5.camel@redhat.com>
References: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
        <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com>
        <9ed32076053cd860900366dc9e12e5cb76d031b5.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Em Sun, 28 Jun 2020 17:48:08 +0300
Maxim Levitsky <mlevitsk@redhat.com> escreveu:

> On Sun, 2020-06-28 at 23:41 +0900, Masahiro Yamada wrote:
> > On Sun, Jun 28, 2020 at 9:21 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote: =20
> > > The Qt5 conversion broke support for debug info links.
> > >=20
> > > Restore the behaviour added by changeset
> > > ab45d190fd4a ("kconfig: create links in info window").
> > >=20
> > > Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =20
> >=20
> > I tested this patch, but this caused
> > segmentation fault.
> >=20
> >=20
> > I enabled 'Show Debug Info',
> > and then clicked
> > dep: <symbol name>.
> >=20
> > Then, xconfig crashed.
> >=20
> > (without this patch, it did not cause
> > segfault at least)
> >=20
> > Did you see this? =20
>=20
> Works for me - tested this again=20

It works for me too, but I'll double check. I don't actually like the
way it works, as it passes a pointer via the hyperlinks, instead of
some other type of reference, but this is the way the qt3 version
used to work.

I'll see if I can implement it on a different way, or at least add
some validation check.

Btw, what symbol did you click?

> (I have both patches applied on top on mainline master branch).
> Maybe you have Qt4?
>=20
> One thing that I forgot to report is that when clicking on the symbol,
> only config descripion updates and not config/menu windows.
> It might even be always like that, I don't remember, but it would be nice=
 if=20
> these were updated too.

=46rom what I saw this is the old behavior, at least as implemented on
changeset ab45d190fd4a ("kconfig: create links in info window").
See the implementation of ConfigInfoView::setSource() there.

I agree that it would be nice to change the other windows to reflect
it, but the goal of this patch is just to restore the old behavior.

A followup patch could be done later in order to improve it.

Regards,
Mauro
