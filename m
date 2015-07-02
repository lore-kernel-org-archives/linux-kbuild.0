Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37476 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754303AbbGBU23 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 16:28:29 -0400
Date: Thu, 2 Jul 2015 22:28:28 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kconfig changes for v4.2-rc1
Message-ID: <20150702202828.GA19987@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: JBeulich@suse.com, diego.viola@gmail.com, geert+renesas@glider.be, walch.martin@web.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull this for v4.2-rc1:
- kconfig conditions can use usual less/greater than comparisons
- kconfig warns about stray characters in Kconfig files
- Bogus expression simplification removed
- some minor fixes


The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to 4a47f1eb35c5933ef32b2b99ef20f8fe4a251429:

  kconfig: re-generate *.c_shipped files after previous change (2015-06-15 14:05:58 +0200)

----------------------------------------------------------------
Diego Viola (2):
      scripts/kconfig/Makefile: Fix spelling of Qt
      scripts/kconfig/Makefile: Cosmetic fixes

Geert Uytterhoeven (1):
      kconfig: Wrap long "make help" text lines

Jan Beulich (3):
      kconfig: don't silently ignore unhandled characters
      kconfig: allow use of relations other than (in)equality
      kconfig: re-generate *.c_shipped files after previous change

Martin Walch (1):
      Kconfig: Remove bad inference rules expr_eliminate_dups2()

 scripts/kconfig/Makefile            |  28 +-
 scripts/kconfig/expr.c              | 278 ++++++++++---------
 scripts/kconfig/expr.h              |   4 +-
 scripts/kconfig/symbol.c            |   4 +
 scripts/kconfig/zconf.l             |  11 +-
 scripts/kconfig/zconf.lex.c_shipped | 314 ++++++++++++---------
 scripts/kconfig/zconf.tab.c_shipped | 524 +++++++++++++++++++-----------------
 scripts/kconfig/zconf.y             |   9 +
 8 files changed, 666 insertions(+), 506 deletions(-)
