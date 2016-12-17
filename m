Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prg-ext-pat.suse.com ([213.151.95.130]:34052 "EHLO linux.suse"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753254AbcLQWIH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Dec 2016 17:08:07 -0500
Date: Sat, 17 Dec 2016 23:00:53 +0100
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kconfig update for v4.10-rc1
Message-ID: <20161217220053.GA8899@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: bbarbulovski@gmail.com, ben.hutchings@codethink.co.uk, thrust73@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kconfig bits for v4.10-rc1:
- make xconfig gui fixes
- make nconfig fix for options with long prompts
- fix make nconfig warning when pkg-config forces -D_GNU_SOURCE

Michal

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to 83c3a1bad224189f22ca2c1955337c3478bd3ab2:

  xconfig: fix missing suboption and help panels on first run (2016-12-11 21:40:54 +0100)

----------------------------------------------------------------
Ben Hutchings (1):
      kconfig/nconf: Fix hang when editing symbol with a long prompt

Boris Barbulovski (2):
      xconfig: fix 'Show Debug' functionality
      xconfig: fix missing suboption and help panels on first run

Cheah Kok Cheong (1):
      Scripts: kconfig: nconf: fix _GNU_SOURCE redefined warning

 scripts/kconfig/nconf.c     |  2 ++
 scripts/kconfig/nconf.gui.c | 15 +++++++++++----
 scripts/kconfig/qconf.cc    | 19 ++++++++++++++-----
 3 files changed, 27 insertions(+), 9 deletions(-)
