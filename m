Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cmta20.telus.net ([209.171.16.93]:47307 "EHLO cmta20.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726432AbeH1KE3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Aug 2018 06:04:29 -0400
From: "Doug Smythies" <dsmythies@telus.net>
Subject: kernel version build number in .deb to low by 1. [REGRESSION][BISECTED]
Date: Mon, 27 Aug 2018 23:06:11 -0700
Message-ID: <002801d43e95$39e40100$adac0300$@net>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-ca
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Masahiro Yamada' <yamada.masahiro@socionext.com>, 'Riku Voipio' <riku.voipio@linaro.org>, linux-kbuild@vger.kernel.org
Cc: Doug Smythies <dsmythies@telus.net>

Hi,

For my kernel compiles the build number included in resulting .deb files is too low by 1.
Example:

$ uname -a
Linux s15 4.19.0-rc1-stock #488 SMP PREEMPT Mon Aug 27 12:09:05 PDT 2018 x86_64 x86_64 x86_64 GNU/Linux

Observe build number 488 (this is the correct build number, or so I think).

$ dpkg -l | grep 4.19.0-rc1
ii  linux-headers-4.19.0-rc1-stock 4.19.0-rc1-stock-487 amd64 Linux kernel headers for 4.19.0-rc1-stock on amd64
ii  linux-image-4.19.0-rc1-stock   4.19.0-rc1-stock-487 amd64 Linux kernel, version 4.19.0-rc1-stock

$ ls -l ../*4.19.0-rc1*
-rw-rw-r-- 1 doug doug     1907 Aug 27 12:18 ../linux-4.19.0-rc1-stock_4.19.0-rc1-stock-487_amd64.changes
-rw-r--r-- 1 doug doug 11484822 Aug 27 12:16 ../linux-headers-4.19.0-rc1-stock_4.19.0-rc1-stock-487_amd64.deb
-rw-r--r-- 1 doug doug 54224118 Aug 27 12:18 ../linux-image-4.19.0-rc1-stock_4.19.0-rc1-stock-487_amd64.deb
-rw-r--r-- 1 doug doug  1019908 Aug 27 12:16 ../linux-libc-dev_4.19.0-rc1-stock-487_amd64.deb

Observe build number 487.

I bisected the kernel, and the result was:

b41d920acff8305b8a25a183a8e4d41b8975097d is the first bad commit
commit b41d920acff8305b8a25a183a8e4d41b8975097d
Author: Riku Voipio <riku.voipio@linaro.org>
Date:   Thu Apr 5 14:22:29 2018 +0300

    kbuild: deb-pkg: split generating packaging and build

    Move debian/ directory generation out of builddeb to a new script,
    mkdebian. The package build commands are kept in builddeb, which
    is now an internal command called from debian/rules.

    With these changes in place, we can now use dpkg-buildpackage from
    deb-pkg and bindeb-pkg removing need for handrolled source/changes
    generation.

    This patch is based on the criticism of the current state of builddeb
    discussed on:

    https://patchwork.kernel.org/patch/9656403/

    Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
    Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I am not familiar with this stuff and was not able to figure out
a solution to propose a patch to correct it.

In case it is relevant, my compile command was:

time make -j9 olddefconfig bindeb-pkg LOCALVERSION=-stock

... Doug
