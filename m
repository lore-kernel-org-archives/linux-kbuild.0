Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38161 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753647AbbGBUhh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 16:37:37 -0400
Date: Thu, 2 Jul 2015 22:37:36 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild misc fixes for v4.2-rc1
Message-ID: <20150702203736.GA23499@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ak@linux.intel.com, andrej.skvortzov@gmail.com, arnaud.patard@rtp-net.org, bp@suse.de, dmitry.kalinkin@gmail.com, f.fainelli@gmail.com, fabio.estevam@freescale.com, jim.epost@gmail.com, riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

this is the non-critical part of kbuild:
- usual make deb-pkg/rpm improvements
- .gitignore additions
- grammar cleansing in scripts/coccinelle
- new coccinelle semantic patch
Michal

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to 21a59991ce0cd9a0b54b135305e3fcf880f2aaf1:

  scripts/package/Makefile: rpmbuild is needed for rpm targets (2015-06-15 16:08:05 +0200)

----------------------------------------------------------------
Andi Kleen (1):
      Kbuild: Add ID files to .gitignore

Andrey Skvortsov (1):
      builddeb: fix stripped module signatures if CONFIG_DEBUG_INFO and CONFIG_MODULE_SIG_ALL are set

Arnaud Patard (1):
      deb-pkg: Add device tree blobs to the package

Borislav Petkov (1):
      kbuild/mkspec: Simplify vmlinux.bz2 creation

Dmitry Kalinkin (1):
      coccinelle: api: add vma_pages.cocci

Fabio Estevam (8):
      coccinelle: pm_runtime: Insert blank line
      coccinelle: returnvar: Use imperative mood
      coccinelle: ifaddr: Fix the sentence
      coccinelle: simple_open: Use imperative mood
      scripts/coccinelle/misc/semicolon.cocci: Use imperative mood
      scripts/coccinelle/misc/irqf_oneshot.cocci: Fix grammar
      coccinelle: irqf_oneshot.cocci: Improve the generated commit log
      coccinelle: simple_return: Add a blank line

Florian Fainelli (1):
      gitignore: Add MIPS vmlinux.32 to the list

Jim Davis (1):
      scripts/package/Makefile: rpmbuild is needed for rpm targets

Riku Voipio (1):
      deb-pkg: move setting debarch for a separate function

 .gitignore                                  |  4 ++
 scripts/coccinelle/api/pm_runtime.cocci     |  2 +-
 scripts/coccinelle/api/simple_open.cocci    |  4 +-
 scripts/coccinelle/api/vma_pages.cocci      | 60 +++++++++++++++++++++++++++++
 scripts/coccinelle/misc/ifaddr.cocci        |  3 +-
 scripts/coccinelle/misc/irqf_oneshot.cocci  |  7 +++-
 scripts/coccinelle/misc/returnvar.cocci     |  2 +-
 scripts/coccinelle/misc/semicolon.cocci     |  2 +-
 scripts/coccinelle/misc/simple_return.cocci |  2 +-
 scripts/package/Makefile                    |  8 +---
 scripts/package/builddeb                    | 31 +++++++++++----
 scripts/package/mkspec                      |  4 +-
 12 files changed, 103 insertions(+), 26 deletions(-)
 create mode 100644 scripts/coccinelle/api/vma_pages.cocci
