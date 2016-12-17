Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prg-ext-pat.suse.com ([213.151.95.130]:34048 "EHLO linux.suse"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752695AbcLQWIH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Dec 2016 17:08:07 -0500
Date: Sat, 17 Dec 2016 22:57:52 +0100
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild updates for v4.10-rc1
Message-ID: <20161217215752.GA8741@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ard.biesheuvel@linaro.org, kilobyte@angband.pl, mmarek@suse.com, nicolas.pitre@linaro.org, npiggin@gmail.com, u.kleine-koenig@pengutronix.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kbuild updates for v4.10-rc1:
- Prototypes for x86 asm-exported symbols (Adam Borowski) and a warning
  about missing CRCs (Nick Piggin)
- asm-exports fix for LTO (Nicolas Pitre)
- Thin archives improvements (Nick Piggin)
- Linker script fix for CONFIG_LD_DEAD_CODE_DATA_ELIMINATION (Nick
  Piggin)
- genksyms support for __builtin_va_list keyword
- misc minor fixes

Michal

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to 334bb773876403eae3457d81be0b8ea70f8e4ccc:

  x86/kbuild: enable modversions for symbols exported from asm (2016-12-14 00:35:35 +0100)

----------------------------------------------------------------
Adam Borowski (1):
      x86/kbuild: enable modversions for symbols exported from asm

Ard Biesheuvel (1):
      scripts/kallsyms: remove last remnants of --page-offset option

Michal Marek (1):
      genksyms: Regenerate parser

Nicholas Piggin (7):
      kbuild: kallsyms allow 3-pass generation if symbols size has changed
      kbuild: thin archives for multi-y targets
      kbuild/genksyms: handle va_list type
      kbuild: improve linker compatibility with lib-ksyms.o build
      kbuild: keep data tables through dead code elimination
      kbuild: modpost warn if export version crc is missing
      kbuild: minor improvement for thin archives build

Nicolas Pitre (2):
      kbuild: cmd_export_list: tighten the sed script
      kbuild: fix scripts/adjust_autoksyms.sh* for the no modules case

Uwe Kleine-König (1):
      make use of make variable CURDIR instead of calling pwd

 arch/x86/include/asm/asm-prototypes.h      |  16 +
 include/asm-generic/asm-prototypes.h       |   7 +
 include/asm-generic/vmlinux.lds.h          |  68 +--
 samples/bpf/Makefile                       |   4 +-
 samples/connector/Makefile                 |   2 +-
 scripts/Makefile.build                     |  17 +-
 scripts/adjust_autoksyms.sh                |   1 +
 scripts/genksyms/keywords.gperf            |   1 +
 scripts/genksyms/keywords.hash.c_shipped   |  59 +--
 scripts/genksyms/parse.tab.c_shipped       | 676 +++++++++++++++--------------
 scripts/genksyms/parse.tab.h_shipped       |  33 +-
 scripts/genksyms/parse.y                   |   2 +
 scripts/kallsyms.c                         |   1 -
 scripts/link-vmlinux.sh                    |  37 +-
 scripts/mod/modpost.c                      |   6 +
 tools/build/Makefile                       |   2 +-
 tools/gpio/Makefile                        |   2 +-
 tools/lib/api/Makefile                     |   2 +-
 tools/lib/bpf/Makefile                     |   2 +-
 tools/lib/lockdep/Makefile                 |   2 +-
 tools/lib/subcmd/Makefile                  |   2 +-
 tools/lib/traceevent/Makefile              |   2 +-
 tools/objtool/Makefile                     |   4 +-
 tools/perf/Makefile.perf                   |   2 +-
 tools/perf/tests/make                      |   2 +-
 tools/power/cpupower/Makefile              |   3 -
 tools/power/cpupower/debug/kernel/Makefile |   3 +-
 27 files changed, 503 insertions(+), 455 deletions(-)
 create mode 100644 arch/x86/include/asm/asm-prototypes.h
 create mode 100644 include/asm-generic/asm-prototypes.h
