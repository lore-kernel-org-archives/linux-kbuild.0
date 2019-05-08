Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39246 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfEHOs3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 10:48:29 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 8 May 2019 23:47:39 +0900
Message-ID: <CAK7LNARG6if48VWsFTYmKstm+2jPSbrZRimVbD2W4a4AmBqmOA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v5.2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: masahiroy@kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull Kbuild updates for v5.2

Thanks.



The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.2

for you to fetch changes up to 7fb1fc420f3b1cb27cce5aa1050eb5d9161d0944:

  .gitignore: add more all*.config patterns (2019-05-08 09:47:46 +0900)

----------------------------------------------------------------
Kbuild updates for v5.2

- allow users to invoke 'make' out of the source tree

- refactor scripts/mkmakefile

- deprecate KBUILD_SRC, which was used to track the source tree
  location for O= build.

- fix recordmcount.pl in case objdump output is localized

- turn unresolved symbols in external modules to errors from warnings
  by default; pass KBUILD_MODPOST_WARN=1 to get them back to warnings

- generate modules.builtin.modinfo to collect .modinfo data from
  built-in modules

- misc Makefile cleanups

----------------------------------------------------------------
Alexey Gladkov (1):
      moduleparam: Save information about built-in modules in separate file

Daniel Dadap (1):
      scripts: override locale from environment when running recordmcount.pl

Masahiro Yamada (18):
      kbuild: move RETPOLINE flags below config-targets
      kbuild: fix warning "overriding recipe for target 'Makefile'"
      kbuild: pass $(MAKECMDGOALS) to sub-make as is
      kbuild: allow Kbuild to start from any directory
      kbuild: mkmakefile: do not check the generated Makefile marker
      kbuild: mkmakefile: generate a simple wrapper of top Makefile
      kbuild: use $(srctree) instead of KBUILD_SRC to check out-of-tree build
      memory: squash drivers/memory/Makefile.asm-offsets
      kbuild: remove unneeded dependency for include/config/kernel.release
      kbuild: check arch/$(SRCARCH)/include/generated before out-of-tree build
      kbuild: move samples/ to KBUILD_VMLINUX_OBJS
      kbuild: move Documentation to vmlinux-alldirs
      samples: seccomp: turn CONFIG_SAMPLE_SECCOMP into a bool option
      samples: kobject: allow CONFIG_SAMPLE_KOBJECT to become y
      scripts/tags.sh: fix direct execution of scripts/tags.sh
      .gitignore: add leading and trailing slashes to generated directories
      Remove MODULE_ALIAS() calls that take undefined macro
      .gitignore: add more all*.config patterns

Wiebe, Wladislav (Nokia - DE/Ulm) (1):
      modpost: make KBUILD_MODPOST_WARN also configurable for external modules

 .gitignore                          |  16 ++-
 Documentation/dontdiff              |   1 +
 Documentation/kbuild/kbuild.txt     |   5 +
 Makefile                            | 146 +++++++++++++++-------------
 arch/arm/plat-omap/dma.c            |   1 -
 drivers/clocksource/timer-ti-dm.c   |   1 -
 drivers/memory/Makefile             |   7 +-
 drivers/memory/Makefile.asm-offsets |   4 -
 drivers/mfd/omap-usb-tll.c          |   1 -
 include/asm-generic/vmlinux.lds.h   |   1 +
 include/linux/module.h              |   1 +
 include/linux/moduleparam.h         |  12 +--
 samples/Kconfig                     |   7 +-
 samples/Makefile                    |   2 +-
 samples/seccomp/Makefile            |   2 +-
 scripts/Makefile.build              |   2 +-
 scripts/Makefile.host               |   2 +-
 scripts/Makefile.lib                |   2 +-
 scripts/Makefile.modbuiltin         |   2 +-
 scripts/Makefile.modpost            |   2 +-
 scripts/gdb/linux/Makefile          |   2 +-
 scripts/link-vmlinux.sh             |   3 +
 scripts/mkmakefile                  |  26 +----
 scripts/recordmcount.pl             |   2 +-
 scripts/tags.sh                     |   2 +-
 25 files changed, 128 insertions(+), 124 deletions(-)
 delete mode 100644 drivers/memory/Makefile.asm-offsets

-- 
Best Regards
Masahiro Yamada
