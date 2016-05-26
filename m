Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57884 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755240AbcEZUvd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 May 2016 16:51:33 -0400
Date: Thu, 26 May 2016 22:51:34 +0200
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild misc changes for v4.7-rc1
Message-ID: <20160526205134.GA5103@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: asamson@codeaurora.org, bjorn@mork.no, jkosina@suse.cz, keescook@chromium.org, srinivas.pandruvada@linux.intel.com, vaishali.thakkar@oracle.com, wsa@the-dreams.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

this is the non-critical part of kbuild:
- Coccinelle fixes, one semantic patch less in this round [Vaishali
  Thakkar, Wolfram Sang, Kees Cook]
- rpm-pkg support for (open)SUSE's update-bootloader [Jiří Kosian]
- rpm-pkg restored support for $RPMOPTS [Srinivas Pandruvada]
- deb-pkg fixes for the linux-headers package [Bjørn Mork, Azriel
  Samson]

Thanks,
Michal

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to 2552a39facb6609007a02eeda5d5edee4fcaca30:

  coccicheck: Fix missing 0 index in kill loop (2016-05-19 09:56:59 +0200)

----------------------------------------------------------------
Azriel Samson (1):
      builddeb: fix missing headers in linux-headers package

Bjørn Mork (1):
      builddeb: include objtool binary in headers package

Jiri Kosina (1):
      kbuild/mkspec: support 'update-bootloader'-based systems

Kees Cook (1):
      coccicheck: Fix missing 0 index in kill loop

Srinivas Pandruvada (1):
      scripts/package/Makefile: rpmbuild add support of RPMOPTS

Vaishali Thakkar (1):
      Coccinelle: setup_timer: Add space in front of parentheses

Wolfram Sang (1):
      scripts: coccinelle: remove check to move constants to right

 scripts/coccicheck                             |   2 +-
 scripts/coccinelle/api/setup_timer.cocci       |   4 +-
 scripts/coccinelle/misc/compare_const_fl.cocci | 171 -------------------------
 scripts/package/Makefile                       |   4 +-
 scripts/package/builddeb                       |   5 +-
 scripts/package/mkspec                         |   5 +
 6 files changed, 14 insertions(+), 177 deletions(-)
 delete mode 100644 scripts/coccinelle/misc/compare_const_fl.cocci
