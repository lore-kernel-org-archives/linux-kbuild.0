Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54297 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgD3RVG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 13:21:06 -0400
MIME-Version: 1.0
References: <20200430131715.32c1a1f6@coco.lan> <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
 <20200430184948.27191975@coco.lan>
In-Reply-To: <20200430184948.27191975@coco.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 May 2020 02:20:13 +0900
Message-ID: <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
Subject: Re: bug: Kbuild seems to require "make prepare-objtool" in order to
 use (some) new config vars
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>

On Fri, May 1, 2020 at 1:49 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Thu, 30 Apr 2020 22:51:48 +0900
> Masahiro Yamada <masahiroy@kernel.org> escreveu:
>
> > Hi Mauro,
> >
> >
> > On Thu, Apr 30, 2020 at 8:17 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > Not sure if this was already reported (or eventually fixed) upstream.
> > >
> > > While doing a Kconfig reorg on media, I noticed a few weird things,
> > > requiring me to call, on a few situations, "make modules_prepare"
> > > manually after some changes.
> > >
> > > I'm now working on a patchset to yet to be merged upstream aiming to
> > > resurrect a driver from staging. It is currently on this tree
> > > (with is based at the media development tree, on the top of 5.7-rc1):
> > >
> > >         https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Dato=
misp_v2
> > >
> > > There, I was able to identify a misbehavior that it is probably
> > > what forced me to need calling "make modules_prepare".
> > >
> > > The atomisp driver is on a very bad shape. Among its problems, it has=
 a
> > > set of header definitions that should be different for two different
> > > variants of the supported devices. In order to be able to compile for
> > > either one of the variants, I added a new config var:
> > > CONFIG_VIDEO_ATOMISP_ISP2401.
> > >
> > > The problem is that calling just
> > >
> > >         ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401
> > >
> > > or
> > >         ./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401
> >
> >
> > scripts/config does not take the dependency into consideration
> > at all.
> >
> > You need to enable/disable other options that it depends on.
>
> Yes, I know. on my tests, I did a "make allyesconfig" before
> the patch whose added this dependency. So, the only dependency
> left to be enabled or disabled was this one.
>
> The problem I'm pointing is not really do a select recursion
> (that would be a really cool feature, but I know it is not
> trivial), but, instead, that, despite the config var was
> there, when I tried to build it with:
>
>         make clean; make M=3Ddrivers/staging/media/atomisp
>
> It didn't do the right thing. Instead, it used ISP2401=3Dy
> on make clean and ISP2401=3Dn at the drivers build.
>
> So, in order to test if patches won't break building,
> depending on the value of this var, I'm currently doing:
>
>         cls;./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make prep=
are-objtool && make clean && make M=3Ddrivers/staging/media/atomisp && ./sc=
ripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make prepare-objtool && mak=
e clean && make M=3Ddrivers/staging/media/atomisp
>
> (note the alien "make prepare-objtool" in the middle)
>
>
> > ./scripts/config -e STAGING -e STAGING_MEDIA -e MEDIA_SUPPORT -e
> > MEDIA_CONTROLLER -e INTEL_ATOMISP -e VIDEOBUF_VMALLOC -e VIDEO_ATOMISP
> > -d MEDIA_SUPPORT_FILTER -e VIDEO_DEV -e VIDEO_V4L2 -e
> > VIDEO_ATOMISP_ISP2401
> >
> > allows me to enable VIDEO_ATOMISP_ISP2401.
> >
> >
> > It is painful to debug such complicated dependency graph, though.
>
> Yeah, dependencies at the media subsystem are usually quite complex.
>
> > >
> > > is not enough anymore for the build to actually use the new config va=
lue.
> > >
> > > It just keeps silently using the old config value.
> > >
> > > I double-checked it by adding this macro at the Makefile:
> > >
> > >         $(info ************ ISP2401: $(CONFIG_VIDEO_ATOMISP_ISP2401) =
************)
> > >
> > > The Makefile doesn't see the change, except if I explicitly call
> > > "make modules_prepare" or "make prepare-objtool".
> > >
> > > Even calling "make oldconfig" doesn't make it use the new CONFIG_*
> >
> >
> > I do not know.
> >
> > I cannot look into it without detailed steps to reproduce it.
>
> I'm applying the enclosed patch to this branch:
>
>         https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Datomisp=
_v2
>
> and running this:
>
>         $ make allyesconfig 2>/dev/null >/dev/null; echo "disable";./scri=
pts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make M=3Ddrivers/staging/medi=
a/atomisp && ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && echo "enab=
le" && make clean && make M=3Ddrivers/staging/media/atomisp
>         disable
>
>           WARNING: Symbol version dump ./Module.symvers
>                    is missing; modules will have no dependencies and modv=
ersions.
>
>         ************ ISP2401: y ************
>           AR      drivers/staging/media/atomisp/built-in.a
>         ************ ISP2401: y ************
>           MODPOST 0 modules
>         enable
>         ************ ISP2401:  ************
>
>           WARNING: Symbol version dump ./Module.symvers
>                    is missing; modules will have no dependencies and modv=
ersions.
>
>         ************ ISP2401: y ************
>           AR      drivers/staging/media/atomisp/built-in.a
>         ************ ISP2401: y ************
>           MODPOST 0 modules
>
> PS.: the same occurs if I use "make allmodconfig".



This is the expected behavior.

The problem is that you immediately compile the module after
you tweak the .config file.

Kbuild does not use the .config file directly.
Instead, it uses include/config/auto.conf.


The M=3D builds never touch the in-kernel build artifacts,
so it includes the stale include/config/auto.conf


After you change the .config, you must run 'make modules_prepare'
at least.

This is documented in 'make help'.


  modules_prepare - Set up for building external modules


--=20
Best Regards
Masahiro Yamada
