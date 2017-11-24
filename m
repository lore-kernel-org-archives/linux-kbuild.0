Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:38296 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750739AbdKXRAH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Nov 2017 12:00:07 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 25 Nov 2017 01:58:59 +0900
Message-ID: <CAK7LNAT9opHCYFfccD6EOPZVznY0aQ7dOYVkupaTesEvzs7bKA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v4.15 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull a little more Kbuild updates for v4.15.
The reason for lateness is I hesitated to put some patches
in the last week pull requests due to big conflicts.
Also, I applied some fixes and trivial enough ones.
I hope you will pull this.



The following changes since commit 2ce079f04d5914dae14fdc8618f804cc0d2a1b8f=
:

  Merge tag 'kbuild-misc-v4.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
(2017-11-17 17:51:33 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.15-2

for you to fetch changes up to 10aaa3b7e95b9649fd658ac7e9075093316425d8:

  kbuild: drop $(extra-y) from real-objs-y (2017-11-23 23:29:26 +0900)

----------------------------------------------------------------
Kbuild updates for v4.15 (2nd)

- Use pwd instead of /bin/pwd for portability

- Clean up Makefiles

- Fix ld-option for clang

- Fix malloc'ed data size in Kconfig

- Fix parallel building along with coccicheck

- Fix a minor issue of package building

- Prompt to use "rpm-pkg" instead of "rpm"

- Clean up *.i and *.lst patterns by "make clean"

----------------------------------------------------------------
Bj=C3=B8rn Forsman (1):
      kbuild: /bin/pwd -> pwd

Chris Fries (1):
      kbuild: Set KBUILD_CFLAGS before incl. arch Makefile

Heinrich Schuchardt (1):
      kconfig/symbol.c: use correct pointer type argument for sizeof

Masahiro Yamada (7):
      kbuild: create built-in.o automatically if parent directory wants it
      kbuild: remove all dummy assignments to obj-
      coccinelle: fix parallel build with CHECK=3Dscripts/coccicheck
      kbuild: pkg: use --transform option to prefix paths in tar
      kbuild: rpm: prompt to use "rpm-pkg" if "rpm" target is used
      kbuild: clean up *.i and *.lst patterns by make clean
      kbuild: drop $(extra-y) from real-objs-y

 Documentation/ia64/xen.txt                |  2 +-
 Makefile                                  | 77 ++++++++++++-----------
 arch/arm/mach-uniphier/Makefile           |  1 -
 arch/mips/boot/dts/brcm/Makefile          |  3 -
 arch/mips/boot/dts/cavium-octeon/Makefile |  3 -
 arch/mips/boot/dts/img/Makefile           |  3 -
 arch/mips/boot/dts/ingenic/Makefile       |  3 -
 arch/mips/boot/dts/lantiq/Makefile        |  3 -
 arch/mips/boot/dts/mti/Makefile           |  3 -
 arch/mips/boot/dts/netlogic/Makefile      |  3 -
 arch/mips/boot/dts/ni/Makefile            |  3 -
 arch/mips/boot/dts/pic32/Makefile         |  3 -
 arch/mips/boot/dts/qca/Makefile           |  3 -
 arch/mips/boot/dts/ralink/Makefile        |  3 -
 arch/mips/boot/dts/xilfpga/Makefile       |  3 -
 firmware/Makefile                         |  3 -
 samples/bpf/Makefile                      |  3 -
 samples/hidraw/Makefile                   |  3 -
 samples/seccomp/Makefile                  |  3 -
 samples/sockmap/Makefile                  |  3 -
 samples/statx/Makefile                    |  3 -
 samples/uhid/Makefile                     |  3 -
 scripts/Makefile.build                    |  4 +-
 scripts/Makefile.lib                      |  2 +-
 scripts/coccicheck                        | 15 +++--
 scripts/kconfig/symbol.c                  |  2 +-
 scripts/package/Makefile                  |  7 +--
 tools/power/cpupower/Makefile             |  2 +-
 tools/scripts/Makefile.include            |  2 +-
 29 files changed, 58 insertions(+), 113 deletions(-)


--=20
Best Regards
Masahiro Yamada
