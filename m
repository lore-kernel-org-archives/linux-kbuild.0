Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46786 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754425AbbDOLlX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Apr 2015 07:41:23 -0400
Date: Wed, 15 Apr 2015 13:41:20 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild changes for v4.1-rc1
Message-ID: <20150415114119.GA5171@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ard.biesheuvel@linaro.org, mmarek@suse.cz, yamada.m@jp.panasonic.com, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

Here is the first round of kbuild changes for v4.1-rc1:
- kallsyms fix for ARM and cleanup
- make dep(end) removed (developers have no sense of nostalgia these
  days...)
- include Makefiles by relative path
- stop useless rebuilds of asm-offsets.h and bounds.h

Michal

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to 41b585b2ed793db6f02ec87d0026d73382e8180a:

  Kbuild: kallsyms: drop special handling of pre-3.0 GCC symbols (2015-04-07 13:04:51 +0200)

----------------------------------------------------------------
Ard Biesheuvel (2):
      Kbuild: kallsyms: ignore veneers emitted by the ARM linker
      Kbuild: kallsyms: drop special handling of pre-3.0 GCC symbols

Masahiro Yamada (6):
      kbuild: remove warning about "make depend"
      kbuild: do not add $(bounds-file) and $(offsets-file) to targets
      kbuild: use relative path to include Makefile
      kbuild: use relative path more to include Makefile
      kbuild: include $(src)/Makefile rather than $(obj)/Makefile
      kbuild: ia64: use $(src)/Makefile.gate rather than particular path

Michal Marek (1):
      kbuild: Don't reset timestamps in include/generated if not needed

 Kbuild                    | 21 ++++++++++-----------
 Makefile                  | 28 ++++++++++------------------
 arch/arm/boot/Makefile    |  2 +-
 arch/ia64/kernel/Makefile |  2 +-
 arch/mips/Makefile        |  2 +-
 arch/um/Makefile          |  6 +++---
 arch/x86/Makefile         |  2 +-
 arch/x86/Makefile.um      |  2 +-
 scripts/Makefile.dtbinst  |  2 +-
 scripts/Makefile.fwinst   |  2 +-
 scripts/kallsyms.c        | 29 ++++++++++++++++++++---------
 11 files changed, 50 insertions(+), 48 deletions(-)
