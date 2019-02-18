Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:44222 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728977AbfBRQBM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Feb 2019 11:01:12 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x1IG0jjv017838
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Feb 2019 01:00:46 +0900
Received: by mail-vs1-f42.google.com with SMTP id m20so9416048vsq.8
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Feb 2019 08:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20190102092304.27262-1-riku.voipio@linaro.org> <CAK7LNARFAth+L_b7i4aR4mPtVTSfDgq2zvvMJah4WR0s97Ny2A@mail.gmail.com>
In-Reply-To: <CAK7LNARFAth+L_b7i4aR4mPtVTSfDgq2zvvMJah4WR0s97Ny2A@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Feb 2019 01:00:08 +0900
Message-ID: <CAK7LNASOqwrJqHLDKwT4xRU6jrFchavvWFjxqcPd_ZSmiEtsQQ@mail.gmail.com>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, debian-kernel <debian-kernel@lists.debian.org>, Ben Hutchings <ben@decadent.org.uk>

Hi Riku,


On Thu, Jan 3, 2019 at 6:28 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Riku,
>
>
>
> On Wed, Jan 2, 2019 at 6:28 PM <riku.voipio@linaro.org> wrote:
> >
> > From: Riku Voipio <riku.voipio@linaro.org>
> >
> > bison/flex is now needed always for building for kconfig. Some build
> > dependencies depend on kernel configuration, enable them as needed:
> >
> > - libelf-dev when UNWINDER_ORC is set
> > - libssl-dev for SYSTEM_TRUSTED_KEYRING
> >
> > Since the libssl-dev is needed for extract_cert binary, denote with
> > :native to install the libssl-dev for the build machines architecture,
> > rather than for the architecture of the kernel being built.
> >
> > Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> > ---
> > v2: commit message updated
> > ---
>
>
> $ make defconfig && make bindeb-pkg
>
> worked for me, but
>
> $ make allnoconfig && make bindeb-pkg
>
> failed with
>
> dpkg-checkbuilddeps: error: Unmet build dependencies: flex
>
>
> I do not know why.



I looked into this build error.

This happens depending on 'debian/arch'.

My host machine is x86_64.


When I run "make defconfig; make bindeb-pkg",

$ cat debian/arch
amd64



When I run "make allnoconfig; make bindeb-pkg",

$ cat debian/arch
i386



$ head -n 6 debian/control
Source: linux-5.0.0-rc7+
Section: kernel
Priority: optional
Maintainer: Masahiro Yamada <yamada.masahiro@socionext.com>
Build-Depends: bc, kmod, cpio, bison, flex , ,
Homepage: http://www.kernel.org/

$ dpkg-buildpackage -r"fakeroot -u" -ai386 -b -nc
-ucdpkg-buildpackage: source package linux-5.0.0-rc7+
dpkg-buildpackage: source version 5.0.0-rc7+-1
dpkg-buildpackage: source distribution xenial
dpkg-buildpackage: source changed by Masahiro Yamada
<yamada.masahiro@socionext.com>
dpkg-architecture: warning: specified GNU system type i686-linux-gnu
does not match CC system type x86_64-linux-gnu, try setting a correct
CC environment variable
dpkg-buildpackage: host architecture i386
 dpkg-source --before-build linux
dpkg-checkbuilddeps: error: Unmet build dependencies: flex
dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
dpkg-buildpackage: warning: (Use -d flag to override.)


After I applied the following patch,
I was able to build "make allnoconfig; make bindeb-pkg".



diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 453fece..6793642 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -72,11 +72,11 @@ deb-pkg: FORCE
        $(call cmd,src_tar,$(KDEB_SOURCENAME))
        origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
                mv $(KDEB_SOURCENAME).tar.gz
../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
-       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat
debian/arch) -i.git -us -uc
+       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) --target-arch
$$(cat debian/arch) -i.git -us -uc

 bindeb-pkg: FORCE
        $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
-       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat
debian/arch) -b -nc -uc
+       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) --target-arch
$$(cat debian/arch) -b -nc -uc

 intdeb-pkg: FORCE
        +$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb





--
Best Regards
Masahiro Yamada
