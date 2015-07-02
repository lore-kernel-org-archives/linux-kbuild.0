Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38078 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754232AbbGBUfU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 16:35:20 -0400
Date: Thu, 2 Jul 2015 22:35:19 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild changes for v4.2-rc1
Message-ID: <20150702203519.GA21330@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux@rasmusvillemoes.dk, mcoquelin.stm32@gmail.com, paul@crapouillou.net, sylvain.bertrand@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

just a few kbuild core commits this time:
- kallsyms fix for CONFIG_XIP_KERNEL
- bashisms in scripts/link-vmlinux.sh fixed
- Workaround to make DEBUG_INFO_REDUCED more useful yet still space
  efficient
- clang is not wrongly detected when cross-compiling

Michal

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to 50ab9a69275dca588cb5ad5038657f069bbdeb56:

  kbuild: include core debug info when DEBUG_INFO_REDUCED (2015-06-11 15:08:32 +0200)

----------------------------------------------------------------
Maxime Coquelin (1):
      scripts: link-vmlinux: Don't pass page offset to kallsyms if XIP Kernel

Paul Cercueil (1):
      Makefile: Fix detection of clang when cross-compiling

Rasmus Villemoes (1):
      kbuild: include core debug info when DEBUG_INFO_REDUCED

Sylvain BERTRAND (1):
      scripts: fix link-vmlinux.sh bash-ism

 Makefile                | 16 +++++++---------
 lib/Makefile            |  3 +++
 lib/debug_info.c        | 27 +++++++++++++++++++++++++++
 scripts/link-vmlinux.sh | 18 +++++++++++++++---
 4 files changed, 52 insertions(+), 12 deletions(-)
 create mode 100644 lib/debug_info.c
