Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60679 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbfC2ONW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Mar 2019 10:13:22 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 29 Mar 2019 23:12:30 +0900
Message-ID: <CAK7LNATH0b3ANTYa59b+AqY73LKON0=Xr73NgZGuJbWYgYDSDA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.1-rc3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: masahiroy@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull some Kbuild fixes.
Thanks.


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.1

for you to fetch changes up to 9c38f1f044080392603c497ecca4d7d09876ff99:

  kconfig/[mn]conf: handle backspace (^H) key (2019-03-29 22:48:01 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.1

 - Remove harmful -Oz option of Clang

 - Get back the original behavior (no recursion for in-tree build)
   for GNU Make 4.x

 - Some minor fixes for coccinelle patches

 - Do not overwrite .gitignore in the output directory in case
   it is version-controlled

 - Fix missed record-mcount bug for dynamic ftrace

 - Fix endianness bug in modversions for relative CRC

 - Cater to '^H' key code in Kconfig ncurses programs

----------------------------------------------------------------
Changbin Du (1):
      kconfig/[mn]conf: handle backspace (^H) key

Fredrik Noring (1):
      kbuild: modversions: Fix relative CRC byte order interpretation

Joe Lawrence (1):
      kbuild: strip whitespace in cmd_record_mcount findstring

Masahiro Yamada (3):
      kbuild: skip sub-make for in-tree build with GNU Make 4.x
      kbuild: skip parsing pre sub-make code for recursion
      kbuild: do not overwrite .gitignore in output directory

Matthias Kaehlcke (1):
      Revert "kbuild: use -Oz instead of -Os when using clang"

Michael Stefaniuc (1):
      scripts: coccinelle: Fix description of badty.cocci

Wen Yang (1):
      coccinelle: put_device: reduce false positives

 Makefile                                 | 43
+++++++++++++++++++++------------------
 scripts/Makefile.build                   |  7 ++-----
 scripts/coccinelle/free/put_device.cocci |  1 +
 scripts/coccinelle/misc/badty.cocci      |  2 +-
 scripts/kconfig/lxdialog/inputbox.c      |  3 ++-
 scripts/kconfig/nconf.c                  |  2 +-
 scripts/kconfig/nconf.gui.c              |  3 ++-
 scripts/mod/modpost.c                    |  2 +-
 8 files changed, 33 insertions(+), 30 deletions(-)


-- 
Best Regards
Masahiro Yamada
