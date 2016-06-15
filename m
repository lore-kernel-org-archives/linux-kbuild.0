Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:54801 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753541AbcFOPpH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Jun 2016 11:45:07 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 09/11] net: skfb: remove obsolete -I cflag
Date: Wed, 15 Jun 2016 17:45:51 +0200
Message-Id: <20160615154553.3177021-10-arnd@arndb.de>
In-Reply-To: <20160615154553.3177021-1-arnd@arndb.de>
References: <20160615154553.3177021-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>

The skfp driver has been moved to drivers/net/fddi/skfp a long time
ago, but we still attempt to include headers from the old location,
which causes a warning when building with W=1:

cc1: error: /git/arm-soc/drivers/net/skfp: No such file or directory [-Werror=missing-include-dirs]
cc1: error: drivers/net/skfp: No such file or directory [-Werror=missing-include-dirs]

Clearly this include directive is not needed any more, so we can
just remove it now.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/fddi/skfp/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/fddi/skfp/Makefile b/drivers/net/fddi/skfp/Makefile
index b0be0234abf6..a957a1c7e5ba 100644
--- a/drivers/net/fddi/skfp/Makefile
+++ b/drivers/net/fddi/skfp/Makefile
@@ -17,4 +17,4 @@ skfp-objs :=  skfddi.o    hwmtm.o    fplustm.o  smt.o      cfm.o     \
 #   projects. To keep the source common for all those drivers (and
 #   thus simplify fixes to it), please do not clean it up!
 
-ccflags-y := -Idrivers/net/skfp -DPCI -DMEM_MAPPED_IO -Wno-strict-prototypes
+ccflags-y := -DPCI -DMEM_MAPPED_IO -Wno-strict-prototypes
-- 
2.9.0

