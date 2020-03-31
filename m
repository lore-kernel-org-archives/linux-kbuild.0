Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53914 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgCaQ3A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 12:29:00 -0400
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 1 Apr 2020 01:28:16 +0900
Message-ID: <CAK7LNAT=8t1eGQb=NFrQhoCemTqTiNm6b2N66wo87sUAY5xJeg@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v5.7-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull Kbuild updates for v5.7-rc1.

(This the first batch.
I will send one more pull request next week, as you know,
we have CONFIG_AS_* cleanups queued up in linux-next.)

You will see a trivial merge conflict in
Documentation/kbuild/index.rst,
which is resolved in linux-next.



The following changes since commit 98d54f81e36ba3bf92172791eba5ca5bd813989b:

  Linux 5.6-rc4 (2020-03-01 16:38:46 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.7

for you to fetch changes up to e51d8dacf2724ebb8eda8ec69dd81da4f70a4213:

  Makefile: Update kselftest help information (2020-04-01 01:05:04 +0900)

----------------------------------------------------------------
Kbuild updates for v5.7

[Build system]

 - add CONFIG_UNUSED_KSYMS_WHITELIST, which will be useful to define
   a fixed set of export symbols for Generic Kernel Image (GKI)

 - allow to run 'make dt_binding_check' without .config

 - use full schema for checking DT examples in *.yaml files

 - make modpost fail for missing MODULE_IMPORT_NS(), which makes more
   sense because we know the produced modules are never loadable

 - Remove unused 'AS' variable

[Kconfig]

 - sanitize DEFCONFIG_LIST, and remove ARCH_DEFCONFIG from Kconfig files

 - relax the 'imply' behavior so that symbols implied by y can become m

 - make 'imply' obey 'depends on' in order to make 'imply' really weak

[Misc]

 - add documentation on building the kernel with Clang/LLVM

 - revive __HAVE_ARCH_STRLEN for 32bit sparc to use optimized strlen()

 - fix warning from deb-pkg builds when CONFIG_DEBUG_INFO=n

 - various script and Makefile cleanups

----------------------------------------------------------------
David Engraf (1):
      kbuild: add outputmakefile to no-dot-config-targets

Jessica Yu (2):
      modpost: rework and consolidate logging interface
      modpost: return error if module is missing ns imports and
MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=n

Masahiro Yamada (22):
      kbuild: remove the owner check in mkcompile_h
      kbuild: remove cc-option switch from -Wframe-larger-than=
      fixdep: remove unneeded code and comments about *.ver files
      fixdep: remove redundant null character check
      kbuild: remove trailing slash from devicetree/binding/ for descending
      kbuild: use KBUILD_DEFCONFIG as the fallback for DEFCONFIG_LIST
      kbuild: avoid concurrency issue in parallel building dtbs and dtbs_check
      kbuild: allow to run dt_binding_check and dtbs_check in a single command
      kbuild: allow to run dt_binding_check without kernel configuration
      net: drop_monitor: use IS_REACHABLE() to guard net_dm_hw_report()
      kconfig: allow symbols implied by y to become m
      kconfig: make 'imply' obey the direct dependency
      kbuild: compute the dtbs_install destination more simply
      kbuild: refactor Makefile.dtbinst more
      sparc: revive __HAVE_ARCH_STRLEN for 32bit sparc
      kconfig: remove unused variable in qconf.cc
      kbuild: add -Wall to KBUILD_HOSTCXXFLAGS
      kbuild: add comment about grouped target
      net: wan: wanxl: use allow to pass CROSS_COMPILE_M68k for
rebuilding firmware
      net: wan: wanxl: use $(M68KCC) instead of $(M68KAS) for
rebuilding firmware
      net: wan: wanxl: refactor the firmware rebuild rule
      kbuild: remove AS variable

Nick Desaulniers (1):
      Documentation/llvm: add documentation on building w/ Clang/LLVM

Quentin Perret (3):
      kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
      kbuild: split adjust_autoksyms.sh in two parts
      kbuild: generate autoksyms.h early

Reinhard Karcher (1):
      kbuild: deb-pkg: fix warning when CONFIG_DEBUG_INFO is unset

Rob Herring (2):
      kbuild: Always validate DT binding examples
      kbuild: Build DT binding examples with dtc warnings enabled

Sergei Trofimovich (1):
      Makefile: disallow data races on gcc-10 as well

Shuah Khan (1):
      Makefile: Update kselftest help information

 Documentation/Makefile                       |  3 +-
 Documentation/devicetree/bindings/.gitignore |  2 +-
 Documentation/devicetree/bindings/Makefile   | 32 +++++++++------
 Documentation/devicetree/writing-schema.rst  |  4 ++
 Documentation/kbuild/index.rst               |  1 +
 Documentation/kbuild/kconfig-language.rst    | 27 +++++++++++--
 Documentation/kbuild/llvm.rst                | 80
+++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                  |  1 +
 Makefile                                     | 55 +++++++++++++++++---------
 arch/sh/Kconfig                              |  5 ---
 arch/sparc/Kconfig                           |  5 ---
 arch/sparc/include/asm/string.h              |  4 ++
 arch/sparc/include/asm/string_64.h           |  4 --
 arch/x86/Kconfig                             |  5 ---
 arch/x86/um/Kconfig                          |  5 ---
 drivers/net/wan/Kconfig                      |  2 +-
 drivers/net/wan/Makefile                     | 35 +++++++++++------
 include/net/drop_monitor.h                   |  2 +-
 init/Kconfig                                 | 16 +++++++-
 lib/Kconfig.debug                            |  3 +-
 scripts/Makefile.dtbinst                     | 26 ++++++------
 scripts/Makefile.lib                         |  3 +-
 scripts/Makefile.modpost                     | 15 +++----
 scripts/adjust_autoksyms.sh                  | 24 ++---------
 scripts/basic/fixdep.c                       | 10 +----
 scripts/dtc/Makefile                         |  5 ++-
 scripts/gcc-plugins/Makefile                 |  2 +-
 scripts/gen_autoksyms.sh                     | 52 ++++++++++++++++++++++++
 scripts/kconfig/Makefile                     |  4 --
 scripts/kconfig/qconf.cc                     |  2 -
 scripts/kconfig/symbol.c                     |  9 ++---
 scripts/mkcompile_h                          | 11 ------
 scripts/mod/modpost.c                        | 83
+++++++++++++++++++--------------------
 scripts/mod/modpost.h                        | 14 +++++--
 scripts/package/mkdebian                     |  5 +++
 35 files changed, 356 insertions(+), 200 deletions(-)
 create mode 100644 Documentation/kbuild/llvm.rst
 create mode 100755 scripts/gen_autoksyms.sh


-- 
Best Regards
Masahiro Yamada
