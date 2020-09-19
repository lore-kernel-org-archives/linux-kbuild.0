Return-Path: <SRS0=8Fgl=C4=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BD2C43464
	for <linux-kbuild@archiver.kernel.org>; Sat, 19 Sep 2020 19:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D1E321741
	for <linux-kbuild@archiver.kernel.org>; Sat, 19 Sep 2020 19:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgISTnU (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 19 Sep 2020 15:43:20 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:45440 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgISTnU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Sep 2020 15:43:20 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kJi8j-00FPak-Ny; Sat, 19 Sep 2020 21:03:17 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     netdev <netdev@vger.kernel.org>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH RFC/RFT 2/2] net: phylib: Enable W=1 by default
Date:   Sat, 19 Sep 2020 21:02:58 +0200
Message-Id: <20200919190258.3673246-3-andrew@lunn.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200919190258.3673246-1-andrew@lunn.ch>
References: <20200919190258.3673246-1-andrew@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add to the subdirectory ccflags variable the additional compiler
warnings which W=1 adds at the top level when enabled.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/mdio/Makefile | 3 +++
 drivers/net/pcs/Makefile  | 3 +++
 drivers/net/phy/Makefile  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 14d1beb633c9..14600552eb8b 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux MDIO bus drivers
 
+# Enable W=1 by default
+subdir-ccflags-y := $(KBUILD_CFLAGS_WARN1)
+
 obj-$(CONFIG_MDIO_ASPEED)		+= mdio-aspeed.o
 obj-$(CONFIG_MDIO_BCM_IPROC)		+= mdio-bcm-iproc.o
 obj-$(CONFIG_MDIO_BCM_UNIMAC)		+= mdio-bcm-unimac.o
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index c23146755972..385b5765e390 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
+# Enable W=1 by default
+subdir-ccflags-y := $(KBUILD_CFLAGS_WARN1)
+
 obj-$(CONFIG_PCS_XPCS)		+= pcs-xpcs.o
 obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index a13e402074cf..c49d40dfb6ec 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PHY drivers
 
+# Enable W=1 by default
+subdir-ccflags-y := $(KBUILD_CFLAGS_WARN1)
+
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
 				   linkmode.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
-- 
2.28.0

