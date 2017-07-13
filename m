Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:24117 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752314AbdGMQeD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Jul 2017 12:34:03 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 14 Jul 2017 01:33:39 +0900
Message-ID: <CAK7LNATb7LO8qyE4M+=bWOVJjOoe9Td3Exqw=vbKPgdrxWZ9+A@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v4.13 (2nd)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

This is a late Kbuild pull request for v4.13.
I needed to rebase this after arch changes were pulled in.
I think you can merge this cleanly.  Please pull!


The following changes since commit 2b976203417cf033079e0be30cae5f41d88e385e=
:

  Merge branch 'x86-urgent-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2017-07-09
11:21:31 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.13-2

for you to fetch changes up to d7f14c66c273b00aaa626f419d3155773a88d460:

  kbuild: Enable Large File Support for hostprogs (2017-07-11 21:33:54 +090=
0)

----------------------------------------------------------------
Kbuild updates for v4.13 (2nd)

- Move generic-y of exported headers to uapi/asm/Kbuild
  for complete de-coupling of UAPI

- Clean up scripts/Makefile.headersinst

- Fix host programs for 32 bit machine with XFS file system

----------------------------------------------------------------
Masahiro Yamada (28):
      kbuild: remove useless $(gen) variable in Makefile.headersinst
      kbuild: fix comment about dst of headers_{install, check}_all
      kbuild: pass dst=3D to Makefile.headersinst from top Makefile
      arm64: move generic-y of exported headers to uapi/asm/Kbuild
      ARM: move generic-y of exported headers to uapi/asm/Kbuild
      arc: move generic-y of exported headers to uapi/asm/Kbuild
      blackfin: move generic-y of exported headers to uapi/asm/Kbuild
      c6x: move generic-y of exported headers to uapi/asm/Kbuild
      cris: move generic-y of exported headers to uapi/asm/Kbuild
      h8300: move generic-y of exported headers to uapi/asm/Kbuild
      hexagon: move generic-y of exported headers to uapi/asm/Kbuild
      ia64: remove redundant generic-y +=3D kvm_para.h from asm/Kbuild
      m32r: move generic-y of exported headers to uapi/asm/Kbuild
      m68k: move generic-y of exported headers to uapi/asm/Kbuild
      metag: move generic-y of exported headers to uapi/asm/Kbuild
      microblaze: move generic-y of exported headers to uapi/asm/Kbuild
      nios2: remove unneeded arch/nios2/include/(generated/)asm/signal.h
      nios2: move generic-y of exported headers to uapi/asm/Kbuild
      openrisc: move generic-y of exported headers to uapi/asm/Kbuild
      parisc: move generic-y of exported headers to uapi/asm/Kbuild
      sh: move generic-y of exported headers to uapi/asm/Kbuild
      sparc: move generic-y of exported headers to uapi/asm/Kbuild
      tile: move generic-y of exported headers to uapi/asm/Kbuild
      unicore32: move generic-y of exported headers to uapi/asm/Kbuild
      xtensa: move generic-y of exported headers to uapi/asm/Kbuild
      kbuild: do not include old-kbuild-file from Makefile.headersinst
      kbuild: split exported generic header creation into uapi-asm-generic
      kbuild: remove wrapper files handling from Makefile.headersinst

Uwe Kleine-K=C3=B6nig (1):
      kbuild: Enable Large File Support for hostprogs

 Makefile                                | 26 +++++++++++++++---------
 arch/arc/include/asm/Kbuild             | 24 ----------------------
 arch/arc/include/uapi/asm/Kbuild        | 24 ++++++++++++++++++++++
 arch/arm/include/asm/Kbuild             | 16 ---------------
 arch/arm/include/uapi/asm/Kbuild        | 14 +++++++++++++
 arch/arm64/include/asm/Kbuild           | 17 ----------------
 arch/arm64/include/uapi/asm/Kbuild      | 16 +++++++++++++++
 arch/blackfin/include/asm/Kbuild        | 24 +---------------------
 arch/blackfin/include/uapi/asm/Kbuild   | 22 ++++++++++++++++++++
 arch/c6x/include/asm/Kbuild             | 28 +-------------------------
 arch/c6x/include/uapi/asm/Kbuild        | 25 +++++++++++++++++++++++
 arch/cris/include/asm/Kbuild            | 21 ++-----------------
 arch/cris/include/uapi/asm/Kbuild       | 17 ++++++++++++++++
 arch/h8300/include/asm/Kbuild           | 30 ++--------------------------
 arch/h8300/include/uapi/asm/Kbuild      | 26 ++++++++++++++++++++++++
 arch/hexagon/include/asm/Kbuild         | 24 +---------------------
 arch/hexagon/include/uapi/asm/Kbuild    | 22 ++++++++++++++++++++
 arch/ia64/include/asm/Kbuild            |  2 --
 arch/m32r/include/asm/Kbuild            |  4 +---
 arch/m32r/include/uapi/asm/Kbuild       |  3 ++-
 arch/m68k/include/asm/Kbuild            | 13 +-----------
 arch/m68k/include/uapi/asm/Kbuild       | 10 ++++++++++
 arch/metag/include/asm/Kbuild           | 26 +-----------------------
 arch/metag/include/uapi/asm/Kbuild      | 24 ++++++++++++++++++++++
 arch/microblaze/include/asm/Kbuild      | 25 -----------------------
 arch/microblaze/include/uapi/asm/Kbuild | 25 ++++++++++++++++++++++-
 arch/nios2/include/asm/Kbuild           | 26 +-----------------------
 arch/nios2/include/asm/signal.h         | 22 --------------------
 arch/nios2/include/uapi/asm/Kbuild      | 23 +++++++++++++++++++++
 arch/openrisc/include/asm/Kbuild        | 29 +--------------------------
 arch/openrisc/include/uapi/asm/Kbuild   | 27 +++++++++++++++++++++++++
 arch/parisc/include/asm/Kbuild          |  7 +------
 arch/parisc/include/uapi/asm/Kbuild     |  4 ++++
 arch/sh/include/asm/Kbuild              | 19 ------------------
 arch/sh/include/uapi/asm/Kbuild         | 18 +++++++++++++++++
 arch/sparc/include/asm/Kbuild           |  1 -
 arch/sparc/include/uapi/asm/Kbuild      |  2 ++
 arch/tile/include/asm/Kbuild            | 19 ------------------
 arch/tile/include/uapi/asm/Kbuild       | 19 ++++++++++++++++++
 arch/unicore32/include/asm/Kbuild       | 30 +---------------------------
 arch/unicore32/include/uapi/asm/Kbuild  | 27 +++++++++++++++++++++++++
 arch/xtensa/include/asm/Kbuild          | 10 +---------
 arch/xtensa/include/uapi/asm/Kbuild     |  9 +++++++++
 scripts/Makefile.headersinst            | 29 ++++-----------------------
 44 files changed, 391 insertions(+), 438 deletions(-)
 delete mode 100644 arch/nios2/include/asm/signal.h


--=20
Best Regards
Masahiro Yamada
