Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:53748 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753476AbeGBWCt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 18:02:49 -0400
Subject: [PATCH] Kconfig: menus: add PREEMPT options back
References: <20180702144711.22111-1-hch@lst.de>
 <20180702144711.22111-4-hch@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ccf301c1-366c-4af5-54c7-36ddd4e33c52@infradead.org>
Date: Mon, 2 Jul 2018 15:02:45 -0700
MIME-Version: 1.0
In-Reply-To: <20180702144711.22111-4-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Looks like the PREEMPT symbols from kernel/Kconfig.preempt were
lost, so add them back.  Otherwise some of the RCU options are
set differently than they should be.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 init/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20180702.orig/init/Kconfig
+++ linux-next-20180702/init/Kconfig
@@ -332,6 +332,7 @@ config AUDIT_TREE
 
 source "kernel/irq/Kconfig"
 source "kernel/time/Kconfig"
+source "kernel/Kconfig.preempt"
 
 menu "CPU/Task time and stats accounting"
 

