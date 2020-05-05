Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54216 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgEEIYl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 May 2020 04:24:41 -0400
MIME-Version: 1.0
References: <20200504020651.37031-1-masahiroy@kernel.org> <20200504020651.37031-2-masahiroy@kernel.org>
 <CAL_JsqLRUAEmh3kwEo+T-dMhXZTBH_kwbBwKzZyhJMR5P92pwA@mail.gmail.com> <CAK7LNASGKrovgqEzSgqZRU0kAsh7rhZ78fZ21VrdKvmP2XH0JQ@mail.gmail.com>
In-Reply-To: <CAK7LNASGKrovgqEzSgqZRU0kAsh7rhZ78fZ21VrdKvmP2XH0JQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 5 May 2020 17:23:36 +0900
Message-ID: <CAK7LNATXCKYfogvYxpaKW+CE0KwMeNjHfLpSemFAHdBzG0yGDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts/dtc: compile separate dtc-yaml
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWFyZWsgQmVo77+977+9w6Ju?= <marek.behun@nic.cz>, Frank Rowand <frowand.list@gmail.com>, Michal Marek <michal.lkml@markovi.net>

On Tue, May 5, 2020 at 12:04 PM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> On Tue, May 5, 2020 at 4:15 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Sun, May 3, 2020 at 9:07 PM Masahiro Yamada <masahiroy@kernel.org> w=
rote:
> > >
> > > Marek Beh=C3=BAn reported a case where pkg-config fails to detect the
> > > libyaml-dev package, which is presumably a bug of the distro.
> > >
> > > Irrespective of that, I am not a big fan of pkg-config in the Makefil=
e
> > > parse stage. The cost of pkg-config is quite small, but it is evaluat=
ed
> > > everytime we run make, even when we do 'make mrproper'. This commit
> > > changes the Makefile to not rely on pkg-config at all.
> >
> > I don't really love the solution here... I'm inclined to just make
> > libyaml always required. Anyone building dtbs should care about
> > validating them. However, there's some dts files sprinkled in the tree
> > such as DT unittests and I don't want to break allmodconfig for CI,
> > 0-day, etc. Though eventually we may have to.
> >
> > > The normal build should not require libyaml-dev while we need to comp=
ile
> > > dtc with libyaml for the schema check.
> > >
> > > Build two dtc variants:
> > >
> > >   scripts/dtc/dtc      for *.dts -> *.dtb
> > >   scripts/dtc/dtc-yaml for *.dts -> *.dt.yaml
> >
> > My longer term plan is to integrate the schema checks into dtc. This
> > would be some sort of plugin to dtc found or specified at run-time. It
> > would eliminate the need for 2 passes of dtc and the 2nd case will go
> > away.
>
>
> OK.
>
>
>
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -246,6 +246,7 @@ quiet_cmd_gzip =3D GZIP    $@
> > >  # DTC
> > >  # ------------------------------------------------------------------=
---------
> > >  DTC ?=3D $(objtree)/scripts/dtc/dtc
> > > +DTC_YAML ?=3D $(objtree)/scripts/dtc/dtc-yaml
> >
> > Can we make 'DTC' override both and keep this an internal detail.
> >
>
> No. For parallel building *.dtb and *.dt.yaml,
> they must be separate instances.
>
>
> > > +HOSTLDLIBS_dtc-yaml :=3D -lyaml
> >
> > Does this work for yocto? As we had this before commit 067c650c456e.
> > Not clear if this changed for any reason or just 'let's use pkg-config
> > everywhere'.
> >
> > Or is there another way to fix yocto issue and we can just check the
> > header exists. I assume yocto needs some prefix in front of
> > '/usr/include/yaml.h'?
> >
>
> My bad - I missed 067c650c456e
>
> We need pkg-config to deal with yocto.
>
>
> Sorry, I take back this series.


On my second thought, we can search libyaml
in non-standard path without pkg-config.


Kbuild provides a way to specify additional flags
for building host tools.

make  HOSTCFLAGS=3D<install-dir-in-yocto>/include
      HOSTLDFLAGS=3D<install-dir-in-yocto>/lib




--=20
Best Regards
Masahiro Yamada
