Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:48510 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdJBHVY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2017 03:21:24 -0400
Received: by mail-lf0-f43.google.com with SMTP id q132so4983464lfe.5
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Oct 2017 00:21:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASgbbG2XT-Vs5Sx242mJ1-vjA6dEe24dW1mD-hzh8JEbw@mail.gmail.com>
References: <1506159583-18894-1-git-send-email-riku.voipio@linaro.org> <CAK7LNASgbbG2XT-Vs5Sx242mJ1-vjA6dEe24dW1mD-hzh8JEbw@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Mon, 2 Oct 2017 10:21:21 +0300
Message-ID: <CAAqcGHmnKMZcHXt-Uf0ka5rZbELptiSGw8CZ9awmv+RW2E60AA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>

  On 29 September 2017 at 12:36, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Riku,
>
>
> 2017-09-23 18:39 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
>> Move debian/ directory generation out of builddeb to a new script,
>> mkdebian. The package build commands are kept in builddeb, which
>> is now and internal command called from debian/rules.
>>
>> With these changes in place, we can now use dpkg-buildpackage from
>> deb-pkg and bindeb-pkg removing need for handrolled source/changes
>> generation.
>>
>> This patch is based on the criticism of the current state of builddeb
>> discussed on:
>>
>> https://patchwork.kernel.org/patch/9656403/
>>
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>
>
> Sorry for delay.
>
> When I was testing this patch, I was hit by a problem
> when building the package with a parallel option.
>
> Did you see the problem as below?
>
>
> Please try this:
>
> make defconfig
> make -j8 bindeb-pkg

> This stalled on my build machine due to too many jobs.

I couldn't reproduce this. Which versions of dpkg and make do you have
? I'm using debian stable for testing now, but will try new
combinations.

> As far as I tested,
> the build command in debian/rules
> is invoked with -j without any argument.

>>  bindeb-pkg: FORCE
>> -       $(MAKE) KBUILD_SRC=
>> -       +$(call cmd,builddeb)
>> +       $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
>> +       dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) -b -nc -us -uc
>
>
>
> I think -us option is not necessary for bindeb-pkg.

Correct, dropping this.

>
>
>
>> -}
>> +# Set up variables in case we not called from kernel toplevel Makefile
>> +objtree="${objtree:-.}"
>> +srctree="${srctree:-.}"
>> +MAKE="${MAKE:-make}"
>> +OBJCOPY="${OBJCOPY:-objcopy}"
>> +KCONFIG_CONFIG="${KCONFIG_CONFIG:-.config}"
>
> Hmm, I do not like these.
> Now I understood your intention.
> I prefer "make intdeb-pkg" in v1.
> Sorry, my suggesting was misleading.

Ok, changing back. I'm still cleaning up the cmd_builddeb so we no
longer have recursive fakeroot-

>> +cat <<EOF > debian/rules
>> +#!/usr/bin/make -f
>> +
>> +ifneq (,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))
>> +    NUMJOBS = \$(patsubst parallel=%,%,\$(filter parallel=%,\$(DEB_BUILD_OPTIONS)))
>> +    MAKEFLAGS += -j\$(NUMJOBS)
>> +endif
>> +
>> +build:
>> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=
>
> The problem is here.
>
> If I invoked "make -j<N> bindeb-pkg",
> I see -j in MAKEFLAGS.   (<N> is missing)

I think MAKEFLAGS is special, it will always show -j without <N> when inspected.

> I am not sure if this is a bug of dpkg-buildpackage or not.

I think the we can live without the parallel= parsing. We'll support
two usecases:
1. make -jX bindeb-pkg
export the MAKEFLAGS down with + and tell dpkg-buildpackage to do
nothing with -j1
2. dpkg-buidpackage -jX
now dpkg-buildpackage will set the MAKEFLAGS and user will get parallel builds

This leaves two unsupported ways
3. Users who set DEB_BUILD_OPTIONS=parallel=X wont get parallel builds
4. The new "dpkg-buildpackage -J auto" will also get serial builds

Pre-refactoring, only case #1 worked, so I think this is acceptable.

https://manpages.debian.org/stretch/dpkg-dev/dpkg-buildpackage.1.en.html
