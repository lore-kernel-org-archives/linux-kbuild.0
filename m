Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:54605 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfBGQlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Feb 2019 11:41:19 -0500
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: RFC: refactoring the deb build
Date: Thu,  7 Feb 2019 17:40:55 +0100
Message-Id: <1549557659-19137-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

Hello folks,


here are some patches for build process that allow building debian packages
right the usual canonical way (eg. via dpkg-buildpackage or dck-buildpackage),
instead 'manually' setting up the build environment and calling make.
So, from a debian native perspective, turning it from head onto feet ;-)

dpkg-buildpackage + friends expect the debian/rules file being present in
the unpacked source tree and driving the actual build (the 'deb-pkg' make
target does that quite the opposite way). Obviously, 'make deb-pkg' can't
be used directly, as it would destroy our debian/rules file ...

To archieve this, I've done several things:

* place .config file to the source tree (not in this patch queue)
* add some helper targets to the toplevel makefile, so we can just ask
  for certain things, eg. version, arch, etc, that we need later
* fix some missing dependencies in the generated debian/control file
* change scripts/package/mkdebian so that the name of the generated rules
  file name can be changed via environment
* a generic debian/rules file for driving the build

The last patch isn't really meant to be merged yet (need to change the
deb-pkg rule to not overwrite debian/rules anymore) - just including it
for illustration.

What do you think about this ?


--mtx
