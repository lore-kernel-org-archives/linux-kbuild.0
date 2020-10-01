Return-Path: <SRS0=93XQ=DI=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E0CC4741F
	for <linux-kbuild@archiver.kernel.org>; Thu,  1 Oct 2020 01:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D008D206FA
	for <linux-kbuild@archiver.kernel.org>; Thu,  1 Oct 2020 01:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgJABMz (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 30 Sep 2020 21:12:55 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37212 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbgJABMz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Sep 2020 21:12:55 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kNn9C-00Gzfw-PO; Thu, 01 Oct 2020 03:12:38 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     netdev <netdev@vger.kernel.org>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rohit Maheshwari <rohitm@chelsio.com>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v2 2/2] driver/net/ethernet: Sign up for W=1 as defined on 20200930
Date:   Thu,  1 Oct 2020 03:12:32 +0200
Message-Id: <20201001011232.4050282-3-andrew@lunn.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201001011232.4050282-1-andrew@lunn.ch>
References: <20201001011232.4050282-1-andrew@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make all Ethernet drivers be compiled with the equivalent of W=1
as defined today.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/Makefile b/drivers/net/ethernet/Makefile
index f8f38dcb5f8a..8162b2f6ec81 100644
--- a/drivers/net/ethernet/Makefile
+++ b/drivers/net/ethernet/Makefile
@@ -3,6 +3,9 @@
 # Makefile for the Linux network Ethernet device drivers.
 #
 
+# Enable W=1, as defined on the given date
+subdir-ccflags-y := $(KBUILD_CFLAGS_W1_20200930)
+
 obj-$(CONFIG_NET_VENDOR_3COM) += 3com/
 obj-$(CONFIG_NET_VENDOR_8390) += 8390/
 obj-$(CONFIG_NET_VENDOR_ADAPTEC) += adaptec/
-- 
2.28.0

