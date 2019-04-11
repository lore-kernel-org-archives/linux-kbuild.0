Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:44361 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfDKOdQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 10:33:16 -0400
From: Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V1 0/3] kbuild: optimize modules_install
Date: Thu, 11 Apr 2019 07:20:12 -0700
Message-Id: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: Steve Sistare <steven.sistare@oracle.com>

Perform module install actions only if the object area module is newer than
install area module, and only announce the updated modules.  To do this, the
<moddir>/kernel directory must be preserved across invocations of make, so
it must be checked for stale modules, which can occur after changing config
options.  Hence, remove modules from this directory that are not present
in modules.order.

These changes save 10's of seconds for a single CPU build, save a few
seconds for a parallel build, and reduce output clutter for an incremental
build.  Example:

  % touch drivers/virtio/virtio_ring.c
  % make modules modules_install
  DESCEND  objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CC [M]  drivers/virtio/virtio_ring.o
  Building modules, stage 2.
  MODPOST 2592 modules
  LD [M]  drivers/virtio/virtio_ring.ko
  INSTALL drivers/virtio/virtio_ring.ko
  DEPMOD  5.1.0-rc3

Patch 1 fixes a legacy race bug in parallel make.
Patch 2 installs only modified modules.
Patch 3 removes stale modules.

Steve Sistare (3):
  kbuild: serialize modules and modules_install
  kbuild: optimize modules_install target
  kbuild: remove stale modules from install area

 Makefile                 | 26 +++++++++++++++++++++-----
 scripts/Makefile.modinst | 30 +++++++++++++++++++++++-------
 2 files changed, 44 insertions(+), 12 deletions(-)

-- 
1.8.3.1
