Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47429 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751881AbbDOLzN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Apr 2015 07:55:13 -0400
Date: Wed, 15 Apr 2015 13:55:11 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kconfig changes for v4.1-rc1
Message-ID: <20150415115511.GA5385@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mmarek@suse.cz, yamada.m@jp.panasonic.com, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

here is the kconfig stuff for v4.1-rc1:
- fixes for mergeconfig (used by make kvmconfig/tinyconfig)
- header cleanup
- make -s *config is silent now

Michal

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to 0a1f00a1c86421cc07cec87011c7cf4df68ee54b:

  kconfig: Do not print status messages in make -s mode (2015-04-09 17:44:34 +0200)

----------------------------------------------------------------
Masahiro Yamada (7):
      kconfig: fix a misspelling in scripts/kconfig/merge_config.sh
      kbuild: mergeconfig: fix "jobserver unavailable" warning
      kbuild: mergeconfig: move an error check to merge_config.sh
      kbuild: mergeconfig: remove redundant $(objtree)
      merge_config.sh: improve indentation
      merge_config.sh: rename MAKE to RUNMAKE
      kbuild: add generic mergeconfig target, %.config

Michal Marek (5):
      kconfig: Get rid of the P() macro in headers
      kconfig: Remove dead code
      kconfig: Remove unnecessary prototypes from headers
      kconfig: Simplify Makefile
      kconfig: Do not print status messages in make -s mode

 scripts/kconfig/Makefile        | 80 +++++++++++++++++++-------------------
 scripts/kconfig/conf.c          |  8 +++-
 scripts/kconfig/confdata.c      |  5 +++
 scripts/kconfig/expr.c          | 22 ++++++-----
 scripts/kconfig/expr.h          |  5 ---
 scripts/kconfig/gconf.c         | 29 ++------------
 scripts/kconfig/lkc.h           | 14 -------
 scripts/kconfig/lkc_proto.h     | 85 +++++++++++++++++++----------------------
 scripts/kconfig/mconf.c         | 31 ++++++++++-----
 scripts/kconfig/menu.c          |  4 +-
 scripts/kconfig/merge_config.sh | 27 +++++++------
 scripts/kconfig/nconf.c         |  5 +++
 scripts/kconfig/qconf.cc        |  5 ++-
 scripts/kconfig/symbol.c        | 42 ++++++++++----------
 scripts/kconfig/util.c          | 10 -----
 15 files changed, 174 insertions(+), 198 deletions(-)
