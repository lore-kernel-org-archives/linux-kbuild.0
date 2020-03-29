Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44360 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgC2Na6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 09:30:58 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02TDUcuc019732
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 22:30:38 +0900
Received: by mail-ua1-f44.google.com with SMTP id v24so5307926uak.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 06:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <1966103.4dT7el1ifK@apollon> <158496310058.14061.15052560096291438066.reportbug@debian>
 <CAK7LNAQcMM_H41zXA++FOF=LJT+YKNfmwHMYqdF3r1uQT307Hw@mail.gmail.com> <2516578.0xqDLvIEN0@apollon>
In-Reply-To: <2516578.0xqDLvIEN0@apollon>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 29 Mar 2020 22:30:01 +0900
Message-ID: <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
Subject: Re: Bug#954778: Patch: Suppress irrelevant warning when generating a
 debian package
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Reinhard Karcher <reinhard.karcher@gmx.net>, 954778@bugs.debian.org
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, Mar 29, 2020 at 9:57 PM Reinhard Karcher
<reinhard.karcher@gmx.net> wrote:
>
> Am Sonntag, 29. M=C3=A4rz 2020, 14:01 schrieb Masahiro Yamada:
> >
> > > By making a contribution to this project, I certify that:
> > > The contribution was created in whole or in part by me and I have the
> > > right to submit it under the open source license indicated in the fil=
e.
> >
> > Please drop this.
> >
> > Signed-off-by implies this.
> > No need to explain this in an individual patch.
>
> Droped in attached new version.
>
> > > +if [ -n "$BUILD_DEBUG" ] ; then
> >
> > This file does not define BUILD_DEBUG.
> > So, this conditional is always false, isn't it?
> >
> > It should be:
> >
> > if is_enabled CONFIG_DEBUG_INFO; then
> >
>
> The definition of BUILD_DEBUG is copied from builddeb too.
> See attached patch.


No.

I want you to directly use

if is_enabled CONFIG_DEBUG_INFO; then
...
fi





I guess builddeb used BUILD_DEBUG
to avoid running grep twice.

It does not apply to mkdebian.



--=20
Best Regards
Masahiro Yamada
