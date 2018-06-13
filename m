Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:48039 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935691AbeFMOrd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 10:47:33 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 13 Jun 2018 23:46:31 +0900
Message-ID: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for 4.18 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull more Kbuild updates.  Thanks!



The following changes since commit c90fca951e90ba470a3dc6087667edffcf8db21b:

  Merge tag 'powerpc-4.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
(2018-06-07 10:23:33 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.18-2

for you to fetch changes up to 00979ce4fcc90d488c7f27f750097adc6b11bd07:

  linux/linkage.h: replace VMLINUX_SYMBOL_STR() with __stringify()
(2018-06-13 00:03:17 +0900)

----------------------------------------------------------------
Kbuild updates for v4.18 (2nd)

 - fix some bugs introduced by the recent Kconfig syntax extension

 - add some symbols about compiler information in Kconfig, such as
   CC_IS_GCC, CC_IS_CLANG, GCC_VERSION, etc.

 - test compiler capability for the stack protector in Kconfig, and
   clean-up Makefile

 - test compiler capability for GCC-plugins in Kconfig, and clean-up
   Makefile

 - allow to enable GCC-plugins for COMPILE_TEST

 - test compiler capability for KCOV in Kconfig and correct dependency

 - remove auto-detect mode of the GCOV format, which is now more nicely
   handled in Kconfig

 - test compiler capability for mprofile-kernel on PowerPC, and
   clean-up Makefile

 - misc cleanups

----------------------------------------------------------------
Masahiro Yamada (14):
      kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE
      stack-protector: test compiler capability in Kconfig and drop AUTO mode
      kconfig: add CC_IS_GCC and GCC_VERSION
      kconfig: add CC_IS_CLANG and CLANG_VERSION
      arm64: move GCC version check for ARCH_SUPPORTS_INT128 to Kconfig
      gcov: remove CONFIG_GCOV_FORMAT_AUTODETECT
      kcov: test compiler capability in Kconfig and correct dependency
      gcc-plugins: move GCC version check for PowerPC to Kconfig
      gcc-plugins: test plugin support in Kconfig and clean up Makefile
      gcc-plugins: allow to enable GCC_PLUGINS for COMPILE_TEST
      gcc-plugins: disable GCC_PLUGIN_STRUCTLEAK_BYREF_ALL for COMPILE_TEST
      Documentation: kconfig: add recommended way to describe compiler support
      sh: remove no-op macro VMLINUX_SYMBOL()
      linux/linkage.h: replace VMLINUX_SYMBOL_STR() with __stringify()

Nicholas Piggin (1):
      powerpc/kbuild: move -mprofile-kernel check to Kconfig

Sam Ravnborg (1):
      kconfig: fix localmodconfig

 Documentation/kbuild/kconfig-language.txt       |  18 +++
 Makefile                                        | 147 +++++----------------
 arch/Kconfig                                    |  50 +++----
 arch/arm64/Kconfig                              |   1 +
 arch/arm64/Makefile                             |   6 -
 arch/powerpc/Kconfig                            |  18 +--
 arch/powerpc/Makefile                           |  13 +-
 arch/powerpc/include/asm/module.h               |   2 +-
 arch/powerpc/kernel/module_64.c                 |   4 +-
 arch/powerpc/kernel/trace/ftrace.c              |   6 +-
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh |   1 -
 arch/sh/include/asm/vmlinux.lds.h               |   4 +-
 arch/x86/Kconfig                                |  11 +-
 include/linux/linkage.h                         |  12 +-
 init/Kconfig                                    |  15 +++
 kernel/gcov/Kconfig                             |  17 +--
 kernel/gcov/Makefile                            |   2 -
 lib/Kconfig.debug                               |  11 +-
 scripts/Kconfig.include                         |   3 +
 scripts/Makefile.gcc-plugins                    |  91 +++----------
 scripts/Makefile.kcov                           |  10 +-
 scripts/clang-version.sh                        |  18 +--
 scripts/gcc-plugins/Makefile                    |   5 +-
 scripts/gcc-x86_32-has-stack-protector.sh       |   7 +-
 scripts/gcc-x86_64-has-stack-protector.sh       |   5 -
 scripts/kconfig/streamline_config.pl            |   4 +-
 26 files changed, 173 insertions(+), 308 deletions(-)


-- 
Best Regards
Masahiro Yamada
