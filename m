Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47149 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755063AbbIHPYu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Sep 2015 11:24:50 -0400
Date: Tue, 8 Sep 2015 17:24:47 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild core changes for v4.3-rc1
Message-ID: <20150908152447.GA15639@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ak@linux.intel.com, mmarek@suse.com, p.fedin@samsung.com, richard.yao@clusterhq.com, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kbuild changes for v4.3-rc1:
- modpost portability fix
- linker script fix
- genksyms segfault fix
- fixdep cleanup
- fix for clang detection

Thanks,
Michal

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to 5631d9c429857194bd55d7bcd8fa5bdd1a9899a3:

  kbuild: Fix clang detection (2015-09-04 13:14:10 +0200)

----------------------------------------------------------------
Andi Kleen (1):
      kbuild: Fix .text.unlikely placement

Masahiro Yamada (2):
      kbuild: fixdep: optimize code slightly
      kbuild: fixdep: drop meaningless hash table initialization

Michal Marek (2):
      genksyms: Regenerate parser
      kbuild: Fix clang detection

Pavel Fedin (1):
      Avoid conflict with host definitions when cross-compiling

Richard Yao (1):
      genksyms: Duplicate function pointer type definitions segfault

 Makefile                             |   9 +-
 arch/powerpc/Makefile                |   8 +-
 include/asm-generic/vmlinux.lds.h    |   4 +-
 scripts/Kbuild.include               |   4 +
 scripts/Makefile.extrawarn           |   2 +-
 scripts/basic/fixdep.c               |  26 +-
 scripts/genksyms/parse.tab.c_shipped | 671 +++++++++++++++++------------------
 scripts/genksyms/parse.tab.h_shipped |  26 +-
 scripts/genksyms/parse.y             |   9 +
 scripts/mod/modpost.h                |   6 +
 10 files changed, 384 insertions(+), 381 deletions(-)
