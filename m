Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:36039 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752460AbcCKJEp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Mar 2016 04:04:45 -0500
From: laerdevstudios@gmail.com
Subject: [PATCH] staging: netlogic: Fixed 1 multiple assignment checkpatch warning.
Date: Fri, 11 Mar 2016 09:04:33 +0000
Message-Id: <1457687073-7782-1-git-send-email-laerdevstudios@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Parth Sane <laerdevstudios@gmail.com>

From: Parth Sane <laerdevstudios@gmail.com>

diff --git a/drivers/staging/netlogic/platform_net.c b/drivers/staging/netlogic/platform_net.c
index 7806c2b..daee1b2 100644
--- a/drivers/staging/netlogic/platform_net.c
+++ b/drivers/staging/netlogic/platform_net.c
@@ -86,7 +86,8 @@ static void xlr_resource_init(struct resource *res, int offset, int irq)
 
 	res++;
 	res->name = "gmac";
-	res->start = res->end = irq;
+	res->end = irq;
+	res->start = res->end;
 	res->flags = IORESOURCE_IRQ;
 }
 
-- 
2.1.4

