Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33510 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935296AbeFMMT7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 08:19:59 -0400
Received: by mail-oi0-f46.google.com with SMTP id c6-v6so2105832oiy.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jun 2018 05:19:59 -0700 (PDT)
MIME-Version: 1.0
From: Mathieu Malaterre <malat@debian.org>
Date: Wed, 13 Jun 2018 14:19:44 +0200
Message-ID: <CA+7wUszK=FNu6_duoaQfs4z+r7j+W64njXr1C0=tXM6K2Hux6w@mail.gmail.com>
Subject: Syncing .version and VERSION
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Hi there,

I am getting confused in between the version used for the debian
package vs the VERSION value used in the kernel. Would it be possible
to sync them ?

Steps:

$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
$ make O=ps3 ARCH=powerpc ps3_defconfig
$ echo 12345 > ps3/.version
$ make -j8 O=ps3 ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- V=1
bindeb-pkg | grep 1234
dpkg-buildpackage: info: source version 4.17.0-11730-gf5b7769eb040-12345
++ expr 012345 + 1
+ VERSION=12346
+ echo 12346
dpkg-deb: building package 'linux-headers-4.17.0-11730-gf5b7769eb040'
in '../linux-headers-4.17.0-11730-gf5b7769eb040_4.17.0-11730-gf5b7769eb040-12345_powerpc.deb'.
dpkg-deb: building package 'linux-libc-dev' in
'../linux-libc-dev_4.17.0-11730-gf5b7769eb040-12345_powerpc.deb'.
dpkg-deb: building package 'linux-image-4.17.0-11730-gf5b7769eb040' in
'../linux-image-4.17.0-11730-gf5b7769eb040_4.17.0-11730-gf5b7769eb040-12345_powerpc.deb'.
dpkg-deb: building package
'linux-image-4.17.0-11730-gf5b7769eb040-dbg' in
'../linux-image-4.17.0-11730-gf5b7769eb040-dbg_4.17.0-11730-gf5b7769eb040-12345_powerpc.deb'.
 dpkg-genchanges --build=binary
>../linux-4.17.0-11730-gf5b7769eb040_4.17.0-11730-gf5b7769eb040-12345_powerpc.changes
