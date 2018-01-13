Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18638 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754891AbeAMNG0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jan 2018 08:06:26 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 13 Jan 2018 22:05:39 +0900
Message-ID: <CAK7LNAQN2sCLNVqOo2_6Aei226+rmm7qGmb9q7gGteRN8rsiqQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.15-rc8
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Here are some Kbuild fixes for v4.15.
Please pull!


The following changes since commit ae64f9bd1d3621b5e60d7363bc20afb46aede215:

  Linux 4.15-rc2 (2017-12-03 11:01:47 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.15

for you to fetch changes up to 36c1681678b507346e7397a235a7303dad665fc3:

  genksyms: drop *.hash.c from .gitignore (2018-01-13 21:50:13 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.15

- fix cross-compilation for architectures that setup CROSS_COMPILE
  in their arch Makefile

- fix Kconfig rational operators for bool / tristate

- drop a gperf-generated file from .gitignore

----------------------------------------------------------------
Masahiro Yamada (2):
      kbuild: move cc-option and cc-disable-warning after incl. arch Makefile
      genksyms: drop *.hash.c from .gitignore

Nicolas Pitre (1):
      kconfig: fix relational operators for bool and tristate symbols

 Documentation/kbuild/kconfig-language.txt | 23 ++++++++++------
 Makefile                                  | 43 ++++++++++++++++--------------
 scripts/genksyms/.gitignore               |  1 -
 scripts/kconfig/expr.c                    |  5 +++-
 4 files changed, 42 insertions(+), 30 deletions(-)


-- 
Best Regards
Masahiro Yamada
