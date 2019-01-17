Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:29325 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfAQOsg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 09:48:36 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 17 Jan 2019 23:47:55 +0900
Message-ID: <CAK7LNAS1ZHH6DdB5wvyBA3m2HFrnY6GRmQG+OX_Pd7t9CyJ6nQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.0-rc3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks!

The following changes since commit 1c7fc5cbc33980acd13d668f1c8f0313d6ae9fd8:

  Linux 5.0-rc2 (2019-01-14 10:41:12 +1200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.0

for you to fetch changes up to e00d8880481497474792d28c14479a9fb6752046:

  kbuild: mark prepare0 as PHONY to fix external module build
(2019-01-17 23:42:59 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.0

 - clean generated files in scripts/kconfig/ by 'make mrproper'

 - fix conflict between dead code elimination and ftrace for GCC <= 4.7

 - fix external module build with CONFIG_STACKPROTECTOR

 - remove unused code

----------------------------------------------------------------
Masahiro Yamada (7):
      kconfig: clean generated *conf-cfg files
      kbuild: remove unused baseprereq
      kbuild: remove unused archmrproper
      ia64: remove redundant 'export AWK'
      nds32: remove unneeded code in arch/nds32/Makefile
      openrisc: remove unneeded code in arch/openrisc/Makefile
      kbuild: mark prepare0 as PHONY to fix external module build

Paul Burton (1):
      kbuild: Disable LD_DEAD_CODE_DATA_ELIMINATION with ftrace & GCC <= 4.7

 Makefile                 | 8 ++++----
 arch/h8300/Makefile      | 2 --
 arch/ia64/Makefile       | 2 --
 arch/nds32/Makefile      | 8 --------
 arch/openrisc/Makefile   | 3 ---
 init/Kconfig             | 1 +
 scripts/Kbuild.include   | 4 ----
 scripts/kconfig/Makefile | 2 +-
 8 files changed, 6 insertions(+), 24 deletions(-)


-- 
Best Regards
Masahiro Yamada
