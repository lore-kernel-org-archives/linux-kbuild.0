Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:46256 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbeL1P7f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Dec 2018 10:59:35 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 29 Dec 2018 00:58:38 +0900
Message-ID: <CAK7LNAQzEHv7Y69xFTPDEhyMP6JX4ghb96UMqMdxYyVyah6-VA@mail.gmail.com>
Subject: [GIT PULL 1/4] Kbuild updates for v4.21
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull Kbuild updates for v4.21


You will see a conflict in the top Makefile.
The correct fix is available in linux-next.



The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.21

for you to fetch changes up to dec28d8ea2f731b7ec68a2c9421e99a165d47b57:

  kbuild: remove unused cmd_gentimeconst (2018-12-25 00:10:30 +0900)

----------------------------------------------------------------
Kbuild updates for v4.21

Kbuild core:
 - remove unneeded $(call cc-option,...) switches
 - consolidate Clang compiler flags into CLANG_FLAGS
 - announce the deprecation of SUBDIRS
 - fix single target build for external module
 - simplify the dependencies of 'prepare' stage targets
 - allow fixdep to directly write to .*.cmd files
 - simplify dependency generation for CONFIG_TRIM_UNUSED_KSYMS
 - change if_changed_rule to accept multi-line recipe
 - move .SECONDARY special target to scripts/Kbuild.include
 - remove redundant 'set -e'
 - improve parallel execution for CONFIG_HEADERS_CHECK
 - misc cleanups

Treewide fixes and cleanups
 - set Clang flags correctly for PowerPC boot images
 - fix UML build error with CONFIG_GCC_PLUGINS
 - remove unneeded patterns from .gitignore files
 - refactor firmware/Makefile
 - remove unneeded rules for *offsets.s
 - avoid unneeded regeneration of intermediate .s files
 - clean up ./Kbuild

Modpost:
 - remove unused -M, -K options
 - fix false positive warnings about section mismatch
 - use simple devtable lookup instead of linker magic
 - misc cleanups

Coccinelle:
 - relax boolinit.cocci checks for overall consistency
 - fix warning messages of boolinit.cocci

Other tools:
 - improve -dirty check of scripts/setlocalversion
 - add a tool to generate compile_commands.json from .*.cmd files

----------------------------------------------------------------
Brian Norris (1):
      scripts/setlocalversion: Improve -dirty check with git-status
--no-optional-locks

Eugen Cazacu (1):
      user/Makefile: Fix typo and capitalization in comment section

Joel Stanley (2):
      Makefile: Export clang toolchain variables
      powerpc/boot: Set target when cross-compiling for clang

Julia Lawall (2):
      scripts: coccinelle: only suggest true/false in files that
already use them
      scripts: coccinelle: Correct warning message

Masahiro Yamada (41):
      kbuild: add -no-integrated-as Clang option unconditionally
      kbuild: consolidate Clang compiler flags
      kbuild: announce removal of SUBDIRS if used
      kbuild: fix single target build for external module
      modpost: file2alias: go back to simple devtable lookup
      modpost: file2alias: check prototype of handler
      modpost: refactor seen flag clearing in add_depends()
      modpost: merge module iterations
      modpost: move unresolved symbol checks to check_exports()
      kbuild: fix UML build error with CONFIG_GCC_PLUGINS
      kbuild: move modpost out of 'scripts' target
      kbuild: make 'archprepare' depend on 'scripts'
      kbuild: descend into scripts/gcc-plugins/ via scripts/Makefile
      kbuild: let fixdep directly write to .*.cmd files
      kbuild: remove redundant 'set -e' from filechk_offsets
      kbuild: remove redundant 'set -e' from sub_cmd_record_mcount
      kbuild: refactor modversions build rules
      kbuild: simplify dependency generation for CONFIG_TRIM_UNUSED_KSYMS
      kbuild: change if_changed_rule for multi-line recipe
      kbuild: remove trailing semicolon from cmd_* passed to if_changed_rule
      kbuild: refactor if_changed
      kbuild: remove redundant 'set -e' from cmd_* defines
      kbuild: move .SECONDARY special target to Kbuild.include
      kbuild: remove a special handling for *.agh in Makefile.headersinst
      kbuild: exploit parallel building for CONFIG_HEADERS_CHECK
      kbuild: refactor Makefile.asm-generic
      kbuild: remove redundant quiet_modtag for $(obj-m)
      kbuild: refactor quiet_modtag
      kbuild: refactor part-of-module
      kbuild: handle part-of-module correctly for *.ll and *.symtypes
      kbuild: add -fno-PIE flag unconditionally
      kbuild: add -Werror=strict-prototypes flag unconditionally
      kbuild: add -Werror=implicit-int flag unconditionally
      um: remove unused filechk_gen_header in Makefile
      scripts: remove unnecessary ihex2fw and check-lc_ctypes from .gitignore
      firmware: remove unnecessary patterns from .gitignore
      firmware: refactor firmware/Makefile
      treewide: remove explicit rules for *offsets.s
      treewide: add intermediate .s files to targets
      kbuild: remove $(obj)/ prefixes in ./Kbuild
      kbuild: remove unused cmd_gentimeconst

