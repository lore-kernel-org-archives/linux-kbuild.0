Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:47638 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753132AbdGGAJ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jul 2017 20:09:59 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 7 Jul 2017 09:09:54 +0900
Message-ID: <CAK7LNATDpVLPb9v_86QLsOKBLBpSGAnVdhhUKn=yw0StvfOvOg@mail.gmail.com>
Subject: [GIT PULL 3/3] Kbuild updates for thin archives for v4.13
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Hi Linus,

Here are updates to switch over to thin archives.
Please see the tag description for details.
Please pull!


The following changes since commit 3c2993b8c6143d8a5793746a54eba8f86f95240f:

  Linux 4.12-rc4 (2017-06-04 16:47:43 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-thinar-v4.13

for you to fetch changes up to 42317ea79d9af0a83b6cfdfe43c27a91d468bfb1:

  tile: remove unneeded extra-y in Makefile (2017-06-30 09:03:05 +0900)

----------------------------------------------------------------
Kbuild thin archives updates for v4.13

Thin archives migration by Nicholas Piggin.

THIN_ARCHIVES has been available for a while as an optional feature
only for PowerPC architecture, but we do not need two different
intermediate-artifact schemes.

Using thin archives instead of conventional incremental linking has
various advantages:
 - save disk space for builds
 - speed-up building a little
 - fix some link issues (for example, allyesconfig on ARM) due to
   more flexibility for the final linking
 - work better with dead code elimination we are planning

As discussed before, this migration has been done unconditionally
so that any problems caused by this will show up with "git bisect".

With testing with 0-day and linux-next, some architectures actually
showed up problems, but they were trivial and all fixed now.

----------------------------------------------------------------
David S. Miller (1):
      sparc64: Use indirect calls in hamming weight stubs

Masahiro Yamada (3):
      tile: fix dependency and .*.cmd inclusion for incremental build
      ia64: remove unneeded extra-y in Makefile.gate
      tile: remove unneeded extra-y in Makefile

Nicholas Piggin (8):
      kbuild: thin archives final link close --whole-archives option
      kbuild: thin archives use P option to ar
      kbuild: handle libs-y archives separately from built-in.o archives
      sh: thin archives fix linking
      ia64: thin archives fix linking
      tile: thin archives fix linking
      x86/um: thin archives build fix
      kbuild: thin archives make default for all archs

 Documentation/kbuild/kbuild.txt   |  8 ++++--
 Documentation/process/changes.rst |  9 +++----
 Makefile                          |  8 +++---
 arch/Kconfig                      |  2 +-
 arch/ia64/kernel/Makefile.gate    | 15 +++++------
 arch/powerpc/Kconfig              |  8 ------
 arch/sh/kernel/vsyscall/Makefile  | 16 ++++++------
 arch/sparc/lib/hweight.S          | 16 ++++++------
 arch/tile/kernel/vdso/Makefile    | 26 +++++++++----------
 arch/x86/um/vdso/Makefile         |  2 +-
 scripts/Makefile.build            |  8 +++---
 scripts/link-vmlinux.sh           | 47 +++++++++++++++++++++++++++--------
 12 files changed, 93 insertions(+), 72 deletions(-)


-- 
Best Regards
Masahiro Yamada
