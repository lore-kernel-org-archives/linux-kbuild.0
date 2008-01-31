Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hu-out-0506.google.com ([72.14.214.234]:62153 "EHLO
	hu-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762369AbYAaR2D (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Jan 2008 12:28:03 -0500
Received: by hu-out-0506.google.com with SMTP id 19so483494hue.21
        for <linux-kbuild@vger.kernel.org>; Thu, 31 Jan 2008 09:28:01 -0800 (PST)
Date: Fri, 1 Feb 2008 01:25:17 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: [Patch] mm: fix a section mismatch warning
Message-ID: <20080131172517.GG2471@hacking>
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
References: <200801311648.43389.alessandro.guido@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200801311648.43389.alessandro.guido@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alessandro Guido <alessandro.guido@gmail.com>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org


This patch fix this mismatch warning from mm:

WARNING: vmlinux.o(.meminit.text+0x37f): Section mismatch in reference from the function free_area_init_core() to the function .init.text:setup_usemap()
modpost: Found 1 section mismatch(es).

Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>

---

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b2838c2..8a9ae3c 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3321,7 +3321,7 @@ static inline int pageblock_default_order(unsigned int order)
  *   - mark all memory queues empty
  *   - clear the memory bitmaps
  */
-static void __meminit free_area_init_core(struct pglist_data *pgdat,
+static void __init free_area_init_core(struct pglist_data *pgdat,
 		unsigned long *zones_size, unsigned long *zholes_size)
 {
 	enum zone_type j;
@@ -3445,7 +3445,7 @@ static void __init_refok alloc_node_mem_map(struct pglist_data *pgdat)
 #endif /* CONFIG_FLAT_NODE_MEM_MAP */
 }
 
-void __meminit free_area_init_node(int nid, struct pglist_data *pgdat,
+void __init free_area_init_node(int nid, struct pglist_data *pgdat,
 		unsigned long *zones_size, unsigned long node_start_pfn,
 		unsigned long *zholes_size)
 {
