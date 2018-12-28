Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:52439 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbeL1QAm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Dec 2018 11:00:42 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 29 Dec 2018 00:59:56 +0900
Message-ID: <CAK7LNARQggM3aKEPRKJqa4tunFAfmfErMZuS-rrnRv6UB1VpPQ@mail.gmail.com>
Subject: [GIT PULL 2/4] Kbuild updates for v4.21 part2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Here are Kbuild updates for v4.21 part 2.


The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v4.21-2

for you to fetch changes up to 5cd6239506cb97fb00c5992c1adaf6f9f788c5f2:

  kernel hacking: support building kernel with -Og optimization level
(2018-11-19 23:32:54 +0900)

----------------------------------------------------------------
Kbuild updates for v4.21 (part 2)

Debugging experience improvement by Changbin Du.

Support -Og optimization level, which offers a reasonable level of
optimization while maintaining a good debugging experience.

Introduce a new option CONFIG_NO_AUTO_INLINE as well. With this option,
only functions explicitly marked with "inline" will be inlined. This
will allow the function tracer to trace more functions.

----------------------------------------------------------------
Changbin Du (5):
      x86/mm: declare check_la57_support() as inline
      openrisc: make function cache_loop() inline
      kernel hacking: add a config option to disable compiler auto-inlining
      ARM: mm: fix build error in fix_to_virt with -Og optimization level
      kernel hacking: support building kernel with -Og optimization level

 Makefile                     | 11 +++++++++++
 arch/arm/mm/mmu.c            |  2 +-
 arch/openrisc/mm/cache.c     |  2 +-
 arch/x86/kernel/head64.c     |  2 +-
 include/linux/compiler-gcc.h |  2 ++
 init/Kconfig                 | 21 +++++++++++++++++++++
 kernel/configs/tiny.config   |  1 +
 lib/Kconfig.debug            | 17 +++++++++++++++++
 8 files changed, 55 insertions(+), 3 deletions(-)


--
Best Regards
Masahiro Yamada
