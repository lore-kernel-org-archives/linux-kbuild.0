Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47259 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754573AbbIHP05 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Sep 2015 11:26:57 -0400
Date: Tue, 8 Sep 2015 17:26:57 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: [GIT PULL] kconfig changes for v4.3-rc1
Message-ID: <20150908152657.GA16438@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: andreas.ruprecht@fau.de, elfring@users.sourceforge.net, sam.bobroff@au1.ibm.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linux,

please pull these kconfig changes for v4.3-rc1:
- kconfig warns about junk characters in Kconfig files
- merge_config.sh error handling
- small cleanup

Thanks,
Michal


The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to 78a6854e219ba266b6cc12f840b571c5f1168b5e:

  merge_config.sh: exit on missing input files (2015-08-20 13:56:55 +0200)

----------------------------------------------------------------
Andreas Ruprecht (2):
      kconfig: warn of unhandled characters in Kconfig commands
      kconfig: Regenerate shipped zconf.{hash,lex}.c files

Markus Elfring (1):
      kconfig: Delete unnecessary checks before the function call "sym_calc_value"

Sam Bobroff (1):
      merge_config.sh: exit on missing input files

 scripts/kconfig/confdata.c           |   7 +-
 scripts/kconfig/merge_config.sh      |   4 +
 scripts/kconfig/symbol.c             |   3 +-
 scripts/kconfig/zconf.gperf          |   1 +
 scripts/kconfig/zconf.hash.c_shipped |  58 ++++---
 scripts/kconfig/zconf.l              |  20 ++-
 scripts/kconfig/zconf.lex.c_shipped  | 325 +++++++++++++++++------------------
 7 files changed, 211 insertions(+), 207 deletions(-)
