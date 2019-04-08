Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f171.google.com ([209.85.160.171]:40482 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfDHRfx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Apr 2019 13:35:53 -0400
Received: by mail-qt1-f171.google.com with SMTP id x12so16432907qts.7
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Apr 2019 10:35:52 -0700 (PDT)
MIME-Version: 1.0
From: Ivan Babrou <ivan@cloudflare.com>
Date: Mon, 8 Apr 2019 10:35:40 -0700
Message-ID: <CABWYdi1sSjZ8pw7tJpgvZyLfdJwT5judfjj7F3X5fLcAK3xvsw@mail.gmail.com>
Subject: syncconfig changes in 4.19.34 break builds
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, kernel-team <kernel-team@cloudflare.com>

Hey,

We've tried upgrading 4.19.31 to 4.19.34 and got the following error
during build:

[17:19:47] make KERNELRELEASE=4.19.34-cloudflare-2019.4.0-2-g4cdcca8
ARCH=x86_64 KBUILD_BUILD_VERSION=g4cdcca8 KBUILD_SRC= intdeb-pkg
[17:19:48] /bin/bash /cfsetup_build/build/linux-4.19.34/scripts/package/builddeb
[17:19:52] ***
[17:19:52] *** Configuration file ".config" not found!
[17:19:52] ***
[17:19:52] *** Please run some configurator (e.g. "make oldconfig" or
[17:19:52] *** "make menuconfig" or "make xconfig").
[17:19:52] ***
[17:19:52] make[12]: *** [syncconfig] Error 1
[17:19:52] make[11]: *** [syncconfig] Error 2
[17:19:52] make[10]: ***
[/cfsetup_build/build/amd64/include/config/auto.conf.cmd] Deleting
file '/cfsetup_build/build/amd64/include/config/tristate.conf'
[17:19:52] make[10]: Failed to remake makefile
'/cfsetup_build/build/amd64/include/config/auto.conf'.
[17:19:52] make[9]: *** [__sub-make] Error 2
[17:19:52] cp: cannot stat
'/cfsetup_build/build/linux-4.19.34/scripts/kconfig/Makefile:69:
recipe for target '\''syncconfig'\''
failed'$'\n''/cfsetup_build/build/linux-4.19.34/Makefile:539: recipe
for target '\''syncconfig'\''
failed'$'\n''arch/x86/boot/bzImage'$'\n''Makefile:24: recipe for
target '\''__sub-make'\'' failed': No such file or directory
[17:19:52] make[8]: *** [intdeb-pkg] Error 1
[17:19:52] make[7]: *** [intdeb-pkg] Error 2
[17:19:52] make[6]: *** [sub-make] Error 2
[17:19:52] make[5]: *** [__sub-make] Error 2
[17:19:52] /cfsetup_build/build/linux-4.19.34/scripts/package/Makefile:83:
recipe for target 'intdeb-pkg' failed
[17:19:52] make[4]: *** [binary-arch] Error 2
[17:19:52] /cfsetup_build/build/linux-4.19.34/Makefile:1365: recipe
for target 'intdeb-pkg' failed
[17:19:52] dpkg-buildpackage: error: fakeroot -u debian/rules binary
gave error exit status 2
[17:19:52] Makefile:146: recipe for target 'sub-make' failed
[17:19:52] make[3]: *** [bindeb-pkg] Error 2
[17:19:52] Makefile:24: recipe for target '__sub-make' failed
[17:19:52] make[2]: *** [bindeb-pkg] Error 2
[17:19:52] debian/rules:7: recipe for target 'binary-arch' failed
[17:19:52] make[1]: *** [sub-make] Error 2
[17:19:52] make: *** [core-packages-amd64] Error 2
[17:19:52] /cfsetup_build/build/linux-4.19.34/scripts/package/Makefile:79:
recipe for target 'bindeb-pkg' failed
[17:19:52] /cfsetup_build/build/linux-4.19.34/Makefile:1365: recipe
for target 'bindeb-pkg' failed
[17:19:52] make[2]: Leaving directory '/cfsetup_build/build/amd64'
[17:19:52] Makefile:146: recipe for target 'sub-make' failed
[17:19:52] make[1]: Leaving directory '/cfsetup_build/build/linux-4.19.34'
[17:19:52] Makefile:192: recipe for target 'core-packages-amd64' failed
[17:19:54] Failure: 2

We have kernel sources in /cfsetup_build/build/linux-4.19.34, while
build is happening in /cfsetup_build/build/amd64.

From a quick look at the changelog it seems that the following commit
is the reason:

* https://github.com/torvalds/linux/commit/638ecaf5836979ad1c6f6c3fdd738ee9e71c0b07
