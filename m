Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38013 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751649AbbBRVMR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2015 16:12:17 -0500
Date: Wed, 18 Feb 2015 22:12:13 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild changes for v3.20-rc1
Message-ID: <20150218211213.GA27204@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mmarek@suse.cz, yamada.m@jp.panasonic.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull the kbuild stuff for v3.20-rc1:
- several cleanups in kbuild
- serialize multiple *config targets so that 'make defconfig kvmconfig'
  works
- The cc-ifversion macro got support for an else-branch


The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to a75f8b8dab0f73459fa47a1daa10c84c4e8400a8:

  kbuild,gcov: simplify kernel/gcov/Makefile more (2015-01-09 17:25:44 +0100)

----------------------------------------------------------------
Masahiro Yamada (10):
      kbuild: merge bounds.h and asm-offsets.h rules
      kbuild: remove redundant line from bounds.h/asm-offsets.h
      kbuild: use mixed-targets when two or more config targets are given
      kbuild: drop $(version_h) from MRPROPER_FILES
      kbuild: fix cc-ifversion macro
      kbuild: do not add $(call ...) to invoke cc-version or cc-fullversion
      kbuild,gcov: remove unnecessary workaround
      kbuild,gcov: simplify kernel/gcov/Makefile
      kbuild: allow cc-ifversion to have the argument for false condition
      kbuild,gcov: simplify kernel/gcov/Makefile more

Michal Marek (1):
      kbuild: Drop support for clean-rule

 Documentation/kbuild/makefiles.txt |  9 +++---
 Kbuild                             | 61 +++++++++++++-------------------------
 Makefile                           |  4 +--
 arch/parisc/Makefile               |  2 +-
 arch/powerpc/Makefile              |  6 ++--
 arch/x86/Makefile.um               |  2 +-
 kernel/gcov/Makefile               | 36 ++++------------------
 scripts/Kbuild.include             |  7 ++---
 scripts/Makefile.clean             |  3 --
 9 files changed, 40 insertions(+), 90 deletions(-)
