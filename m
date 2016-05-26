Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56123 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754390AbcEZUdq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 May 2016 16:33:46 -0400
Date: Thu, 26 May 2016 22:33:46 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild updates for v4.7-rc1
Message-ID: <20160526203346.GA4734@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: arnd@arndb.de, mmarek@suse.com, mussitantesmortem@gmail.com, nicolas.ferre@atmel.com, nicolas.pitre@linaro.org, robert.jarzmik@free.fr, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kbuild changes for v4.7-rc1:
- New option CONFIG_TRIM_UNUSED_KSYMS which does a two-pass build and
  unexports symbols which are not used in the current config [Nicolas
  Pitre]
- Several kbuild rule cleanups [Masahiro Yamada]
- Warning option adjustments for gcov etc [Arnd Bergmann]
- A few more small fixes

Thanks,
Michal

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to c9c6837d39311b0cc14cdbe7c18e815ab44aefb1:

  kbuild: move -Wunused-const-variable to W=1 warning level (2016-05-11 13:05:40 +0200)

----------------------------------------------------------------
Arnd Bergmann (6):
      Kbuild: change CC_OPTIMIZE_FOR_SIZE definition
      Kbuild: disable 'maybe-uninitialized' warning for CONFIG_PROFILE_ALL_BRANCHES
      gcov: disable for COMPILE_TEST
      gcov: disable tree-loop-im to reduce stack usage
      gcov: disable -Wmaybe-uninitialized warning
      kbuild: move -Wunused-const-variable to W=1 warning level

Masahiro Yamada (8):
      kbuild: drop FORCE from PHONY targets
      kbuild: specify modules(_install) as PHONY rather than FORCE
      kbuild: mark help target as PHONY
      kbuild: delete unnecessary "@:"
      kbuild: drop redundant "PHONY += FORCE"
      kbuild: rename cmd_cc_i_c to cmd_cpp_i_c
      kbuild: rename cmd_as_s_S to cmd_cpp_s_S
      kbuild: fix if_change and friends to consider argument order

Maxim Zhukov (1):
      scripts: genksyms: fix resource leak

Michal Marek (1):
      kbuild: Get rid of KBUILD_STR

Nicolas Ferre (1):
      kbuild: fix call to adjust_autoksyms.sh when output directory specified

Nicolas Pitre (13):
      kbuild: record needed exported symbols for modules
      export.h: allow for per-symbol configurable EXPORT_SYMBOL()
      fixdep: accept extra dependencies on stdin
      kbuild: de-duplicate fixdep usage
      kbuild: add fine grained build dependencies for exported symbols
      kbuild: create/adjust generated/autoksyms.h
      kbuild: build sample modules along with the rest of the kernel
      kconfig option for TRIM_UNUSED_KSYMS
      kbuild: better abstract vmlinux sequential prerequisites
      kbuild: Fix dependencies for final vmlinux link
      kbuild: adjust ksym_dep_filter for some cmd_* renames
      kbuild: fix ksym_dep_filter when multiple EXPORT_SYMBOL() on the same line
      kbuild: fix adjust_autoksyms.sh for modules that need only one symbol

Robert Jarzmik (1):
      kbuild: forbid kernel directory to contain spaces and colons

 Makefile                                |  66 +++++++++++++++------
 arch/arm/boot/Makefile                  |   1 -
 arch/arm/boot/bootp/Makefile            |   3 +-
 arch/arm/vdso/Makefile                  |   2 +-
 arch/h8300/boot/compressed/Makefile     |   1 -
 arch/ia64/Makefile                      |   6 +-
 arch/m32r/boot/compressed/Makefile      |   1 -
 arch/mn10300/boot/compressed/Makefile   |   1 -
 arch/nios2/boot/compressed/Makefile     |   1 -
 arch/s390/boot/compressed/Makefile      |   1 -
 arch/sh/boot/compressed/Makefile        |   1 -
 arch/sh/boot/romimage/Makefile          |   1 -
 arch/unicore32/boot/Makefile            |   2 +-
 arch/unicore32/boot/compressed/Makefile |   1 -
 arch/x86/boot/compressed/Makefile       |   1 -
 arch/x86/entry/vdso/Makefile            |   4 +-
 arch/x86/purgatory/Makefile             |   2 -
 arch/x86/realmode/rm/Makefile           |   1 -
 include/linux/export.h                  |  33 ++++++++++-
 init/Kconfig                            |  29 +++++++++
 kernel/gcov/Kconfig                     |   1 +
 scripts/Kbuild.include                  |  45 +++++++++++---
 scripts/Makefile.build                  |  44 +++++++-------
 scripts/Makefile.extrawarn              |   1 +
 scripts/Makefile.lib                    |   8 +--
 scripts/adjust_autoksyms.sh             | 101 ++++++++++++++++++++++++++++++++
 scripts/basic/fixdep.c                  |  61 ++++++++++++++-----
 scripts/genksyms/genksyms.c             |   3 +
 tools/build/Makefile.build              |   8 +--
 29 files changed, 335 insertions(+), 95 deletions(-)
 create mode 100755 scripts/adjust_autoksyms.sh
