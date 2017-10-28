Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35827 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751189AbdJ1P0j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Oct 2017 11:26:39 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 29 Oct 2017 00:25:52 +0900
Message-ID: <CAK7LNAR2W9Fppu0Y4iL3iPVGR8L6zN64c0shyX-_A4kERk8jtQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.14-rc7
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

This is the 2nd round of Kbuild fixes for v4.14.
Please pull!


The following changes since commit 9e66317d3c92ddaab330c125dfe9d06eee268aff:

  Linux 4.14-rc3 (2017-10-01 14:54:54 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.14-2

for you to fetch changes up to bb3f38c3c5b759163e09b9152629cc789731de47:

  kbuild: clang: fix build failures with sparse check (2017-10-24
10:12:02 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.14 (2nd)

- fix O= building on dash

- remove unused dependency in Makefile

- fix default of a choice in Kconfig

- fix typos and documentation style

- fix command options unrecognized by sparse

----------------------------------------------------------------
Cao jin (2):
      kbuild: drop unused symverfile in Makefile.modpost
      kbuild doc: a bundle of fixes on makefiles.txt

David Lin (1):
      kbuild: clang: fix build failures with sparse check

Masahiro Yamada (1):
      kbuild: revert $(realpath ...) to $(shell cd ... && /bin/pwd)

Randy Dunlap (1):
      Makefile: kselftest: fix grammar typo

Ulf Magnusson (1):
      kbuild: Fix optimization level choice default

 Documentation/kbuild/makefiles.txt | 31 +++++++++++++---------
 Makefile                           | 10 +++----
 init/Kconfig                       |  2 +-
 scripts/Makefile.modpost           |  1 -
 tools/power/cpupower/Makefile      |  2 +-
 tools/scripts/Makefile.include     |  6 ++---
 6 files changed, 28 insertions(+), 24 deletions(-)


-- 
Best Regards
Masahiro Yamada
