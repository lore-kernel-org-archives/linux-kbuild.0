Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59076 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750932AbdI2JhJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 05:37:09 -0400
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com [209.85.161.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id v8T9aqD5026477
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2017 18:36:53 +0900
Received: by mail-yw0-f181.google.com with SMTP id s62so471295ywg.0
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2017 02:36:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1506159583-18894-1-git-send-email-riku.voipio@linaro.org>
References: <1506159583-18894-1-git-send-email-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 29 Sep 2017 18:36:11 +0900
Message-ID: <CAK7LNASgbbG2XT-Vs5Sx242mJ1-vjA6dEe24dW1mD-hzh8JEbw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>

Hi Riku,


2017-09-23 18:39 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
> Move debian/ directory generation out of builddeb to a new script,
> mkdebian. The package build commands are kept in builddeb, which
> is now and internal command called from debian/rules.
>
> With these changes in place, we can now use dpkg-buildpackage from
> deb-pkg and bindeb-pkg removing need for handrolled source/changes
> generation.
>
> This patch is based on the criticism of the current state of builddeb
> discussed on:
>
> https://patchwork.kernel.org/patch/9656403/
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>


Sorry for delay.

When I was testing this patch, I was hit by a problem
when building the package with a parallel option.

Did you see the problem as below?


Please try this:

make defconfig
make -j8 bindeb-pkg

This stalled on my build machine due to too many jobs.



As far as I tested,
the build command in debian/rules
is invoked with -j without any argument.

"man make" says
If the  -j  option  is given without an argument, make will not limit
the number of jobs that can run simultaneously.





>
>  bindeb-pkg: FORCE
> -       $(MAKE) KBUILD_SRC=
> -       +$(call cmd,builddeb)
> +       $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> +       dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) -b -nc -us -uc



I think -us option is not necessary for bindeb-pkg.




> -}
> +# Set up variables in case we not called from kernel toplevel Makefile
> +objtree="${objtree:-.}"
> +srctree="${srctree:-.}"
> +MAKE="${MAKE:-make}"
> +OBJCOPY="${OBJCOPY:-objcopy}"
> +KCONFIG_CONFIG="${KCONFIG_CONFIG:-.config}"

Hmm, I do not like these.
Now I understood your intention.
I prefer "make intdeb-pkg" in v1.
Sorry, my suggesting was misleading.




> +cat <<EOF > debian/rules
> +#!/usr/bin/make -f
> +
> +ifneq (,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))
> +    NUMJOBS = \$(patsubst parallel=%,%,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))
> +    MAKEFLAGS += -j\$(NUMJOBS)
> +endif
> +
> +build:
> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=

The problem is here.

If I invoked "make -j<N> bindeb-pkg",
I see -j in MAKEFLAGS.   (<N> is missing)

I am not sure if this is a bug of dpkg-buildpackage or not.


I found a workaround for this.

In scripts/package/mkdebian:

NUMJOBS := \$(patsubst parallel=%,%,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))

build:
        \$(MAKE) \$(if \$(NUMJOBS),-j\$(NUMJOBS))
KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=



In scripts/package/Makefile:

bindeb-pkg: FORCE
      $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
      dpkg-buildpackage $(filter -j%,$(MAKEFLAGS)) \
      -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) -b -nc -us -uc


This worked for me.
If you have a better solution, please override it.






-- 
Best Regards
Masahiro Yamada
