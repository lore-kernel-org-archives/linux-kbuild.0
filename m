Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53848 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753002AbbLDP0q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2015 10:26:46 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH v2 0/8] scripts/tags.sh cleanup
Date: Fri,  4 Dec 2015 16:26:19 +0100
Message-Id: <1449242787-16598-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Do a cleanup of the tags.sh script, to make it easier to maintain. The
main part is in patch 7/8, which unifies the rules for emacs etags and
exuberant ctags. Some of the fixes uncovered coding style issues in
random source files, which are also fixed by this series.

v2: Rebased on current linux-next, ARM KVM patch got merged.

Michal Marek (8):
  tags: Treat header files as C code
  aic7xxx: Avoid name collision with <linux/list.h>
  tags: Fix erroneous pattern match in a comment
  tags: Process Kconfig files in a single pass
  tags: Do not try to index defconfigs
  tags: Drop the _PE rule
  tags: Unify emacs and exuberant rules
  treewide: Remove newlines inside DEFINE_PER_CPU() macros

 arch/ia64/kernel/smp.c             |   3 +-
 drivers/acpi/processor_idle.c      |   3 +-
 drivers/scsi/aic7xxx/aic79xx.h     |   4 +-
 drivers/scsi/aic7xxx/aic79xx_osm.h |   5 -
 drivers/scsi/aic7xxx/aic7xxx.h     |   2 +-
 drivers/scsi/aic7xxx/aic7xxx_osm.h |   5 -
 drivers/scsi/aic7xxx/queue.h       |   2 +-
 drivers/xen/events/events_2l.c     |   3 +-
 kernel/locking/lockdep.c           |   3 +-
 kernel/rcu/rcutorture.c            |   6 +-
 kernel/workqueue.c                 |   3 +-
 net/ipv4/syncookies.c              |   3 +-
 net/ipv6/syncookies.c              |   3 +-
 net/rds/page.c                     |   3 +-
 scripts/tags.sh                    | 216 ++++++++++++++++++-------------------
 15 files changed, 121 insertions(+), 143 deletions(-)
 mode change 100755 => 100644 scripts/tags.sh

-- 
2.1.4

