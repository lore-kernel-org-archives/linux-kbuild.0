Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47221 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfJEIWT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Oct 2019 04:22:19 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 5 Oct 2019 17:21:15 +0900
Message-ID: <CAK7LNATpmqt57w9m1keLKu4Y0zbvWjJX8SWqKC6b6mj-23Y0xg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.4-rc2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull Kbuild fixes for v5.4-rc2.
Thanks.



The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.4

for you to fetch changes up to 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226:

  kheaders: make headers archive reproducible (2019-10-05 15:29:49 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.4

 - remove unneeded ar-option and KBUILD_ARFLAGS

 - remove long-deprecated SUBDIRS

 - fix modpost to suppress false-positive warnings for UML builds

 - fix namespace.pl to handle relative paths to ${objtree}, ${srctree}

 - make setlocalversion work for /bin/sh

 - make header archive reproducible

 - fix some Makefiles and documents

----------------------------------------------------------------
Alex Gaynor (1):
      kbuild: correct formatting of header in kbuild module docs

Dmitry Goldin (1):
      kheaders: make headers archive reproducible

Jacob Keller (1):
      namespace: fix namespace.pl script to support relative paths

Masahiro Yamada (10):
      kbuild: remove ar-option and KBUILD_ARFLAGS
      kbuild: remove SUBDIRS support
      modpost: fix static EXPORT_SYMBOL warnings for UML build
      integrity: remove unneeded, broken attempt to add -fshort-wchar
      integrity: remove pointless subdir-$(CONFIG_...)
      video/logo: remove unneeded *.o pattern from clean-files
      video/logo: do not generate unneeded logo C files
      scripts/setlocalversion: clear local variable to make it work for sh
      kbuild: two minor updates for Documentation/kbuild/modules.rst
      kbuild: update compile-test header list for v5.4-rc2

 Documentation/kbuild/makefiles.rst           |  5 -----
 Documentation/kbuild/modules.rst             |  7 +++---
 Documentation/kbuild/reproducible-builds.rst | 13 +++++++----
 Makefile                                     | 24 ++-------------------
 arch/powerpc/boot/Makefile                   |  2 +-
 drivers/video/logo/Makefile                  | 21 ++----------------
 kernel/gen_kheaders.sh                       |  5 ++++-
 scripts/Kbuild.include                       |  5 -----
 scripts/Makefile.build                       |  2 +-
 scripts/Makefile.lib                         |  2 +-
 scripts/mod/modpost.c                        | 13 +++++++----
 scripts/namespace.pl                         | 13 +++++------
 scripts/setlocalversion                      |  2 +-
 security/integrity/Makefile                  |  3 ---
 usr/include/Makefile                         | 10 ---------
 15 files changed, 41 insertions(+), 86 deletions(-)


-- 
Best Regards
Masahiro Yamada
