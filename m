Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:50535 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbeKCRI4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Nov 2018 13:08:56 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 3 Nov 2018 16:57:37 +0900
Message-ID: <CAK7LNATzERTiys46vFOTLWBbZ8TXOdT-EojWW7aKZxWwahkTpg@mail.gmail.com>
Subject: [GIT PULL] more Kbuild updates for v4.20
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull a little more Kbuild updates.
Thanks!




The following changes since commit 310c7585e8300ddc46211df0757c11e4299ec482:

  Merge tag 'nfsd-4.20' of git://linux-nfs.org/~bfields/linux
(2018-10-30 13:03:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.20-2

for you to fetch changes up to 995167420797c000bff1f0787ab2390ffa1a9784:

  kbuild: remove cc-name variable (2018-11-02 22:49:01 +0900)

----------------------------------------------------------------
Kbuild updates for v4.20 (2nd)

- clean-up leftovers in Kconfig files

- remove stale oldnoconfig and silentoldconfig targets

- remove unneeded cc-fullversion and cc-name variables

- improve merge_config script to allow overriding option prefix

----------------------------------------------------------------
Christoph Hellwig (4):
      scsi: aha152x: rename the PCMCIA define
      powerpc: remove CONFIG_PCI_QSPAN
      powerpc: remove CONFIG_MCA leftovers
      powerpc: PCI_MSI needs PCI

Masahiro Yamada (5):
      kconfig: remove oldnoconfig target
      kconfig: remove silentoldconfig target
      kbuild: remove unused cc-fullversion variable
      kbuild: replace cc-name test with CONFIG_CC_IS_CLANG
      kbuild: remove cc-name variable

Petr Vorel (1):
      merge_config.sh: Allow to define config prefix

 Documentation/kbuild/makefiles.txt | 15 ---------------
 Documentation/networking/ice.rst   |  2 +-
 Makefile                           |  4 ++--
 arch/mips/Makefile                 |  2 +-
 arch/mips/vdso/Makefile            |  2 +-
 arch/powerpc/Kconfig               | 13 -------------
 arch/powerpc/Makefile              |  4 ++--
 arch/powerpc/platforms/40x/Kconfig |  1 +
 arch/powerpc/platforms/44x/Kconfig |  2 ++
 drivers/scsi/Kconfig               |  6 +++---
 drivers/scsi/aha152x.c             | 14 +++++++-------
 drivers/scsi/pcmcia/aha152x_core.c |  2 +-
 scripts/Kbuild.include             |  8 --------
 scripts/Makefile.extrawarn         |  2 +-
 scripts/kconfig/Makefile           | 16 +---------------
 scripts/kconfig/conf.c             |  7 -------
 scripts/kconfig/merge_config.sh    |  6 +++++-
 17 files changed, 28 insertions(+), 78 deletions(-)


-- 
Best Regards
Masahiro Yamada
