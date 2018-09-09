Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:54124 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbeIILwN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Sep 2018 07:52:13 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 9 Sep 2018 16:02:50 +0900
Message-ID: <CAK7LNAT7fEjvbBTQVHvK3k5qF6K61_k+g-TNLHjspKX2C_B7hA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.19-rc3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull some Kbuild fixes.

Thanks!




The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.19

for you to fetch changes up to f0b0d88a825149ef3b06656886bc211c71dcb852:

  kbuild: modules_install: warn when missing System.map file
(2018-09-09 09:14:07 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.19

 - make setlocalversion more robust about -dirty check

 - loosen the pkg-config requirement for Kconfig

 - change missing depmod to a warning from an error

 - warn modules_install when System.map is missing

----------------------------------------------------------------
Genki Sky (1):
      scripts/setlocalversion: git: Make -dirty check more robust

Lukas Bulwahn (1):
      kconfig: remove a spurious self-assignment

Masahiro Yamada (1):
      kconfig: do not require pkg-config on make {menu,n}config

Randy Dunlap (2):
      kbuild: make missing $DEPMOD a Warning instead of an Error
      kbuild: modules_install: warn when missing System.map file

 Documentation/process/changes.rst  |  2 +-
 scripts/depmod.sh                  |  5 +++--
 scripts/kconfig/Makefile           |  1 -
 scripts/kconfig/check-pkgconfig.sh |  8 --------
 scripts/kconfig/gconf-cfg.sh       |  7 +++++++
 scripts/kconfig/mconf-cfg.sh       | 25 ++++++++++++++-----------
 scripts/kconfig/mconf.c            |  1 -
 scripts/kconfig/nconf-cfg.sh       | 25 ++++++++++++++-----------
 scripts/kconfig/qconf-cfg.sh       |  7 +++++++
 scripts/setlocalversion            |  2 +-
 10 files changed, 47 insertions(+), 36 deletions(-)
 delete mode 100644 scripts/kconfig/check-pkgconfig.sh


-- 
Best Regards
Masahiro Yamada
