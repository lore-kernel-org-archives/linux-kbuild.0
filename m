Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35590 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbeHOU5l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 16:57:41 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Aug 2018 03:03:39 +0900
Message-ID: <CAK7LNAROqcjzSRjkpR+-gzbTJjRe=mSkZqo39uRiDZBMZh9O=g@mail.gmail.com>
Subject: [GIT PULL 3/3] consolidate arch Kconfig files for v4.19
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull this patch series to consolidate arch Kconfig files.


Sorry for many conflicts.

Equivalent fixes are available in linux-next,
but I sorted the 'select' lines alphabetically
in arch/nios2/Kconfig.
(of course, this is not important, though.)


-------------------------
diff --cc arch/arm64/Kconfig
index 260ff5d,daf59d3..d0a53cc
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -279,10 -264,9 +279,6 @@@ config ARCH_SUPPORTS_UPROBE
  config ARCH_PROC_KCORE_TEXT
        def_bool y

- source "init/Kconfig"
-
- source "kernel/Kconfig.freezer"
 -config MULTI_IRQ_HANDLER
 -      def_bool y
--
  source "arch/arm64/Kconfig.platforms"

  menu "Bus support"
diff --cc arch/mips/Kconfig
index 642a56e,06a633e..2af13b1
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@@ -2988,13 -2990,6 +2984,9 @@@ config PGTABLE_LEVEL
        default 3 if 64BIT && !PAGE_SIZE_64KB
        default 2

 +config MIPS_AUTO_PFN_OFFSET
 +      bool
 +
- source "init/Kconfig"
-
- source "kernel/Kconfig.freezer"
-
  menu "Bus options (PCI, PCMCIA, EISA, ISA, TC)"

  config HW_HAS_EISA
diff --cc arch/nios2/Kconfig
index 9203504,cbe1844..f4ad113
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@@ -1,9 -1,7 +1,10 @@@
  # SPDX-License-Identifier: GPL-2.0
  config NIOS2
        def_bool y
 +      select ARCH_HAS_SYNC_DMA_FOR_CPU
 +      select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+       select ARCH_NO_SWAP
 +      select DMA_NONCOHERENT_OPS
        select TIMER_OF
        select GENERIC_ATOMIC64
        select GENERIC_CLOCKEVENTS
diff --cc arch/openrisc/Kconfig
index dfb6a79,42e3a0f..ed5f32d
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@@ -69,10 -69,9 +69,6 @@@ config STACKTRACE_SUPPOR
  config LOCKDEP_SUPPORT
        def_bool  y

- source "init/Kconfig"
-
- source "kernel/Kconfig.freezer"
 -config MULTI_IRQ_HANDLER
 -      def_bool y
--
  menu "Processor type and features"

  choice
----------------------------------------------------------------



The following changes since commit 9d3cce1e8b8561fed5f383d22a4d6949db4eadbe:

  Linux 4.18-rc5 (2018-07-15 12:49:31 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v4.19-2

for you to fetch changes up to 59e0b520c75c8b4588395aea6170e551c4189fd8:

  kconfig: add a Memory Management options" menu (2018-08-02 08:06:55 +0900)

----------------------------------------------------------------
Consolidation of Kconfig files by Christoph Hellwig.

Move the source statements of arch-independent Kconfig files instead of
duplicating the includes in every arch/$(SRCARCH)/Kconfig.

----------------------------------------------------------------
Christoph Hellwig (9):
      um: stop abusing KBUILD_KCONFIG
      um: cleanup Kconfig files
      um: create a proper drivers Kconfig
      kconfig: remove duplicate SWAP symbol defintions
      kconfig: include common Kconfig files from top-level Kconfig
      Kconfig: consolidate the "Kernel hacking" menu
      kconfig: include kernel/Kconfig.preempt from init/Kconfig
      kconfig: move the "Executable file formats" menu to fs/Kconfig.binfmt
      kconfig: add a Memory Management options" menu

Randy Dunlap (1):
      kconfig: use a menu in arch/Kconfig to reduce clutter

 Kconfig                                  |  22 ++++-
 arch/Kconfig                             |  13 +++
 arch/alpha/Kconfig                       |  23 +----
 arch/alpha/Kconfig.debug                 |   5 --
 arch/arc/Kconfig                         |  19 -----
 arch/arc/Kconfig.debug                   |   5 --
 arch/arm/Kconfig                         |  27 ------
 arch/arm/Kconfig.debug                   |   5 --
 arch/arm64/Kconfig                       |  26 ------
 arch/arm64/Kconfig.debug                 |   5 --
 arch/c6x/Kconfig                         |  41 ---------
 arch/c6x/Kconfig.debug                   |  10 +++
 arch/h8300/Kconfig                       |  36 --------
 arch/h8300/Kconfig.debug                 |   1 +
 arch/hexagon/Kconfig                     |  21 +----
 arch/hexagon/Kconfig.debug               |   1 +
 arch/ia64/Kconfig                        |  24 ------
 arch/ia64/Kconfig.debug                  |   5 --
 arch/m68k/Kconfig                        |  31 +------
 arch/m68k/Kconfig.debug                  |   5 --
 arch/microblaze/Kconfig                  |  32 +------
 arch/microblaze/Kconfig.debug            |   6 --
 arch/mips/Kconfig                        |  28 -------
 arch/mips/Kconfig.debug                  |   5 --
 arch/nds32/Kconfig                       |  21 -----
 arch/nds32/Kconfig.debug                 |   1 +
 arch/nios2/Kconfig                       |  32 +------
 arch/nios2/Kconfig.debug                 |   5 --
 arch/openrisc/Kconfig                    |  30 -------
 arch/openrisc/Kconfig.debug              |   1 +
 arch/parisc/Kconfig                      |  27 ------
 arch/parisc/Kconfig.debug                |   5 --
 arch/powerpc/Kconfig                     |  22 -----
 arch/powerpc/Kconfig.debug               |   5 --
 arch/riscv/Kconfig                       |  71 ----------------
 arch/riscv/Kconfig.debug                 |  37 ++++++++
 arch/s390/Kconfig                        |  28 -------
 arch/s390/Kconfig.debug                  |   5 --
 arch/sh/Kconfig                          |  26 ------
 arch/sh/Kconfig.debug                    |   5 --
 arch/sh/mm/Kconfig                       |   2 -
 arch/sparc/Kconfig                       |  28 -------
 arch/sparc/Kconfig.debug                 |   5 --
 arch/um/{Kconfig.um => Kconfig}          |  74 +++++++++++++++-
 arch/um/Kconfig.char                     | 124 ---------------------------
 arch/um/Kconfig.common                   |  60 -------------
 arch/um/Kconfig.debug                    |   5 --
 arch/um/Kconfig.rest                     |  22 -----
 arch/um/Makefile                         |   4 +-
 arch/um/{Kconfig.net => drivers/Kconfig} | 125 +++++++++++++++++++++++++++-
 arch/unicore32/Kconfig                   |  28 -------
 arch/unicore32/Kconfig.debug             |   5 --
 arch/x86/Kconfig                         |  26 +-----
 arch/x86/Kconfig.debug                   |   5 --
 arch/x86/um/Kconfig                      |  15 ----
 arch/xtensa/Kconfig                      |  29 -------
 arch/xtensa/Kconfig.debug                |   5 --
 fs/Kconfig.binfmt                        |   5 ++
 init/Kconfig                             |  14 +++-
 kernel/Kconfig.preempt                   |   2 +
 lib/Kconfig.debug                        |   7 ++
 mm/Kconfig                               |   5 ++
 62 files changed, 316 insertions(+), 996 deletions(-)
 create mode 100644 arch/c6x/Kconfig.debug
 create mode 100644 arch/h8300/Kconfig.debug
 create mode 100644 arch/hexagon/Kconfig.debug
 create mode 100644 arch/nds32/Kconfig.debug
 create mode 100644 arch/openrisc/Kconfig.debug
 create mode 100644 arch/riscv/Kconfig.debug
 rename arch/um/{Kconfig.um => Kconfig} (82%)
 delete mode 100644 arch/um/Kconfig.char
 delete mode 100644 arch/um/Kconfig.common
 delete mode 100644 arch/um/Kconfig.rest
 rename arch/um/{Kconfig.net => drivers/Kconfig} (66%)



-- 
Best Regards
Masahiro Yamada
