Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from brigitte.telenet-ops.be ([195.130.137.66]:52352 "EHLO
	brigitte.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751757Ab1EYJKD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 05:10:03 -0400
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/4] kbuild: Fix reference to vermagic.h
Date: Wed, 25 May 2011 11:09:59 +0200
Message-Id: <1306314599-19233-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

It's "include/linux/vermagic.h", not "include/vermagic.h"

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 scripts/Makefile.modpost |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 56dfafc..08dce14 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -18,7 +18,7 @@
 
 # Step 3 is used to place certain information in the module's ELF
 # section, including information such as:
-#   Version magic (see include/vermagic.h for full details)
+#   Version magic (see include/linux/vermagic.h for full details)
 #     - Kernel release
 #     - SMP is CONFIG_SMP
 #     - PREEMPT is CONFIG_PREEMPT
-- 
1.7.0.4

