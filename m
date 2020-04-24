Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:33109 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgDXQKZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 12:10:25 -0400
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 25 Apr 2020 01:09:27 +0900
Message-ID: <CAK7LNAQRXn_n60K9LF=pBz0HHg55Lj-1p5gwwmT=YSOdMBXKCA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.7-rc3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull Kbuild fixes.
Thanks.


The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.7

for you to fetch changes up to d9451798998df3a72dce1bc365bc9e76401b0d3a:

  h8300: ignore vmlinux.lds (2020-04-23 16:41:26 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.7

 - fix scripts/config to properly handle ':' in string type CONFIG options

 - fix unneeded rebuilds of DT schema check rule

 - git rid of ordering dependency between <linux/vermagic.h> and
   <linux/module.h> to fix build errors in some network drivers

 - clean up generated headers of host arch with 'make ARCH=um mrproper'

----------------------------------------------------------------
Jeremie Francois (on alpha) (1):
      scripts/config: allow colons in option strings for sed

Masahiro Yamada (4):
      kbuild: fix DT binding schema rule again to avoid needless rebuilds
      arch: split MODULE_ARCH_VERMAGIC definitions out to <asm/vermagic.h>
      Documentation: kbuild: fix the section title format
      h8300: ignore vmlinux.lds

Vitor Massaru Iha (1):
      um: ensure `make ARCH=um mrproper` removes
arch/$(SUBARCH)/include/generated/

 Documentation/kbuild/makefiles.rst                |  3 +-
 arch/arc/include/asm/module.h                     |  5 --
 arch/arc/include/asm/vermagic.h                   |  8 +++
 arch/arm/include/asm/module.h                     | 24 ---------
 arch/arm/include/asm/vermagic.h                   | 31 ++++++++++++
 arch/arm64/include/asm/module.h                   |  2 -
 arch/arm64/include/asm/vermagic.h                 | 10 ++++
 arch/h8300/kernel/.gitignore                      |  2 +
 arch/hexagon/include/asm/{module.h => vermagic.h} |  8 +--
 arch/ia64/include/asm/module.h                    |  4 --
 arch/ia64/include/asm/vermagic.h                  | 15 ++++++
 arch/mips/include/asm/module.h                    | 61 -----------------------
 arch/mips/include/asm/vermagic.h                  | 66
+++++++++++++++++++++++++
 arch/nds32/include/asm/{module.h => vermagic.h}   |  8 ++-
 arch/powerpc/include/asm/module.h                 | 18 -------
 arch/powerpc/include/asm/vermagic.h               | 20 ++++++++
 arch/riscv/include/asm/module.h                   |  2 -
 arch/riscv/include/asm/vermagic.h                 |  9 ++++
 arch/sh/include/asm/module.h                      | 28 -----------
 arch/sh/include/asm/vermagic.h                    | 34 +++++++++++++
 arch/um/Makefile                                  |  1 +
 arch/x86/include/asm/module.h                     | 60 -----------------------
 arch/x86/include/asm/vermagic.h                   | 68
++++++++++++++++++++++++++
 arch/xtensa/include/asm/{module.h => vermagic.h}  | 15 +++---
 include/asm-generic/Kbuild                        |  1 +
 include/asm-generic/vermagic.h                    |  7 +++
 include/linux/vermagic.h                          |  8 +--
 scripts/Makefile.lib                              |  2 +-
 scripts/config                                    |  5 +-
 29 files changed, 297 insertions(+), 228 deletions(-)
 create mode 100644 arch/arc/include/asm/vermagic.h
 create mode 100644 arch/arm/include/asm/vermagic.h
 create mode 100644 arch/arm64/include/asm/vermagic.h
 create mode 100644 arch/h8300/kernel/.gitignore
 rename arch/hexagon/include/asm/{module.h => vermagic.h} (64%)
 create mode 100644 arch/ia64/include/asm/vermagic.h
 create mode 100644 arch/mips/include/asm/vermagic.h
 rename arch/nds32/include/asm/{module.h => vermagic.h} (52%)
 create mode 100644 arch/powerpc/include/asm/vermagic.h
 create mode 100644 arch/riscv/include/asm/vermagic.h
 create mode 100644 arch/sh/include/asm/vermagic.h
 create mode 100644 arch/x86/include/asm/vermagic.h
 rename arch/xtensa/include/asm/{module.h => vermagic.h} (57%)
 create mode 100644 include/asm-generic/vermagic.h


-- 
Best Regards
Masahiro Yamada
