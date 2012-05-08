Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:11241 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755586Ab2EHSXu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 May 2012 14:23:50 -0400
From: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Subject: [PATCH 11/23] x86, realmode: Align .data section in trampoline_32.S
Date: Tue,  8 May 2012 21:22:34 +0300
Message-Id: <1336501366-28617-12-git-send-email-jarkko.sakkinen@intel.com>
In-Reply-To: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com>
References: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>, hpa@linux.intel.com

From: "H. Peter Anvin" <hpa@linux.intel.com>

Specify the alignment of the .data section in trampoline_32.S.

Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
---
 arch/x86/realmode/rm/trampoline_32.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/realmode/rm/trampoline_32.S b/arch/x86/realmode/rm/trampoline_32.S
index 18cb7fc..1f9e331 100644
--- a/arch/x86/realmode/rm/trampoline_32.S
+++ b/arch/x86/realmode/rm/trampoline_32.S
@@ -68,7 +68,7 @@ trampoline_data:
 
 	.data
 	.globl startup_32_smp, boot_gdt, trampoline_status
-
+	.balign	4
 boot_gdt_descr:
 	.word	__BOOT_DS + 7			# gdt limit
 boot_gdt:
-- 
1.7.9.5

