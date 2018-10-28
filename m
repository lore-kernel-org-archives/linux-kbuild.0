Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60589 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbeJ2B57 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Oct 2018 21:57:59 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Oct 2018 02:12:01 +0900
Message-ID: <CAK7LNASZO0gOaLG2kmiAMaCQe3NYNsvW4FVm4sn5ESdRK5CDNA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v4.20
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull Kbuild updates for v4.20

Thanks!



The following changes since commit 11da3a7f84f19c26da6f86af878298694ede0804:

  Linux 4.19-rc3 (2018-09-09 17:26:43 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.20

for you to fetch changes up to c2b1a9226fe7c1cee8f0ae42496f3eb282d73ebb:

  modpost: Create macro to avoid variable shadowing (2018-10-29 00:41:41 +0900)

----------------------------------------------------------------
Kbuild updates for v4.20

- optimize kallsyms slightly

- remove check for old CFLAGS usage

- add some compiler flags unconditionally instead of evaluating
  $(call cc-option,...)

- fix variable shadowing in host tools

- refactor scripts/mkmakefile

- refactor various makefiles

----------------------------------------------------------------
Jan Beulich (1):
      kallsyms: reduce size a little on 64-bit

Leonardo Bras (2):
      ASN.1: Remove unnecessary shadowed local variable
      modpost: Create macro to avoid variable shadowing

Masahiro Yamada (16):
      kallsyms: remove left-over Blackfin code
      kbuild: prefix Makefile.dtbinst path with $(srctree) unconditionally
      kbuild: remove old check for CFLAGS use
      kbuild: hide most of targets when running config or mixed targets
      kbuild: remove dead code in cmd_files calculation in top Makefile
      kbuild: add --include-dir flag only for out-of-tree build
      kbuild: remove VERSION and PATCHLEVEL from $(objtree)/Makefile
      kbuild: remove user ID check in scripts/mkmakefile
      kbuild: do not pass $(objtree) to scripts/mkmakefile
      kbuild: simplify command line creation in scripts/mkmakefile
      modpost: remove leftover symbol prefix handling for module device table
      kbuild: add -Wno-pointer-sign flag unconditionally
      kbuild: add -Wdeclaration-after-statement flag unconditionally
      kbuild: add -Wno-unused-but-set-variable flag unconditionally
      kbuild: remove unneeded link_multi_deps
      kbuild: use 'else ifeq' for checksrc to improve readability

 Makefile                 | 31 +++++++++++++++++--------------
 kernel/kallsyms.c        |  4 ++--
 scripts/Kbuild.include   |  2 +-
 scripts/Makefile.build   | 44 ++++++++------------------------------------
 scripts/asn1_compiler.c  |  2 +-
 scripts/kallsyms.c       |  6 ++----
 scripts/mkmakefile       | 22 ++++------------------
 scripts/mod/file2alias.c | 26 ++++++++++++++++++--------
 8 files changed, 53 insertions(+), 84 deletions(-)


-- 
Best Regards
Masahiro Yamada
