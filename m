Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:58520 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756041AbaBRO3y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:29:54 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 20/20] lto: Don't inline __const_udelay
Date: Tue, 18 Feb 2014 15:28:58 +0100
Message-Id: <1392733738-8290-21-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

__const_udelay is marked inline, and LTO will happily inline it everywhere
Dropping the inline saves ~44k text in a non LTO build.

13999560        1740864 1499136 17239560        1070e08 vmlinux-with-udelay-inline
13954764        1736768 1499136 17190668        1064f0c vmlinux-wo-udelay-inline

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/lib/delay.c b/arch/x86/lib/delay.c
index 39d6a3d..540a320 100644
--- a/arch/x86/lib/delay.c
+++ b/arch/x86/lib/delay.c
@@ -112,7 +112,7 @@ void __delay(unsigned long loops)
 }
 EXPORT_SYMBOL(__delay);
 
-inline void __const_udelay(unsigned long xloops)
+void __const_udelay(unsigned long xloops)
 {
 	int d0;
 
-- 
1.8.5.2