Paul Walmsley (2):
      modpost: drop unused command line switches
      modpost: skip ELF local symbols during section mismatch check

Sami Tolvanen (1):
      modpost: validate symbol names also in find_elf_symbol

Tom Roeder (1):
      scripts: add a tool to produce a compile_commands.json file

 Documentation/kbuild/kbuild.txt        |   7 +--
 Kbuild                                 |  21 ++------
 Makefile                               | 111
+++++++++++++++++++----------------------
 arch/arm/crypto/Makefile               |   2 +-
 arch/arm/mach-at91/Makefile            |   5 +-
 arch/arm/mach-omap2/Makefile           |   5 +-
 arch/arm64/crypto/Makefile             |   2 +-
 arch/ia64/kernel/Makefile              |   7 +--
 arch/powerpc/boot/Makefile             |   5 ++
 arch/um/Makefile                       |  26 +---------
 arch/x86/um/Makefile                   |   5 +-
 drivers/memory/Makefile.asm-offsets    |   5 +-
 drivers/mtd/maps/scx200_docflash.c     |   7 ---
 drivers/watchdog/scx200_wdt.c          |   7 ---
 firmware/.gitignore                    |   5 --
 firmware/Makefile                      |  84 ++++++++++++-------------------
 include/asm-generic/export.h           |  13 +++--
 include/linux/export.h                 |  18 +++----
 samples/bpf/Makefile                   |   4 +-
 samples/connector/Makefile             |   2 +-
 scripts/.gitignore                     |   2 -
 scripts/Kbuild.include                 |  52 ++++---------------
 scripts/Makefile                       |   4 +-
 scripts/Makefile.asm-generic           |  37 +++++++-------
 scripts/Makefile.build                 | 128
++++++++++++++++++-----------------------------
 scripts/Makefile.gcc-plugins           |   8 ---
 scripts/Makefile.headersinst           |   1 -
 scripts/Makefile.lib                   |   2 +-
 scripts/basic/fixdep.c                 |  31 ++----------
 scripts/coccinelle/misc/boolinit.cocci |  43 ++++++++++------
 scripts/gen_compile_commands.py        | 151
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/gen_ksymdeps.sh                |  25 ++++++++++
 scripts/mod/Makefile                   |   2 -
 scripts/mod/file2alias.c               | 149
+++++++++++++++++++------------------------------------
 scripts/mod/modpost.c                  | 114
+++++++++++++++++++++++-------------------
 scripts/package/Makefile               |   1 -
 scripts/setlocalversion                |  12 ++++-
 usr/Makefile                           |   4 +-
 38 files changed, 543 insertions(+), 564 deletions(-)
 create mode 100755 scripts/gen_compile_commands.py
 create mode 100755 scripts/gen_ksymdeps.sh


--
Best Regards
Masahiro Yamada
