Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36677 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgGEPOO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Jul 2020 11:14:14 -0400
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 6 Jul 2020 00:13:09 +0900
Message-ID: <CAK7LNAQEMNSM2PRaTwPoX+2hn3FpU2=kQEyJdFjH2xkz+eq5gg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.8-rc4
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull some more Kbuild fixes.
Thanks.



The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.8-2

for you to fetch changes up to ba77dca584f5abf30340672bc752fe7912731af5:

  .gitignore: Do not track `defconfig` from `make savedefconfig`
(2020-07-05 16:15:46 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.8 (2nd)

 - fix various bugs in xconfig

 - fix some issues in cross-compilation using Clang

 - fix documentation

----------------------------------------------------------------
Dov Murik (1):
      docs: kbuild: fix ReST formatting

Masahiro Yamada (3):
      gcc-plugins: fix gcc-plugins directory path in documentation
      kbuild: fix CONFIG_CC_CAN_LINK(_STATIC) for cross-compilation with Clang
      kbuild: make Clang build userprogs for target architecture

Mauro Carvalho Chehab (8):
      kconfig: qconf: cleanup includes
      kconfig: qconf: make search fully work again on split mode
      kconfig: qconf: make debug links work again
      kconfig: qconf: re-implement setSelected()
      kconfig: qconf: simplify the goBack() logic
      kconfig: qconf: don't show goback button on splitMode
      kconfig: qconf: navigate menus on hyperlinks
      kconfig: qconf: parse newer types at debug info

Paul Menzel (1):
      .gitignore: Do not track `defconfig` from `make savedefconfig`

 .gitignore                                   |   3 +
 Documentation/kbuild/modules.rst             |   7 +-
 Documentation/kbuild/reproducible-builds.rst |   2 +-
 Makefile                                     |   4 +-
 init/Kconfig                                 |   8 +-
 scripts/gcc-plugins/Kconfig                  |   2 +-
 scripts/kconfig/qconf.cc                     | 173 ++++++++++++++++-----------
 scripts/kconfig/qconf.h                      |  23 ++--
 8 files changed, 136 insertions(+), 86 deletions(-)


-- 
Best Regards
Masahiro Yamada
