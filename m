Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35786 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751218AbcATJ20 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Jan 2016 04:28:26 -0500
Date: Wed, 20 Jan 2016 10:28:23 +0100
From: Michal Marek <mmarek@suse.com>
Subject: [GIT PULL] kbuild misc changes for v4.5-rc1
Message-ID: <20160120092823.GA8011@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: a.hajda@samsung.com, mmarek@suse.com, mpe@ellerman.id.au, riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

please pull this non-critical part of kbuild for v4.5-rc1:
- Fix for make O=... perf-tar*
- make tags revamp and fix for the fallout. Patch for warnings about
  line breaks inside DEFINE_PER_CPU macros is pending
- New coccinelle test

Thanks,
Michal

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git misc

for you to fetch changes up to 3f984cb39907f87515d83657ecd471ae396a6c4a:

  coccinelle: tests: unsigned value cannot be lesser than zero (2016-01-12 17:47:47 +0100)

----------------------------------------------------------------
Andrzej Hajda (1):
      coccinelle: tests: unsigned value cannot be lesser than zero

Michael Ellerman (1):
      scripts/tags.sh: Teach tags about more powerpc macros

Michal Marek (7):
      tags: Treat header files as C code
      aic7xxx: Avoid name collision with <linux/list.h>
      tags: Fix erroneous pattern match in a comment
      tags: Process Kconfig files in a single pass
      tags: Do not try to index defconfigs
      tags: Drop the _PE rule
      tags: Unify emacs and exuberant rules

Riku Voipio (1):
      package Makefile: fix perf-tar targets when outdir is set

 drivers/scsi/aic7xxx/aic79xx.h                     |   4 +-
 drivers/scsi/aic7xxx/aic79xx_osm.h                 |   5 -
 drivers/scsi/aic7xxx/aic7xxx.h                     |   2 +-
 drivers/scsi/aic7xxx/aic7xxx_osm.h                 |   5 -
 drivers/scsi/aic7xxx/queue.h                       |   2 +-
 .../tests/unsigned_lesser_than_zero.cocci          |  75 +++++++
 scripts/package/Makefile                           |   4 +-
 scripts/tags.sh                                    | 218 ++++++++++-----------
 8 files changed, 189 insertions(+), 126 deletions(-)
 create mode 100644 scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci
