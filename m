Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:11241 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755809Ab2EHSX4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 May 2012 14:23:56 -0400
From: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Subject: [PATCH 16/23] x86, realmode: Fix always-zero test in reboot_32.S
Date: Tue,  8 May 2012 21:22:39 +0300
Message-Id: <1336501366-28617-17-git-send-email-jarkko.sakkinen@intel.com>
In-Reply-To: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com>
References: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>, hpa@linux.intel.com

From: "H. Peter Anvin" <hpa@linux.intel.com>

A test instruction is an "and", and an and with zero is always zero.
This would cause us to always take the BIOS path, not the APM path, in
case anyone actually cares...

Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
---
 arch/x86/realmode/rm/reboot_32.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/realmode/rm/reboot_32.S b/arch/x86/realmode/rm/reboot_32.S
index e90f8c4..50ba994 100644
--- a/arch/x86/realmode/rm/reboot_32.S
+++ b/arch/x86/realmode/rm/reboot_32.S
@@ -85,7 +85,7 @@ machine_real_restart_asm16:
 	movl	%edx, %cr0
 	LJMPW_RM(3f)
 3:
-	testb	$0, %al
+	andw	%ax, %ax
 	jz	bios
 
 apm:
-- 
1.7.9.5

