Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:25717 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDQIU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Aug 2019 12:08:20 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Aug 2019 01:07:14 +0900
Message-ID: <CAK7LNAQNSjKcanh78mEJWeyO81xz9qBJ=_u=Dcqx+YcaT9pZig@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.3-rc3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: masahiroy@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull some more Kbuild fixes.
Thanks!


The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.3-2

for you to fetch changes up to 0c5b6c28ed68becb692b43eae5e44d5aa7e160ce:

  kconfig: Clear "written" flag to avoid data loss (2019-08-04 12:44:15 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.3 (2nd)

 - detect missing missing "WITH Linux-syscall-note" for uapi headers

 - fix needless rebuild when using Clang

 - fix false-positive cc-option in Kconfig when using Clang

 - avoid including corrupted .*.cmd files in the modpost stage

 - fix warning of 'make vmlinux'

 - fix {m,n,x,g}config to not generate the broken .config on the second
   save operation.

 - some trivial Makefile fixes

----------------------------------------------------------------
M. Vefa Bicakci (1):
      kconfig: Clear "written" flag to avoid data loss

Masahiro Yamada (7):
      kbuild: detect missing "WITH Linux-syscall-note" for uapi headers
      kbuild: initialize CLANG_FLAGS correctly in the top Makefile
      kbuild: modpost: include .*.cmd files only when targets exist
      kbuild: modpost: handle KBUILD_EXTRA_SYMBOLS only for external modules
      kbuild: modpost: remove unnecessary dependency for __modpost
      kbuild: modpost: do not parse unnecessary rules for vmlinux modpost
      lib/raid6: fix unnecessary rebuild of vpermxor*.c

Stephen Boyd (1):
      kbuild: Check for unknown options with cc-option usage in
Kconfig and clang

 Makefile                   |  3 +-
 lib/raid6/Makefile         |  2 +-
 scripts/Kconfig.include    |  2 +-
 scripts/Makefile.modpost   | 82
+++++++++++++++++++++++++-----------------------
 scripts/headers_install.sh |  6 ++++
 scripts/kconfig/confdata.c |  4 +++
 scripts/link-vmlinux.sh    |  2 +-
 7 files changed, 58 insertions(+), 43 deletions(-)


-- 
Best Regards
Masahiro Yamada
