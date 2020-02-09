Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49457 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgBIFqD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Feb 2020 00:46:03 -0500
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 9 Feb 2020 06:45:18 +0100
Message-ID: <CAK7LNAQs-KVCM7xXqJchQrMG+nnajPFRMB2Z+RJ9VTsg7XGRAQ@mail.gmail.com>
Subject: [GIT PULL] more Kbuild updates for v5.6-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,

Please pull more Kbuild updates.
(I touched Makefiles around due to some syntax renaming,
but it is trivial.)

Thanks.




The following changes since commit 754beeec1d9024eef0db8dc4be2636331dd413c6:

  Merge tag 'char-misc-5.6-rc1-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
(2020-02-03 14:57:33 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.6-2

for you to fetch changes up to f566e1fbadb686e28f1c307e356114b2865ef588:

  kbuild: make multiple directory targets work (2020-02-06 06:31:51 +0900)

----------------------------------------------------------------
Kbuild updates for v5.6 (2nd)

 - fix randconfig to generate a sane .config

 - rename hostprogs-y / always to hostprogs / always-y, which are
   more natual syntax.

 - optimize scripts/kallsyms

 - fix yes2modconfig and mod2yesconfig

 - make multiple directory targets ('make foo/ bar/') work

----------------------------------------------------------------
Masahiro Yamada (7):
      kconfig: fix broken dependency in randconfig-generated .config
      kbuild: fix the document to use extra-y for vmlinux.lds
      kbuild: rename hostprogs-y/always to hostprogs/always-y
      scripts/kallsyms: rename local variables in read_symbol()
      scripts/kallsyms: change table to store (strcut sym_entry *)
      kallsyms: fix type of kallsyms_token_table[]
      kbuild: make multiple directory targets work

Tetsuo Handa (1):
      kconfig: Invalidate all symbols after changing to y or m.

 Documentation/kbuild/makefiles.rst  |  53 ++++------
 Kbuild                              |   8 +-
 Makefile                            |   2 +-
 arch/alpha/boot/Makefile            |   2 +-
 arch/arm/vdso/Makefile              |   2 +-
 arch/arm64/kernel/vdso32/Makefile   |   4 +-
 arch/mips/boot/Makefile             |   2 +-
 arch/mips/boot/compressed/Makefile  |   4 +-
 arch/mips/boot/tools/Makefile       |   2 +-
 arch/mips/tools/Makefile            |   4 +-
 arch/mips/vdso/Makefile             |   2 +-
 arch/powerpc/boot/Makefile          |   4 +-
 arch/s390/tools/Makefile            |   4 +-
 arch/sparc/boot/Makefile            |   2 +-
 arch/sparc/vdso/Makefile            |   2 +-
 arch/x86/boot/Makefile              |   4 +-
 arch/x86/boot/compressed/Makefile   |   2 +-
 arch/x86/entry/vdso/Makefile        |   2 +-
 arch/x86/realmode/rm/Makefile       |   2 +-
 arch/x86/tools/Makefile             |   4 +-
 drivers/gpu/drm/radeon/Makefile     |   2 +-
 drivers/tty/vt/Makefile             |   2 +-
 drivers/video/logo/Makefile         |   2 +-
 drivers/zorro/Makefile              |   2 +-
 fs/unicode/Makefile                 |   2 +-
 kernel/kallsyms.c                   |   5 +-
 lib/Makefile                        |   4 +-
 lib/raid6/Makefile                  |   2 +-
 net/bpfilter/Makefile               |   2 +-
 samples/bpf/Makefile                | 118 +++++++++++-----------
 samples/connector/Makefile          |   8 +-
 samples/hidraw/Makefile             |   6 +-
 samples/mei/Makefile                |   4 +-
 samples/pidfd/Makefile              |   4 +-
 samples/seccomp/Makefile            |   4 +-
 samples/uhid/Makefile               |   4 +-
 samples/vfs/Makefile                |   5 +-
 scripts/Makefile                    |  22 ++--
 scripts/Makefile.build              |   8 +-
 scripts/Makefile.clean              |   4 +-
 scripts/Makefile.host               |   8 +-
 scripts/Makefile.lib                |   6 +-
 scripts/basic/Makefile              |   4 +-
 scripts/dtc/Makefile                |   4 +-
 scripts/gcc-plugins/Makefile        |   2 +-
 scripts/genksyms/Makefile           |   4 +-
 scripts/kallsyms.c                  | 133 +++++++++++++------------
 scripts/kconfig/Makefile            |  10 +-
 scripts/kconfig/confdata.c          |   7 +-
 scripts/mod/Makefile                |   4 +-
 scripts/selinux/genheaders/Makefile |   4 +-
 scripts/selinux/mdp/Makefile        |   4 +-
 usr/Makefile                        |   2 +-
 53 files changed, 252 insertions(+), 261 deletions(-)


--
Best Regards
Masahiro Yamada
