Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:42174 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751071AbeF3OPO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Jun 2018 10:15:14 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 30 Jun 2018 23:14:12 +0900
Message-ID: <CAK7LNASY2kiCLCUoUaE3u-ddkxRj4CvaLa1-=m72MKyAFt0bhw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.18-rc3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull Kbuild fixes.  Thanks!


The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.18

for you to fetch changes up to 73d1c580f92b203f4c3a189ee98c917c65712f7e:

  kconfig: loop boundary condition fix (2018-06-28 22:48:08 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.18

- introduce __diag_* macros and suppress -Wattribute-alias warnings from GCC 8

- fix stack protector test script for x86_64

- fix line number handling in Kconfig

- document that '#' starts a comment in Kconfig

- handle P_SYMBOL property in dump debugging of Kconfig

- correct help message of LD_DEAD_CODE_DATA_ELIMINATION

- fix occasional segmentation faults in Kconfig

----------------------------------------------------------------
Arnd Bergmann (2):
      kbuild: add macro for controlling warnings to linux/compiler.h
      disable -Wattribute-alias warning for SYSCALL_DEFINEx()

Dirk Gouders (2):
      kconfig: fix line numbers for if-entries in menu tree
      kconfig: handle P_SYMBOL in print_symbol()

Jerry James (1):
      kconfig: loop boundary condition fix

Masahiro Yamada (1):
      kbuild: reword help of LD_DEAD_CODE_DATA_ELIMINATION

Paul Burton (1):
      powerpc: Remove -Wattribute-alias pragmas

Randy Dunlap (1):
      kconfig: document Kconfig source file comments

Sven Joachim (1):
      stack-protector: Fix test with 32-bit userland and CONFIG_64BIT=y

 Documentation/kbuild/kconfig-language.txt |  6 ++++++
 arch/powerpc/kernel/pci_32.c              |  4 ----
 arch/powerpc/kernel/pci_64.c              |  4 ----
 arch/powerpc/kernel/rtas.c                |  4 ----
 arch/powerpc/kernel/signal_32.c           |  8 --------
 arch/powerpc/kernel/signal_64.c           |  4 ----
 arch/powerpc/kernel/syscalls.c            |  4 ----
 arch/powerpc/mm/subpage-prot.c            |  4 ----
 include/linux/compat.h                    |  8 +++++++-
 include/linux/compiler-gcc.h              | 25 +++++++++++++++++++++++++
 include/linux/compiler_types.h            | 18 ++++++++++++++++++
 include/linux/syscalls.h                  |  4 ++++
 init/Kconfig                              |  7 +++----
 scripts/gcc-x86_64-has-stack-protector.sh |  2 +-
 scripts/kconfig/expr.h                    |  3 +++
 scripts/kconfig/preprocess.c              |  2 +-
 scripts/kconfig/zconf.y                   |  8 ++++++--
 17 files changed, 74 insertions(+), 41 deletions(-)


-- 
Best Regards
Masahiro Yamada
