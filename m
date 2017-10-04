Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43879 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751925AbdJDJN3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 05:13:29 -0400
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com [209.85.216.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id v949DKFY024268
        for <linux-kbuild@vger.kernel.org>; Wed, 4 Oct 2017 18:13:21 +0900
Received: by mail-qt0-f170.google.com with SMTP id 34so762973qtb.13
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Oct 2017 02:13:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171002104339.4349-1-riku.voipio@linaro.org>
References: <20171002104339.4349-1-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 4 Oct 2017 18:12:39 +0900
Message-ID: <CAK7LNARNU0GYYOU3TkduhTsmgDV+=d84D7AqCcopBw+twyuP7g@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

Hi Riku,


2017-10-02 19:43 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Move debian/ directory generation out of builddeb to a new script,
> mkdebian. The package build commands are kept in builddeb, which
> is now an internal command called from debian/rules.
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
> ---
> changes since v2:
> - revert back to intdeb-pkg target
> - fix parellel builds from deb-pkg targets


No.  Not fixed.

I see the same problem for bindeb-pkg as in v2.




"make deb-pkg" gave me tons of warnings, then finally fails to build:


rm -rf debian/*tmp debian/files
mv debian/ debian.backup # debian/ might be cleaned away
make clean
mv debian.backup debian
 dpkg-source -i.git -b linux
dpkg-source: warning: no source format specified in
debian/source/format, see dpkg-source(1)
dpkg-source: info: using source format '1.0'
dpkg-source: warning: source directory 'linux' is not
<sourcepackage>-<upstreamversion> 'linux-4.13.0+-4.13.0+'
dpkg-source: warning: .orig directory name linux.orig is not
<package>-<upstreamversion> (wanted linux-4.13.0+-4.13.0+.orig)
dpkg-source: info: building linux-4.13.0+ using existing
linux-4.13.0+_4.13.0+.orig.tar.gz
dpkg-source: info: building linux-4.13.0+ in linux-4.13.0+_4.13.0+-7.diff.gz
dpkg-source: warning: ignoring deletion of file .scmversion, use
--include-removal to override
dpkg-source: warning: ignoring deletion of directory drivers/lguest
dpkg-source: warning: ignoring deletion of file
drivers/video/console/fbcon_rotate.h, use --include-removal to
override
dpkg-source: warning: ignoring deletion of file
drivers/video/console/fbcon.h, use --include-removal to override
dpkg-source: warning: ignoring deletion of file
drivers/video/console/fbcon_cw.c, use --include-removal to override
dpkg-source: warning: ignoring deletion of file
drivers/video/console/fbcon_rotate.c, use --include-removal to
override
dpkg-source: warning: ignoring deletion of file
drivers/video/console/fbcon.c, use --include-removal to override


  ...


dpkg-source: info: use the '3.0 (quilt)' format to have separate and
documented changes to upstream files, see dpkg-source(1)
dpkg-source: error: unrepresentable changes to source


Do you have a clue?



> +cat <<EOF > debian/rules
> +#!/usr/bin/make -f
> +
> +build:
> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=
> +
> +binary-arch:
> +       \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC= intdeb-pkg
> +
> +clean:
> +       rm -rf debian/*tmp debian/files
> +       mv debian/ debian.backup # debian/ might be cleaned away
> +       \$(MAKE) clean
> +       mv debian.backup debian


"mv debian debian.backup" is unnecessary, I think.


I think you saw

clean-dirs += $(objtree)/debian/

in scripts/package/Makefile.


Please notice this is cleaned-up by "make mrproper"
because Kbuild does not descend under scripts/ for "make clean".






-- 
Best Regards
Masahiro Yamada
