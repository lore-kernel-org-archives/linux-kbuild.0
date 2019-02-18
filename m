Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:53815 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391060AbfBRRGT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Feb 2019 12:06:19 -0500
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x1IH6ECn022397
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Feb 2019 02:06:15 +0900
Received: by mail-ua1-f49.google.com with SMTP id s15so6028107uap.6
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Feb 2019 09:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20190102092304.27262-1-riku.voipio@linaro.org>
 <CAK7LNARFAth+L_b7i4aR4mPtVTSfDgq2zvvMJah4WR0s97Ny2A@mail.gmail.com> <CAK7LNASOqwrJqHLDKwT4xRU6jrFchavvWFjxqcPd_ZSmiEtsQQ@mail.gmail.com>
In-Reply-To: <CAK7LNASOqwrJqHLDKwT4xRU6jrFchavvWFjxqcPd_ZSmiEtsQQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Feb 2019 02:05:38 +0900
Message-ID: <CAK7LNASiyMiCB2Ko0_aWOhB_3t6FEVhQ1xpnn-NQ=yV0X11SMg@mail.gmail.com>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, debian-kernel <debian-kernel@lists.debian.org>, Ben Hutchings <ben@decadent.org.uk>

On Tue, Feb 19, 2019 at 1:00 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Riku,
>
>
> On Thu, Jan 3, 2019 at 6:28 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Hi Riku,
> >
> >
> >
> > On Wed, Jan 2, 2019 at 6:28 PM <riku.voipio@linaro.org> wrote:
> > >
> > > From: Riku Voipio <riku.voipio@linaro.org>
> > >
> > > bison/flex is now needed always for building for kconfig. Some build
> > > dependencies depend on kernel configuration, enable them as needed:
> > >
> > > - libelf-dev when UNWINDER_ORC is set
> > > - libssl-dev for SYSTEM_TRUSTED_KEYRING
> > >
> > > Since the libssl-dev is needed for extract_cert binary, denote with
> > > :native to install the libssl-dev for the build machines architecture,
> > > rather than for the architecture of the kernel being built.
> > >
> > > Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> > > ---
> > > v2: commit message updated
> > > ---
> >
> >
> > $ make defconfig && make bindeb-pkg
> >
> > worked for me, but
> >
> > $ make allnoconfig && make bindeb-pkg
> >
> > failed with
> >
> > dpkg-checkbuilddeps: error: Unmet build dependencies: flex
> >
> >
> > I do not know why.
>
>
>
> I looked into this build error.
>
> This happens depending on 'debian/arch'.
>
> My host machine is x86_64.
>
>
> When I run "make defconfig; make bindeb-pkg",
>
> $ cat debian/arch
> amd64
>
>
>
> When I run "make allnoconfig; make bindeb-pkg",
>
> $ cat debian/arch
> i386
>
>
>
> $ head -n 6 debian/control
> Source: linux-5.0.0-rc7+
> Section: kernel
> Priority: optional
> Maintainer: Masahiro Yamada <yamada.masahiro@socionext.com>
> Build-Depends: bc, kmod, cpio, bison, flex , ,
> Homepage: http://www.kernel.org/
>
> $ dpkg-buildpackage -r"fakeroot -u" -ai386 -b -nc
> -ucdpkg-buildpackage: source package linux-5.0.0-rc7+
> dpkg-buildpackage: source version 5.0.0-rc7+-1
> dpkg-buildpackage: source distribution xenial
> dpkg-buildpackage: source changed by Masahiro Yamada
> <yamada.masahiro@socionext.com>
> dpkg-architecture: warning: specified GNU system type i686-linux-gnu
> does not match CC system type x86_64-linux-gnu, try setting a correct
> CC environment variable
> dpkg-buildpackage: host architecture i386
>  dpkg-source --before-build linux
> dpkg-checkbuilddeps: error: Unmet build dependencies: flex
> dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
> dpkg-buildpackage: warning: (Use -d flag to override.)
>
>
> After I applied the following patch,
> I was able to build "make allnoconfig; make bindeb-pkg".
>
>
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 453fece..6793642 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -72,11 +72,11 @@ deb-pkg: FORCE
>         $(call cmd,src_tar,$(KDEB_SOURCENAME))
>         origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
>                 mv $(KDEB_SOURCENAME).tar.gz
> ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> -       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat
> debian/arch) -i.git -us -uc
> +       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) --target-arch
> $$(cat debian/arch) -i.git -us -uc
>
>  bindeb-pkg: FORCE
>         $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> -       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat
> debian/arch) -b -nc -uc
> +       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) --target-arch
> $$(cat debian/arch) -b -nc -uc
>
>  intdeb-pkg: FORCE
>         +$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb


This is not the right answer.


"make allnoconfig; make bindeb-pkg"
failed on Ubuntu 16.04, but succeeded on Ubuntu 18.04

I am puzzled...



foo@4066694d5e03:/ref/linux$ git log --oneline -1
bd8f27f deb-pkg: generate correct build dependencies
foo@4066694d5e03:/ref/linux$ make bindeb-pkg
/bin/bash ./scripts/package/mkdebian
Using default distribution of 'unstable' in the changelog
Install lsb-release or set $KDEB_CHANGELOG_DIST explicitly
dpkg-buildpackage -r"fakeroot -u" -a$(cat debian/arch) -b -nc -uc
dpkg-buildpackage: source package linux-5.0.0-rc7+
dpkg-buildpackage: source version 5.0.0-rc7+-1
dpkg-buildpackage: source distribution unstable
dpkg-buildpackage: source changed by foo <foo@4066694d5e03>
dpkg-architecture: warning: specified GNU system type i686-linux-gnu
does not match CC system type x86_64-linux-gnu, try setting a correct
CC environment variable
dpkg-buildpackage: host architecture i386
 dpkg-source --before-build linux
dpkg-checkbuilddeps: error: Unmet build dependencies: flex
dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
dpkg-buildpackage: warning: (Use -d flag to override.)
scripts/package/Makefile:78: recipe for target 'bindeb-pkg' failed
make[1]: *** [bindeb-pkg] Error 3
Makefile:1390: recipe for target 'bindeb-pkg' failed
make: *** [bindeb-pkg] Error 2


The docker file I used is below.

If I change "FROM ubuntu:16.04" to "FROM ubuntu:18.04",
it goes well.




------------------->8------------------
FROM ubuntu:16.04

# user name
ARG USER=foo

# packages to install
ARG PKGS=" \
bc \
bison \
build-essential \
flex \
git \
strace \
sudo \
cpio \
kmod \
"

RUN \
apt-get update && \
DEBCONF_NOWARNINGS=yes apt-get install -y apt-utils && \
apt-get install -y ${PKGS} && \
useradd -m ${USER} && \
echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER}
WORKDIR /home/${USER}
---------------------->8--------------------------





-- 
Best Regards
Masahiro Yamada
