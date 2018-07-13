Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50152 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729751AbeGMOUw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Jul 2018 10:20:52 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 13 Jul 2018 23:05:20 +0900
Message-ID: <CAK7LNAQbXpNS-pdhUnhL7ELXArJoLCVzQhASaqTAJh0+CkwFcA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.18-rc5
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull a little more Kbuild fixes.



The following changes since commit 021c91791a5e7e85c567452f1be3e4c2c6cb6063:

  Linux 4.18-rc3 (2018-07-01 16:04:53 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.18-2

for you to fetch changes up to 6d79a7b424a5630a6fcab31fd7c38af4ea9c9a0f:

  kbuild: suppress warnings from 'getconf LFS_*' (2018-07-13 00:48:18 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.18 (2nd)

 - update Kbuild and Kconfig documents

 - sanitize -I compiler option handling

 - update extract-vmlinux script to recognize LZ4 and ZSTD

 - fix tools Makefiles

 - update tags.sh to handle __ro_after_init

 - suppress warnings in case getconf does not recognize LFS_* parameters

----------------------------------------------------------------
Adam Borowski (1):
      scripts: teach extract-vmlinux about LZ4 and ZSTD

Constantine Shulyupin (1):
      scripts/tags.sh: add __ro_after_init

Laura Abbott (2):
      tools: build: Fixup host c flags
      tools: build: Use HOSTLDFLAGS with fixdep

Masahiro Yamada (3):
      kbuild: do not drop -I without parameter
      kbuild: remove duplicated comments about PHONY
      kbuild: suppress warnings from 'getconf LFS_*'

Paul Menzel (1):
      tools build: fix # escaping in .cmd files for future Make

Randy Dunlap (5):
      kbuild: update ARCH alias info for sh
      kbuild: update ARCH alias info for sparc
      kbuild: delete INSTALL_FW_PATH from kbuild documentation
      kconfig: update user kconfig tools doc.
      kbuild: document the KBUILD_KCONFIG env. variable

Ulf Magnusson (1):
      kbuild: .PHONY is not a variable, but PHONY is

 Documentation/kbuild/kbuild.txt  | 17 ++++++--------
 Documentation/kbuild/kconfig.txt | 51 +++++++++++++++++++++++++++++++++-------
 Makefile                         |  8 +++----
 scripts/Kbuild.include           |  2 +-
 scripts/Makefile.build           |  3 ---
 scripts/Makefile.clean           |  3 ---
 scripts/Makefile.modbuiltin      |  4 ----
 scripts/Makefile.modinst         |  4 ----
 scripts/Makefile.modpost         |  4 ----
 scripts/Makefile.modsign         |  3 ---
 scripts/extract-vmlinux          |  2 ++
 scripts/tags.sh                  |  2 +-
 tools/build/Build.include        |  6 ++---
 tools/build/Makefile             |  2 +-
 tools/perf/pmu-events/Build      |  2 +-
 15 files changed, 63 insertions(+), 50 deletions(-)


-- 
Best Regards
Masahiro Yamada
