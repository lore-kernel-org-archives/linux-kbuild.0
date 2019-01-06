Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50251 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfAFB7v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Jan 2019 20:59:51 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 6 Jan 2019 10:59:02 +0900
Message-ID: <CAK7LNATMD=sNLMpc=2V8Xenk0jLKQDf3E-EgTKyRYzv53pSAfg@mail.gmail.com>
Subject: [GIT PULL] more Kbuild updates for v4.21
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Here are late Kbuild updates.
I am sending this pull request in the last minute
to avoid conflicts from tree-wide cleanups such as
jump_label, generic-y.

Please pull!



The following changes since commit 5c4a60831aa6d937cec9cf17aef8eb6c1851bfcd:

  Merge branch 'next' of
git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux (2019-01-05
16:07:28 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.21-3

for you to fetch changes up to d86271af64602e7c86c003b27f27c7216706ff96:

  kconfig: rename generated .*conf-cfg to *conf-cfg (2019-01-06 10:47:09 +0900)

----------------------------------------------------------------
Kbuild late updates for v4.21

- improve boolinit.cocci and use_after_iter.cocci semantic patches

- fix alignment for kallsyms

- move 'asm goto' compiler test to Kconfig and clean up jump_label
  CONFIG option

- generate asm-generic wrappers automatically if arch does not implement
  mandatory UAPI headers

- remove redundant generic-y defines

- misc cleanups

----------------------------------------------------------------
Julia Lawall (2):
      scripts: coccinelle: check for redeclaration
      scripts: coccinelle: boolinit: drop warnings on named constants

Masahiro Yamada (15):
      nios2: remove unneeded HAS_DMA define
      nds32: remove redundant kernel-space generic-y
      kconfig: remove unused "file" field of yylval union
      jump_label: move 'asm goto' support test to Kconfig
      kbuild: remove UIMAGE_IN and UIMAGE_OUT
      kbuild: clean up rule_dtc_dt_yaml
      kbuild: remove redundant target cleaning on failure
      kbuild: change filechk to surround the given command with { }
      riscv: remove redundant kernel-space generic-y
      arch: remove stale comments "UAPI Header export list"
      kbuild: generate asm-generic wrappers if mandatory headers are missing
      arch: remove redundant UAPI generic-y defines
      kbuild: use assignment instead of define ... endef for filechk_* rules
      kbuild: remove unnecessary stubs for archheader and archscripts
      kconfig: rename generated .*conf-cfg to *conf-cfg

Mathias Krause (1):
      kallsyms: lower alignment on ARM

 Documentation/kbuild/makefiles.txt                |  9 ++++++---
 Kbuild                                            |  4 +---
 Makefile                                          | 22 +++++-----------------
 arch/Kconfig                                      |  1 +
 arch/alpha/include/uapi/asm/Kbuild                |  7 -------
 arch/arc/include/uapi/asm/Kbuild                  | 25
-------------------------
 arch/arm/boot/Makefile                            |  2 +-
 arch/arm/boot/compressed/Makefile                 |  2 +-
 arch/arm/include/uapi/asm/Kbuild                  | 18 ------------------
 arch/arm/kernel/jump_label.c                      |  4 ----
 arch/arm/tools/Makefile                           |  3 +--
 arch/arm64/include/uapi/asm/Kbuild                | 18 ------------------
 arch/arm64/kernel/jump_label.c                    |  4 ----
 arch/c6x/include/uapi/asm/Kbuild                  | 27
---------------------------
 arch/csky/include/uapi/asm/Kbuild                 | 27
---------------------------
 arch/h8300/include/uapi/asm/Kbuild                | 27
---------------------------
 arch/hexagon/include/uapi/asm/Kbuild              | 24 ------------------------
 arch/ia64/include/uapi/asm/Kbuild                 |  7 -------
 arch/m68k/include/uapi/asm/Kbuild                 | 20 --------------------
 arch/microblaze/include/uapi/asm/Kbuild           | 26
--------------------------
 arch/mips/include/uapi/asm/Kbuild                 |  3 ---
 arch/mips/kernel/jump_label.c                     |  4 ----
 arch/nds32/include/asm/Kbuild                     | 10 ----------
 arch/nds32/include/uapi/asm/Kbuild                | 26
--------------------------
 arch/nios2/Kconfig                                |  3 ---
 arch/nios2/include/uapi/asm/Kbuild                | 26
--------------------------
 arch/openrisc/include/uapi/asm/Kbuild             | 28
----------------------------
 arch/parisc/include/uapi/asm/Kbuild               |  7 -------
 arch/powerpc/include/asm/asm-prototypes.h         |  2 +-
 arch/powerpc/include/uapi/asm/Kbuild              |  7 -------
 arch/powerpc/kernel/jump_label.c                  |  2 --
 arch/powerpc/platforms/powernv/opal-tracepoints.c |  2 +-
 arch/powerpc/platforms/powernv/opal-wrappers.S    |  2 +-
 arch/powerpc/platforms/pseries/hvCall.S           |  4 ++--
 arch/powerpc/platforms/pseries/lpar.c             |  2 +-
 arch/riscv/include/asm/Kbuild                     | 25
-------------------------
 arch/riscv/include/uapi/asm/Kbuild                | 28
----------------------------
 arch/s390/include/uapi/asm/Kbuild                 | 16 ----------------
 arch/s390/kernel/Makefile                         |  3 ++-
 arch/s390/kernel/jump_label.c                     |  4 ----
 arch/s390/kernel/syscalls/Makefile                | 12 +++---------
 arch/s390/tools/Makefile                          |  9 +++------
 arch/sh/include/uapi/asm/Kbuild                   | 19 -------------------
 arch/sh/tools/Makefile                            |  2 +-
 arch/sparc/include/uapi/asm/Kbuild                |  3 ---
 arch/sparc/kernel/Makefile                        |  2 +-
 arch/sparc/kernel/jump_label.c                    |  4 ----
 arch/unicore32/include/uapi/asm/Kbuild            | 29
-----------------------------
 arch/x86/Makefile                                 |  2 +-
 arch/x86/boot/compressed/Makefile                 |  2 +-
 arch/x86/entry/calling.h                          |  2 +-
 arch/x86/include/asm/cpufeature.h                 |  2 +-
 arch/x86/include/asm/jump_label.h                 | 13 -------------
 arch/x86/include/asm/rmwcc.h                      |  6 +++---
 arch/x86/include/uapi/asm/Kbuild                  |  3 ---
 arch/x86/kernel/Makefile                          |  3 ++-
 arch/x86/kernel/jump_label.c                      |  4 ----
 arch/x86/kvm/emulate.c                            |  2 +-
 arch/x86/lib/Makefile                             |  2 +-
 arch/xtensa/include/uapi/asm/Kbuild               | 10 ----------
 arch/xtensa/kernel/jump_label.c                   |  4 ----
 certs/Makefile                                    |  2 +-
 firmware/Makefile                                 |  5 ++---
 include/linux/dynamic_debug.h                     |  6 +++---
 include/linux/jump_label.h                        | 22 +++++++++-------------
 include/linux/jump_label_ratelimit.h              |  8 +++-----
 include/linux/module.h                            |  2 +-
 include/linux/netfilter.h                         |  4 ++--
 include/linux/netfilter_ingress.h                 |  2 +-
 include/uapi/linux/Kbuild                         |  2 --
 init/Kconfig                                      |  3 +++
 kernel/Makefile                                   |  6 +++++-
 kernel/jump_label.c                               | 10 +++-------
 kernel/module.c                                   |  2 +-
 kernel/sched/core.c                               |  2 +-
 kernel/sched/debug.c                              |  4 ++--
 kernel/sched/fair.c                               |  6 +++---
 kernel/sched/sched.h                              |  6 +++---
 lib/dynamic_debug.c                               |  2 +-
 lib/raid6/Makefile                                |  5 ++---
 net/core/dev.c                                    |  6 +++---
 net/netfilter/core.c                              |  6 +++---
 scripts/Kbuild.include                            | 10 +++++-----
 scripts/Makefile.asm-generic                      |  4 ++++
 scripts/Makefile.headersinst                      |  7 -------
 scripts/Makefile.lib                              | 34
++++++++++++----------------------
 scripts/coccinelle/iterators/use_after_iter.cocci |  3 +++
 scripts/coccinelle/misc/boolinit.cocci            |  5 +++++
 scripts/gcc-goto.sh                               |  2 +-
 scripts/kallsyms.c                                |  4 ++--
 scripts/kconfig/.gitignore                        |  1 +
 scripts/kconfig/Makefile                          | 40
+++++++++++++++++++---------------------
 scripts/kconfig/zconf.y                           |  1 -
 tools/arch/x86/include/asm/rmwcc.h                |  6 +++---
 94 files changed, 150 insertions(+), 694 deletions(-)


-- 
Best Regards
Masahiro Yamada
