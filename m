Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:12903 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755984AbaBRO3s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:29:48 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 07/20] lto: Don't let LATENCYTOP and LOCKDEP select KALLSYMS_ALL
Date: Tue, 18 Feb 2014 15:28:45 +0100
Message-Id: <1392733738-8290-8-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

KALLSYMS_ALL enables including data variables into KALLSYMS.
With plain KALLSYMS only functions are included.

LATENCYTOP and LOCKDEP select KALLSYMS_ALL in addition to KALLSYMS.
It's unclear what they actually need _ALL for; they should
only need function backtraces and afaik never touch variables.

LTO currently does not support KALLSYMS_ALL, which prevents
LATENCYTOP and LOCKDEP from working and gives Kconfig errors.
Disable the requirement for KALLSYMS_ALL for them, just use
KALLSYMS.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 lib/Kconfig.debug | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a48abea..5cbf0c5 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -928,7 +928,6 @@ config LOCKDEP
 	select STACKTRACE
 	select FRAME_POINTER if !MIPS && !PPC && !ARM_UNWIND && !S390 && !MICROBLAZE && !ARC
 	select KALLSYMS
-	select KALLSYMS_ALL
 
 config LOCK_STAT
 	bool "Lock usage statistics"
@@ -1396,7 +1395,6 @@ config LATENCYTOP
 	depends on PROC_FS
 	select FRAME_POINTER if !MIPS && !PPC && !S390 && !MICROBLAZE && !ARM_UNWIND && !ARC
 	select KALLSYMS
-	select KALLSYMS_ALL
 	select STACKTRACE
 	select SCHEDSTATS
 	select SCHED_DEBUG
-- 
1.8.5.2

