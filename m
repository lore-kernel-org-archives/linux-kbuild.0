Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:59292 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbeL1QHn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Dec 2018 11:07:43 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 29 Dec 2018 01:06:52 +0900
Message-ID: <CAK7LNARm4c95_f+Z__ygHS1Npf_asse32CNYqUy-CLxHcATezw@mail.gmail.com>
Subject: [GIT PULL 4/4] Kconfig file consolidation for v4.21
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull Kconfig file consolidation.

You will see conflicts in
arch/{arm64,mips}/Kconfig.

The correct fixes are available in linux-next.

Thanks!




The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v4.21-2

for you to fetch changes up to 5cfc879caee810828d90aec808d85560f34f02af:

  pcmcia: remove per-arch PCMCIA config entry (2018-11-29 09:39:52 +0900)

----------------------------------------------------------------
Kconfig file consolidation for v4.21

Consolidation of bus (PCI, PCMCIA, EISA, RapidIO) config entries
by Christoph Hellwig.

Currently, every architecture that wants to provide common peripheral
busses needs to add some boilerplate code and include the right Kconfig
files. This series instead just selects the presence (when needed) and
then handles everything in the bus-specific Kconfig file under drivers/.

----------------------------------------------------------------
Christoph Hellwig (7):
      MIPS: remove the HT_PCI config option
      PCI: consolidate PCI config entry in drivers/pci
      PCI: consolidate the PCI_DOMAINS and PCI_DOMAINS_GENERIC config options
      PCI: consolidate the PCI_SYSCALL symbol
      pcmcia: allow PCMCIA support independent of the architecture
      rapidio: consolidate RAPIDIO config entry in drivers/rapidio
      eisa: consolidate EISA Kconfig entry in drivers/eisa

Masahiro Yamada (1):
      pcmcia: remove per-arch PCMCIA config entry

 arch/alpha/Kconfig                               |  40 ++++--------
 arch/arc/Kconfig                                 |  24 +------
 arch/arc/plat-axs10x/Kconfig                     |   2 +-
 arch/arc/plat-hsdk/Kconfig                       |   2 +-
 arch/arm/Kconfig                                 |  61 +++---------------
 arch/arm/mach-alpine/Kconfig                     |   2 +-
 arch/arm/mach-bcm/Kconfig                        |   2 +-
 arch/arm/mach-footbridge/Kconfig                 |   8 +--
 arch/arm/mach-ixp4xx/Kconfig                     |  22 +++----
 arch/arm/mach-ks8695/Kconfig                     |  10 +--
 arch/arm/mach-mv78xx0/Kconfig                    |   2 +-
 arch/arm/mach-mvebu/Kconfig                      |   2 +-
 arch/arm/mach-orion5x/Kconfig                    |   2 +-
 arch/arm/mach-pxa/Kconfig                        |   2 +-
 arch/arm/mach-sa1100/Kconfig                     |   2 +-
 arch/arm/mach-socfpga/Kconfig                    |   2 +-
 arch/arm64/Kconfig                               |  25 +-------
 arch/hexagon/Kconfig                             |   3 -
 arch/ia64/Kconfig                                |  28 +--------
 arch/m68k/Kconfig.bus                            |  13 ----
 arch/m68k/Kconfig.cpu                            |   1 +
 arch/microblaze/Kconfig                          |  17 +----
 arch/mips/Kconfig                                | 111
+++++++--------------------------
 arch/mips/alchemy/Kconfig                        |   6 +-
 arch/mips/ath25/Kconfig                          |   3 +-
 arch/mips/ath79/Kconfig                          |   8 +--
 arch/mips/bcm63xx/Kconfig                        |  14 ++---
 arch/mips/include/asm/mach-loongson64/loongson.h |   2 +-
 arch/mips/lantiq/Kconfig                         |   2 +-
 arch/mips/loongson64/Kconfig                     |   7 +--
 arch/mips/pmcs-msp71xx/Kconfig                   |  10 +--
 arch/mips/ralink/Kconfig                         |   8 +--
 arch/mips/sibyte/Kconfig                         |  10 +--
 arch/mips/txx9/Kconfig                           |   8 +--
 arch/mips/vr41xx/Kconfig                         |   8 +--
 arch/parisc/Kconfig                              |   1 +
 arch/powerpc/Kconfig                             |  47 ++------------
 arch/powerpc/platforms/40x/Kconfig               |  10 +--
 arch/powerpc/platforms/44x/Kconfig               |  32 +++++-----
 arch/powerpc/platforms/512x/Kconfig              |   2 +-
 arch/powerpc/platforms/52xx/Kconfig              |   2 +-
 arch/powerpc/platforms/83xx/Kconfig              |   2 +-
 arch/powerpc/platforms/85xx/Kconfig              |  10 +--
 arch/powerpc/platforms/86xx/Kconfig              |   8 +--
 arch/powerpc/platforms/Kconfig                   |   2 +-
 arch/powerpc/platforms/Kconfig.cputype           |   4 +-
 arch/powerpc/platforms/amigaone/Kconfig          |   2 +-
 arch/powerpc/platforms/cell/Kconfig              |   2 +-
 arch/powerpc/platforms/chrp/Kconfig              |   2 +-
 arch/powerpc/platforms/embedded6xx/Kconfig       |   4 +-
 arch/powerpc/platforms/maple/Kconfig             |   2 +-
 arch/powerpc/platforms/pasemi/Kconfig            |   2 +-
 arch/powerpc/platforms/powermac/Kconfig          |   2 +-
 arch/powerpc/platforms/powernv/Kconfig           |   2 +-
 arch/powerpc/platforms/ps3/Kconfig               |   2 +-
 arch/powerpc/platforms/pseries/Kconfig           |   2 +-
 arch/riscv/Kconfig                               |  25 +-------
 arch/s390/Kconfig                                |  26 +++-----
 arch/sh/Kconfig                                  |  24 +------
 arch/sh/boards/Kconfig                           |  30 ++++-----
 arch/sparc/Kconfig                               |  25 +-------
 arch/um/Kconfig                                  |   6 --
 arch/unicore32/Kconfig                           |  17 +----
 arch/x86/Kconfig                                 |  47 +-------------
 arch/x86/configs/i386_defconfig                  |   1 +
 arch/x86/configs/x86_64_defconfig                |   1 +
 arch/xtensa/Kconfig                              |  18 +-----
 arch/xtensa/configs/common_defconfig             |   1 +
 drivers/Kconfig                                  |   7 +++
 drivers/eisa/Kconfig                             |  21 ++++++-
 drivers/parisc/Kconfig                           |  24 +------
 drivers/pci/Kconfig                              |  30 +++++++++
 drivers/pci/endpoint/Kconfig                     |   2 +-
 drivers/pcmcia/Kconfig                           |   1 +
 drivers/rapidio/Kconfig                          |  11 ++++
 75 files changed, 287 insertions(+), 641 deletions(-)


--
Best Regards
Masahiro Yamada
