Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:40245 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751820AbdEKAnL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 May 2017 20:43:11 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 May 2017 09:43:05 +0900
Message-ID: <CAK7LNASNXiw3HqxDwdksa0EWR=QAmKScK-BqPiOGbFFvt8d8gQ@mail.gmail.com>
Subject: [GIT PULL 1/3] Kbuild updates for v4.12
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Here are Kbuild updates for v4.12.  Please pull!


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201=
:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.12

for you to fetch changes up to f55813b4d8bfc9f35fda87bc1e21b7f26835fc5c:

  kbuild: dtbinst: remove unnecessary __dtbs_install_prep target
(2017-05-08 07:26:06 +0900)


----------------------------------------------------------------
Kbuild updates for v4.12

- Improve Clang support

- Clean up various Makefiles

- Improve build log visibility (objtool, alpha, ia64)

- Improve compiler flag evaluation for better build performance

- Fix GCC version-dependent warning

- Fix genksyms

----------------------------------------------------------------

Behan Webster (2):
      kbuild: use -Oz instead of -Os when using clang
      kbuild: Add better clang cross build support

Jeroen Hofstee (1):
      kbuild: fix asm-offset generation to work with clang

Jiri Slaby (1):
      objtool: make it visible in make V=3D1 output

Kees Cook (1):
      Kbuild: make designated_init attribute fatal

Mark Charlebois (1):
      kbuild, LLVMLinux: Add -Werror to cc-option to support clang

Masahiro Yamada (10):
      Merge branch 'kbuild' of git://git.kernel.org/.../mmarek/kbuild
      kbuild: drop unneeded patterns '.*.orig' and '.*.rej' from distclean
      kbuild: avoid conflict between -ffunction-sections and -pg on gcc-4.7
      kbuild: consolidate redundant sed script ASM offset generation
      kbuild: drop -Wno-unknown-warning-option from clang options
      alpha: add $(src)/ rather than $(obj)/ to make source file path
      alpha: merge build rules of division routines
      alpha: make short build log available for division routines
      ia64: beatify build log for gate.so and gate-syms.o
      kbuild: dtbinst: remove unnecessary __dtbs_install_prep target

Matthias Kaehlcke (2):
      kbuild: Consolidate header generation from ASM offset information
      frv: Use OFFSET macro in DEF_*REG()

Michael Davidson (1):
      kbuild: clang: add -no-integrated-as to KBUILD_[AC]FLAGS

Michal Marek (2):
      genksyms: Fix segfault with invalid declarations
      genksyms: Regenerate parser

Rabin Vincent (1):
      Makefile: evaluate LDFLAGS_BUILD_ID only once

Seung-Woo Kim (1):
      Kbuild: fix file name in comment about extra gcc checks

Vin=C3=ADcius Tinti (1):
      kbuild: Add support to generate LLVM assembly files

 .gitignore                           |   1 +
 Kbuild                               |  25 ---
 Makefile                             |  41 +++--
 arch/alpha/lib/Makefile              |  11 +-
 arch/frv/kernel/asm-offsets.c        |  19 +-
 arch/ia64/kernel/Makefile            |  26 +--
 arch/ia64/kernel/Makefile.gate       |   2 +-
 include/linux/kbuild.h               |   6 +-
 scripts/Kbuild.include               |   6 +-
 scripts/Makefile.build               |  12 +-
 scripts/Makefile.dtbinst             |   8 -
 scripts/Makefile.extrawarn           |   1 -
 scripts/Makefile.lib                 |  31 ++++
 scripts/genksyms/parse.tab.c_shipped | 474
++++++++++++++++++++++++------------------------
 scripts/genksyms/parse.y             |   2 -
 scripts/mod/Makefile                 |  28 +--
 16 files changed, 324 insertions(+), 369 deletions(-)



--=20
Best Regards
Masahiro Yamada
