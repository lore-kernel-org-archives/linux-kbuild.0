Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:33731 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935365AbcCKIn4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Mar 2016 03:43:56 -0500
From: laerdevstudios@gmail.com
Subject: [PATCH] Fixed 1 multiple equals checkpatch warning.
Date: Fri, 11 Mar 2016 08:43:49 +0000
Message-Id: <1457685829-7018-1-git-send-email-laerdevstudios@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Parth Sane <laerdevstudios@gmail.com>

From: Parth Sane <laerdevstudios@gmail.com>

diff --git a/drivers/staging/netlogic/platform_net.c b/drivers/staging/netlogic/platform_net.c
index 7806c2b..de2c3cb 100644
--- a/drivers/staging/netlogic/platform_net.c
+++ b/drivers/staging/netlogic/platform_net.c
@@ -86,7 +86,8 @@ static void xlr_resource_init(struct resource *res, int offset, int irq)
 
 	res++;
 	res->name = "gmac";
-	res->start = res->end = irq;
+	res->end = irq;
+        res->start = res->end;
 	res->flags = IORESOURCE_IRQ;
 }
 
-- 
2.1.4

