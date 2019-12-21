Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37587 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbfLUPh6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Dec 2019 10:37:58 -0500
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 22 Dec 2019 00:37:03 +0900
Message-ID: <CAK7LNAQG3Tp=q8XWABfopHgQ8nTa2OhKf=msy0m6SbgcyS67OQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.5-rc3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull some Kbuild fixes.
Thanks.


The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.5

for you to fetch changes up to 28f94a44298c99c0db85539874b62f21d94fcaa7:

  kbuild: clarify the difference between obj-y and obj-m w.r.t.
descending (2019-12-22 00:25:35 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.5

 - fix warning in out-of-tree 'make clean'

 - add READELF variable to the top Makefile

 - fix broken builds when LINUX_COMPILE_BY contains a backslash

 - fix build warning in kallsyms

 - fix NULL pointer access in expr_eq() in Kconfig

 - fix missing dependency on rsync in deb-pkg build

 - remove ---help--- from documentation

 - fix misleading documentation about directory descending

----------------------------------------------------------------
Dmitry Golovin (1):
      x86/boot: kbuild: allow readelf executable to be specified

Enrico Weigelt, metux IT consult (1):
      scripts: package: mkdebian: add missing rsync dependency

Masahiro Yamada (6):
      kbuild: fix 'No such file or directory' warning when cleaning
      mkcompile_h: git rid of UTS_TRUNCATE from LINUX_COMPILE_{BY,HOST}
      mkcompile_h: use printf for LINUX_COMPILE_BY
      scripts/kallsyms: fix offset overflow of kallsyms_relative_base
      kconfig: remove ---help--- from documentation
      kbuild: clarify the difference between obj-y and obj-m w.r.t. descending

Thomas Hebb (1):
      kconfig: don't crash on NULL expressions in expr_eq()

 Documentation/kbuild/kconfig-language.rst |  5 +---
 Documentation/kbuild/makefiles.rst        | 16 ++++++++++---
 Makefile                                  |  3 ++-
 arch/x86/boot/compressed/Makefile         |  2 +-
 scripts/kallsyms.c                        | 38 +++++++++++++++----------------
 scripts/kconfig/expr.c                    |  7 ++++++
 scripts/mkcompile_h                       | 10 ++++----
 scripts/package/mkdebian                  |  2 +-
 usr/include/Makefile                      |  2 +-
 9 files changed, 48 insertions(+), 37 deletions(-)

--
Best Regards
Masahiro Yamada
