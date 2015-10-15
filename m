Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54985 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751329AbbJOURS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2015 16:17:18 -0400
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 0/9] scripts/tags.sh cleanup
Date: Thu, 15 Oct 2015 22:16:26 +0200
Message-Id: <1444940195-28272-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Do a cleanup of the tags.sh script, to make it easier to maintain. The
main part is in patch 8/9, which unifies the rules for emacs etags and
exuberant ctags . Some of the fixes uncovered coding style issues in
random source files, which are also fixed by this series.

Michal Marek (9):
  tags: Treat header files as C code
  KVM: arm: Do not indent the arguments of DECLARE_BITMAP
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
 include/kvm/arm_vgic.h             |   8 +-
 kernel/locking/lockdep.c           |   3 +-
 kernel/rcu/rcutorture.c            |   6 +-
 kernel/workqueue.c                 |   3 +-
 net/ipv4/syncookies.c              |   3 +-
 net/ipv6/syncookies.c              |   3 +-
 net/rds/page.c                     |   3 +-
 scripts/tags.sh                    | 217 ++++++++++++++++++-------------------
 16 files changed, 125 insertions(+), 148 deletions(-)
 mode change 100755 => 100644 scripts/tags.sh

-- 
2.1.4

