Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:56352 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbeGLILo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 04:11:44 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/6] kbuild: clean-up and rename LDFLAGS to KBUILD_LDFLAGS
Date: Thu, 12 Jul 2018 17:01:30 +0900
Message-Id: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, x86@kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Jeff Dike <jdike@addtoit.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Masahiro Yamada <yamada.masahiro@socionext.com>


This series renames LDFLAGS to KBUILD_LDFLAGS
after some Makefile cleanups.

Currently, the last patch does not apply to Linus' tree
due to missing pre-requisite patches.

I will resolve conflicts as needed.



Masahiro Yamada (6):
  um: remove redundant 'export LDFLAGS' in arch/x86/Makefile.um
  ARM: vfp: clean-up arch/arm/vfp/Makefile
  kbuild: remove redundant LDFLAGS clearing in arch/*/Makefile
  kbuild: replace $(LDFLAGS) $(ldflags-y) with $(ld_flags)
  kbuild: change ld_flags to contain LDFLAGS_$(@F)
  kbuild: rename LDFLAGS to KBUILD_LDFLAGS

 Makefile                           | 6 +++---
 arch/arc/Makefile                  | 2 +-
 arch/arm/Makefile                  | 7 ++-----
 arch/arm/vfp/Makefile              | 5 +----
 arch/arm64/Makefile                | 4 ++--
 arch/c6x/Makefile                  | 3 +--
 arch/h8300/Makefile                | 2 +-
 arch/hexagon/Makefile              | 4 +---
 arch/m68k/Makefile                 | 2 +-
 arch/microblaze/Makefile           | 4 ++--
 arch/mips/Makefile                 | 2 +-
 arch/mips/boot/compressed/Makefile | 2 +-
 arch/mips/lasat/image/Makefile     | 2 +-
 arch/nds32/Makefile                | 4 ++--
 arch/openrisc/Makefile             | 1 -
 arch/powerpc/Makefile              | 6 +++---
 arch/riscv/Makefile                | 5 ++---
 arch/s390/Makefile                 | 2 +-
 arch/sh/Makefile                   | 4 ++--
 arch/sparc/Makefile                | 4 ++--
 arch/um/Makefile                   | 2 +-
 arch/um/drivers/Makefile           | 4 ++--
 arch/x86/Makefile                  | 4 ++--
 arch/x86/Makefile.um               | 4 +---
 arch/x86/boot/compressed/Makefile  | 6 +++---
 arch/xtensa/Makefile               | 2 +-
 arch/xtensa/boot/boot-elf/Makefile | 2 +-
 scripts/Kbuild.include             | 4 ++--
 scripts/Makefile.build             | 4 ++--
 scripts/Makefile.lib               | 5 ++---
 scripts/Makefile.modpost           | 2 +-
 31 files changed, 48 insertions(+), 62 deletions(-)

-- 
2.7.4

