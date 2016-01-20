Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34227 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933921AbcATJQG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Jan 2016 04:16:06 -0500
Date: Wed, 20 Jan 2016 10:16:04 +0100
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kconfig changes for v4.5-rc1
Message-ID: <20160120091604.GA7742@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: chris.bainbridge@gmail.com, mmayer@broadcom.com, vegard.nossum@oracle.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull these kconfig changes for v4.5-rc1:
- Fix for make xconfig segfault
- Handle long strings in config symbol values
- Fix for mixing boolean and kconfig ternary type

Thanks,
Michal

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git kconfig

for you to fetch changes up to 5b61c7bd25f13daa58f2507991e87e990d7c6010:

  kconfig: fix qconf segfault by deleting heap objects (2016-01-11 09:45:08 +0100)

----------------------------------------------------------------
Chris Bainbridge (1):
      kconfig: fix qconf segfault by deleting heap objects

Markus Mayer (1):
      kconfig: allow kconfig to handle longer path names

Vegard Nossum (1):
      kconfig: return 'false' instead of 'no' in bool function

 scripts/kconfig/conf.c   | 7 ++++---
 scripts/kconfig/menu.c   | 2 +-
 scripts/kconfig/qconf.cc | 2 ++
 3 files changed, 7 insertions(+), 4 deletions(-)
