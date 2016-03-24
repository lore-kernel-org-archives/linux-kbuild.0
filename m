Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39598 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751163AbcCXUse (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Mar 2016 16:48:34 -0400
Date: Thu, 24 Mar 2016 21:48:30 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kbuild changes for v4.6-rc1
Message-ID: <20160324204830.GA10385@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ard.biesheuvel@linaro.org, arnd@arndb.de, daniel.wagner@bmw-carit.de, rmk+kernel@arm.linux.org.uk, trini@konsulko.com, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kbuild changes for v4.6-rc1:
- make dtbs_install fix
- Error handling fix fixdep and link-vmlinux.sh
- __UNIQUE_ID fix for clang
- Fix for if_changed_* to suppress the "is up to date." message
- The kernel is built with -Werror=incompatible-pointer-types.

The last change needed a drm fix: db9b60400f92 ("drm/gma500: remove helper
function") to  not break build. It is in since Monday, so there should
be no problem.

Michal

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kbuild

for you to fetch changes up to ea8daa7b97842aab8507b5b5b1e3226cf2d514a6:

  kbuild: Add option to turn incompatible pointer check into error (2016-03-15 21:51:54 +0100)

----------------------------------------------------------------
Ard Biesheuvel (1):
      scripts/link-vmlinux.sh: force error on kallsyms failure

Arnd Bergmann (1):
      Kbuild: provide a __UNIQUE_ID for clang

Daniel Wagner (1):
      kbuild: Add option to turn incompatible pointer check into error

Masahiro Yamada (1):
      kbuild: suppress annoying "... is up to date." message

Russell King (1):
      dtbsinstall: don't move target directory out of the way

Tom Rini (1):
      kbuild: fixdep: Check fstat(2) return value

 Makefile                       | 3 +++
 include/linux/compiler-clang.h | 5 +++++
 scripts/Kbuild.include         | 6 +++---
 scripts/Makefile.dtbinst       | 2 --
 scripts/basic/fixdep.c         | 6 +++++-
 scripts/link-vmlinux.sh        | 7 ++++---
 6 files changed, 20 insertions(+), 9 deletions(-)
