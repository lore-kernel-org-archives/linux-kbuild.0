Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49196 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751543AbcKRUuy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Nov 2016 15:50:54 -0500
Date: Fri, 18 Nov 2016 21:50:51 +0100
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild post v4.9-rc1 fixes
Message-ID: <20161118205051.GA11224@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: bigeasy@linutronix.de, bp@suse.de, npiggin@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

Here are some regression fixes for kbuild:
- modversion support for exported asm symbols (Nick Piggin). The
  affected architectures need separate patches adding asm-prototypes.h.
- fix rebuilds of lib-ksyms.o (Nick Piggin)
- -fno-PIE builds (Sebastian Siewior and Borislav Petkov). This is not a
  kernel regression, but one of the Debian gcc package. Nevertheless,
  it's quite annoying, so I think it should go into mainline and stable
  now.

Thanks,
Michal


The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes

for you to fetch changes up to c6a385539175ebc603da53aafb7753d39089f32e:

  kbuild: Steal gcc's pie from the very beginning (2016-11-15 17:08:14 +0100)

----------------------------------------------------------------
Borislav Petkov (1):
      kbuild: Steal gcc's pie from the very beginning

Nicholas Piggin (3):
      kbuild: prevent lib-ksyms.o rebuilds
      kbuild: modversions for EXPORT_SYMBOL() for asm
      kbuild: be more careful about matching preprocessed asm ___EXPORT_SYMBOL

Sebastian Andrzej Siewior (3):
      kbuild: add -fno-PIE
      scripts/has-stack-protector: add -fno-PIE
      x86/kexec: add -fno-PIE

 Makefile                                  |  5 +-
 arch/x86/purgatory/Makefile               |  1 +
 scripts/Makefile.build                    | 81 ++++++++++++++++++++++++++++---
 scripts/gcc-x86_64-has-stack-protector.sh |  2 +-
 4 files changed, 80 insertions(+), 9 deletions(-)
