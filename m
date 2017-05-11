Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:36046 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751820AbdEKAoE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 May 2017 20:44:04 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 May 2017 09:44:00 +0900
Message-ID: <CAK7LNAQ83uDKAsm0vRSZpw-FWVXRWn9+bHqGvJgth9M34f1y5g@mail.gmail.com>
Subject: [GIT PULL 3/3] Kbuild uapi updates for v4.12
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Here are UAPI header export updates.
I needed to rebase this on the recent commit to resolve a complex conflict,
but it should be OK because this has been for a while in linux-next.
For the benefits of this work, please see below.
Please pull!


The following changes since commit 2868b2513aa732a99ea4a0a6bf10dc93c1f3dac2:

  Merge tag 'linux-kselftest-4.12-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
(2017-05-08 20:43:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-uapi-v4.12

for you to fetch changes up to 3e18c637fa3e2f6836a4034c80ca0a86be968efc:

  arch/include: remove empty Kbuild files (2017-05-11 00:22:18 +0900)

----------------------------------------------------------------
Kbuild UAPI header export updates for v4.12

Improvement of headers_install by Nicolas Dichtel.

It has been long since the introduction of uapi directories,
but the de-coupling of exported headers has not been completed.
Headers listed in header-y are exported whether they exist in
uapi directories or not.  His work fixes this inconsistency.

All (and only) headers under uapi directories are now exported.
The asm-generic wrappers are still exceptions, but this is a big
step forward.

----------------------------------------------------------------
Nicolas Dichtel (11):
      h8300: put bitsperlong.h in uapi
      nios2: put setup.h in uapi
      x86: stop exporting msr-index.h to userland
      Makefile.headersinst: cleanup input files
      Makefile.headersinst: remove destination-y option
      uapi: includes linux/types.h before exporting files
      btrfs_tree.h: fix include from userland
      smc_diag.h: fix include from userland
      uapi: export all headers under uapi directories
      uapi: export all arch specifics directories
      arch/include: remove empty Kbuild files

 Documentation/kbuild/makefiles.txt              |  74 +++---
 Makefile                                        |   6 +-
 arch/alpha/include/uapi/asm/Kbuild              |  41 ---
 arch/arc/include/uapi/asm/Kbuild                |   3 -
 arch/arm/include/uapi/asm/Kbuild                |  17 --
 arch/arm64/include/uapi/asm/Kbuild              |  18 --
 arch/blackfin/include/uapi/asm/Kbuild           |  17 --
 arch/c6x/include/uapi/asm/Kbuild                |   8 -
 arch/cris/include/arch-v10/arch/Kbuild          |   1 -
 arch/cris/include/arch-v32/arch/Kbuild          |   1 -
 arch/cris/include/uapi/arch-v10/arch/Kbuild     |   5 -
 arch/cris/include/uapi/arch-v32/arch/Kbuild     |   3 -
 arch/cris/include/uapi/asm/Kbuild               |  42 ----
 arch/frv/include/uapi/asm/Kbuild                |  33 ---
 arch/h8300/include/uapi/asm/Kbuild              |  28 ---
 arch/h8300/include/{ => uapi}/asm/bitsperlong.h |   6 +-
 arch/hexagon/include/asm/Kbuild                 |   3 -
 arch/hexagon/include/uapi/asm/Kbuild            |  13 -
 arch/ia64/include/uapi/asm/Kbuild               |  45 ----
 arch/m32r/include/uapi/asm/Kbuild               |  31 ---
 arch/m68k/include/uapi/asm/Kbuild               |  24 --
 arch/metag/include/uapi/asm/Kbuild              |   8 -
 arch/microblaze/include/uapi/asm/Kbuild         |  32 ---
 arch/mips/include/uapi/asm/Kbuild               |  37 ---
 arch/mn10300/include/uapi/asm/Kbuild            |  32 ---
 arch/nios2/include/uapi/asm/Kbuild              |   4 +-
 arch/openrisc/include/asm/Kbuild                |   3 -
 arch/openrisc/include/uapi/asm/Kbuild           |   8 -
 arch/parisc/include/uapi/asm/Kbuild             |  28 ---
 arch/powerpc/include/uapi/asm/Kbuild            |  45 ----
 arch/s390/include/uapi/asm/Kbuild               |  46 ----
 arch/score/include/asm/Kbuild                   |   3 -
 arch/score/include/uapi/asm/Kbuild              |  32 ---
 arch/sh/include/uapi/asm/Kbuild                 |  23 --
 arch/sparc/include/uapi/asm/Kbuild              |  48 ----
 arch/tile/include/arch/Kbuild                   |   1 -
 arch/tile/include/asm/Kbuild                    |   3 -
 arch/tile/include/uapi/arch/Kbuild              |  17 --
 arch/tile/include/uapi/asm/Kbuild               |  17 --
 arch/unicore32/include/uapi/asm/Kbuild          |   6 -
 arch/x86/include/uapi/asm/Kbuild                |  59 -----
 arch/xtensa/include/uapi/asm/Kbuild             |  23 --
 include/Kbuild                                  |   2 -
 include/asm-generic/Kbuild.asm                  |   1 -
 include/rdma/ib_verbs.h                         |   3 +-
 include/scsi/fc/Kbuild                          |   0
 include/uapi/Kbuild                             |  15 --
 include/uapi/asm-generic/Kbuild                 |  36 ---
 include/uapi/asm-generic/Kbuild.asm             |  76 +++---
 include/uapi/drm/Kbuild                         |  23 --
 include/uapi/linux/Kbuild                       | 494
+------------------------------------
 include/uapi/linux/android/Kbuild               |   2 -
 include/uapi/linux/bcache.h                     |   2 +-
 include/uapi/linux/btrfs_tree.h                 |   3 +
 include/uapi/linux/byteorder/Kbuild             |   3 -
 include/uapi/linux/caif/Kbuild                  |   3 -
 include/uapi/linux/can/Kbuild                   |   6 -
 include/uapi/linux/cryptouser.h                 |   2 +
 include/uapi/linux/dvb/Kbuild                   |   9 -
 include/uapi/linux/hdlc/Kbuild                  |   2 -
 include/uapi/linux/hsi/Kbuild                   |   2 -
 include/uapi/linux/iio/Kbuild                   |   3 -
 include/uapi/linux/isdn/Kbuild                  |   2 -
 include/uapi/linux/mmc/Kbuild                   |   2 -
 include/uapi/linux/netfilter/Kbuild             |  89 -------
 include/uapi/linux/netfilter/ipset/Kbuild       |   5 -
 include/uapi/linux/netfilter_arp/Kbuild         |   3 -
 include/uapi/linux/netfilter_bridge/Kbuild      |  18 --
 include/uapi/linux/netfilter_ipv4/Kbuild        |  10 -
 include/uapi/linux/netfilter_ipv6/Kbuild        |  13 -
 include/uapi/linux/nfsd/Kbuild                  |   6 -
 include/uapi/linux/pr.h                         |   2 +
 include/uapi/linux/qrtr.h                       |   1 +
 include/uapi/linux/raid/Kbuild                  |   3 -
 include/uapi/linux/smc_diag.h                   |   2 +-
 include/uapi/linux/spi/Kbuild                   |   2 -
 include/uapi/linux/sunrpc/Kbuild                |   2 -
 include/uapi/linux/tc_act/Kbuild                |  16 --
 include/uapi/linux/tc_ematch/Kbuild             |   5 -
 include/uapi/linux/usb/Kbuild                   |  12 -
 include/uapi/linux/wimax/Kbuild                 |   2 -
 include/uapi/misc/Kbuild                        |   2 -
 include/uapi/mtd/Kbuild                         |   6 -
 include/uapi/rdma/Kbuild                        |  20 --
 include/uapi/rdma/bnxt_re-abi.h                 |   2 +
 include/uapi/rdma/hfi/Kbuild                    |   3 -
 include/uapi/rdma/ib_user_verbs.h               |   2 +
 include/uapi/scsi/Kbuild                        |   6 -
 include/uapi/scsi/fc/Kbuild                     |   5 -
 include/uapi/sound/Kbuild                       |  16 --
 include/uapi/video/Kbuild                       |   4 -
 include/uapi/xen/Kbuild                         |   5 -
 include/video/Kbuild                            |   0
 scripts/Makefile.headersinst                    |  68 +++--
 94 files changed, 120 insertions(+), 1795 deletions(-)
 delete mode 100644 arch/cris/include/arch-v10/arch/Kbuild
 delete mode 100644 arch/cris/include/arch-v32/arch/Kbuild
 delete mode 100644 arch/cris/include/uapi/arch-v10/arch/Kbuild
 delete mode 100644 arch/cris/include/uapi/arch-v32/arch/Kbuild
 rename arch/h8300/include/{ => uapi}/asm/bitsperlong.h (67%)
 delete mode 100644 arch/tile/include/arch/Kbuild
 delete mode 100644 arch/tile/include/uapi/arch/Kbuild
 delete mode 100644 include/Kbuild
 delete mode 100644 include/asm-generic/Kbuild.asm
 delete mode 100644 include/scsi/fc/Kbuild
 delete mode 100644 include/uapi/Kbuild
 delete mode 100644 include/uapi/asm-generic/Kbuild
 delete mode 100644 include/uapi/drm/Kbuild
 delete mode 100644 include/uapi/linux/android/Kbuild
 delete mode 100644 include/uapi/linux/byteorder/Kbuild
 delete mode 100644 include/uapi/linux/caif/Kbuild
 delete mode 100644 include/uapi/linux/can/Kbuild
 delete mode 100644 include/uapi/linux/dvb/Kbuild
 delete mode 100644 include/uapi/linux/hdlc/Kbuild
 delete mode 100644 include/uapi/linux/hsi/Kbuild
 delete mode 100644 include/uapi/linux/iio/Kbuild
 delete mode 100644 include/uapi/linux/isdn/Kbuild
 delete mode 100644 include/uapi/linux/mmc/Kbuild
 delete mode 100644 include/uapi/linux/netfilter/Kbuild
 delete mode 100644 include/uapi/linux/netfilter/ipset/Kbuild
 delete mode 100644 include/uapi/linux/netfilter_arp/Kbuild
 delete mode 100644 include/uapi/linux/netfilter_bridge/Kbuild
 delete mode 100644 include/uapi/linux/netfilter_ipv4/Kbuild
 delete mode 100644 include/uapi/linux/netfilter_ipv6/Kbuild
 delete mode 100644 include/uapi/linux/nfsd/Kbuild
 delete mode 100644 include/uapi/linux/raid/Kbuild
 delete mode 100644 include/uapi/linux/spi/Kbuild
 delete mode 100644 include/uapi/linux/sunrpc/Kbuild
 delete mode 100644 include/uapi/linux/tc_act/Kbuild
 delete mode 100644 include/uapi/linux/tc_ematch/Kbuild
 delete mode 100644 include/uapi/linux/usb/Kbuild
 delete mode 100644 include/uapi/linux/wimax/Kbuild
 delete mode 100644 include/uapi/misc/Kbuild
 delete mode 100644 include/uapi/mtd/Kbuild
 delete mode 100644 include/uapi/rdma/Kbuild
 delete mode 100644 include/uapi/rdma/hfi/Kbuild
 delete mode 100644 include/uapi/scsi/Kbuild
 delete mode 100644 include/uapi/scsi/fc/Kbuild
 delete mode 100644 include/uapi/sound/Kbuild
 delete mode 100644 include/uapi/video/Kbuild
 delete mode 100644 include/uapi/xen/Kbuild
 delete mode 100644 include/video/Kbuild

-- 
Best Regards
Masahiro Yamada
