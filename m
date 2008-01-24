Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37478 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755704AbYAXWD7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:59 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 27/77] INFINIBAND: Remove 'TOPDIR' from Makefiles
Date: Thu, 24 Jan 2008 23:03:08 +0100
Message-Id: <1201212238-4369-27-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: WANG Cong <xiyou.wangcong@gmail.com>, Roland Dreier <rolandd@cisco.com>, Sean Hefty <mshefty@ichips.intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

From: WANG Cong <xiyou.wangcong@gmail.com>

This patch removes TOPDIR from infiniband Makefile and delete
one include statement pointing to a non-existing directory

Cc: Roland Dreier <rolandd@cisco.com>
Cc: Sean Hefty <mshefty@ichips.intel.com>
Cc: Hal Rosenstock <hal.rosenstock@gmail.com>
Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/infiniband/hw/cxgb3/Makefile |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb3/Makefile b/drivers/infiniband/hw/cxgb3/Makefile
index 36b9898..7e7b5a6 100644
--- a/drivers/infiniband/hw/cxgb3/Makefile
+++ b/drivers/infiniband/hw/cxgb3/Makefile
@@ -1,5 +1,4 @@
-EXTRA_CFLAGS += -I$(TOPDIR)/drivers/net/cxgb3 \
-		-I$(TOPDIR)/drivers/infiniband/hw/cxgb3/core
+EXTRA_CFLAGS += -Idrivers/net/cxgb3
 
 obj-$(CONFIG_INFINIBAND_CXGB3) += iw_cxgb3.o
 
-- 
1.5.4.rc3.14.g44397

