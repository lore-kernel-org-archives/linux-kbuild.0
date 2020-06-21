Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46949 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730425AbgFURHw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jun 2020 13:07:52 -0400
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 22 Jun 2020 02:06:58 +0900
Message-ID: <CAK7LNAT6C26gEHyT17cwHkvjx3NgvjtuFuuhqYWwH5fSz7R6wA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.8-rc2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull some Kbuild fixes.
Thanks.


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.8

for you to fetch changes up to 214377e9b7e3185abf5998b8a90450e01bab21a7:

  samples: watch_queue: build sample program for target architecture
(2020-06-22 01:56:09 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.8

 - fix -gz=zlib compiler option test for CONFIG_DEBUG_INFO_COMPRESSED

 - improve cc-option in scripts/Kbuild.include to clean up temp files

 - improve cc-option in scripts/Kconfig.include for more reliable compile
   option test

 - do not copy modules.builtin by 'make install' because it would break
   existing systems

 - use 'userprogs' syntax for watch_queue sample

----------------------------------------------------------------
Arvind Sankar (1):
      Makefile: Improve compressed debug info support detection

Masahiro Yamada (4):
      kbuild: improve cc-option to clean up all temporary files
      kconfig: unify cc-option and as-option
      Revert "Makefile: install modules.builtin even if CONFIG_MODULES=n"
      samples: watch_queue: build sample program for target architecture

Masanari Iida (1):
      scripts: Fix typo in headers_install.sh

 Makefile                     | 16 ++++------------
 arch/arm64/Kconfig           |  2 +-
 lib/Kconfig.debug            |  1 -
 samples/Kconfig              |  2 +-
 samples/watch_queue/Makefile | 10 ++++------
 scripts/Kbuild.include       | 11 ++++++-----
 scripts/Kconfig.include      |  8 +-------
 scripts/headers_install.sh   |  2 +-
 8 files changed, 18 insertions(+), 34 deletions(-)


--
Best Regards
Masahiro Yamada
