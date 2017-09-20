Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41995 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751457AbdITJFl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 05:05:41 -0400
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com [209.85.161.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v8K95LVN001287
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Sep 2017 18:05:21 +0900
Received: by mail-yw0-f174.google.com with SMTP id w22so1431249ywa.13
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Sep 2017 02:05:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170816110855.6021-2-riku.voipio@linaro.org>
References: <20170816110855.6021-1-riku.voipio@linaro.org> <20170816110855.6021-2-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Sep 2017 18:04:40 +0900
Message-ID: <CAK7LNAQtAq3zhP0zY8pW=wdka23UKqJWyqPuXnk0m4LEfT6EKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>, Ben Hutchings <ben@decadent.org.uk>, Jim Davis <jim.epost@gmail.com>

Hi Riku,


2017-08-16 20:08 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Move debian/ directory generation out of builddeb to a new script,
> mkdebian. The package build commands are kept in builddeb, which
> is now and internal command called from debian/rules.
>
> With these changes in place, we can now use dpkg-buildpackage from
> deb-pkg and bindeb-pkg removing need for handrulled source/changes
> generation.
>
> This patch is based on the criticism of the current state of builddeb
> discussed on:
>
> https://patchwork.kernel.org/patch/9656403/
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>


Sorry for late reply, and thanks for working on this!

In my opinion, this seems the right direction.

A few comments below.

(Please note I am not a debian developer.
If I am suggesting wrong, please correct me.)


>  scripts/package/Makefile |  14 ++-
>  scripts/package/builddeb | 233 +----------------------------------------------
>  scripts/package/mkdebian | 209 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 221 insertions(+), 235 deletions(-)
>  create mode 100755 scripts/package/mkdebian
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 9867638896ad..176158c9b7da 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -92,12 +92,18 @@ quiet_cmd_builddeb = BUILDDEB
>  deb-pkg: FORCE
>         $(MAKE) clean
>         $(call cmd,src_tar,$(KDEB_SOURCENAME))
> -       $(MAKE) KBUILD_SRC=
> -       +$(call cmd,builddeb)
> +       $(call cmd,updateversion)
> +       mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$(KERNELRELEASE).orig.tar.gz
> +       $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> +       dpkg-buildpackage -r"fakeroot -u" -a$$(cat debian/arch) -i.git


This tries to sign the source package and .changes file by default.

Maybe, "-us -uc" options reasonable for easier use?




>  bindeb-pkg: FORCE
> -       $(MAKE) KBUILD_SRC=
> -       +$(call cmd,builddeb)
> +       $(call cmd,updateversion)
> +       $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> +       dpkg-buildpackage -r"fakeroot -u" -a$$(cat debian/arch) -b

IIUC, the whole of dpkg-buildpackage process is run under "fakeroot -u".
Correct?

It will internally invokes "make intdeb-pkg",
then $(call cmd,builddeb) calls "fakeroot -u" recursively,
this seems redundant to me.

Maybe,

     dpkg-buildpackage -r"$(KBUILD_PKG_ROOTCMD)" -a$$(cat debian/arch) -b

makes more sense?





> +
> +cat <<EOF > debian/rules
> +#!/usr/bin/make -f
> +
> +ifneq (,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))
> +    NUMJOBS = \$(patsubst parallel=%,%,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))
> +    MAKEFLAGS += -j\$(NUMJOBS)
> +endif
> +
> +build:
> +       \$(MAKE) ARCH=${ARCH}
> +
> +binary-arch:
> +       \$(MAKE) KDEB_VERSION=${version} ARCH=${ARCH} intdeb-pkg


Hmm, instead of recursive make,
is it possible to run scripts/package/debuild directly here?

> +
> +clean:
> +       rm -rf debian/*tmp debian/files
> +       mv debian/ debian.backup # debian/ might be cleaned away
> +       \$(MAKE) clean


The biggest change in the behavior is, "make bindeb-pkg" did not
previously "make clean",
but now does it.

If "make bindeb-pkg" is run in a row, all objects are cleaned every time.

Is it reasonable to skip "$(MAKE) clean" for bindeb-pkg?





-- 
Best Regards
Masahiro Yamada
