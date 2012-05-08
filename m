Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:11241 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755495Ab2EHSX4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 May 2012 14:23:56 -0400
From: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Subject: [PATCH 15/23] x86, realmode: Move trampoline_*.S early in the link order
Date: Tue,  8 May 2012 21:22:38 +0300
Message-Id: <1336501366-28617-16-git-send-email-jarkko.sakkinen@intel.com>
In-Reply-To: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com>
References: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>, hpa@linux.intel.com

From: "H. Peter Anvin" <hpa@linux.intel.com>

Move trampoline_*.S earlier in the link order so it ends up being
first in the text segment; since the SIPI vector requires 4K alignment
it otherwise ends up padding the .text segment with that much
completely unnecessarily.

Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
---
 arch/x86/realmode/rm/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index 2432acb..2423142 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -12,8 +12,8 @@ subdir- := wakeup
 always := realmode.bin
 
 realmode-y			+= header.o
-realmode-$(CONFIG_X86_32)	+= reboot_32.o
 realmode-y			+= trampoline_$(BITS).o
+realmode-$(CONFIG_X86_32)	+= reboot_32.o
 realmode-$(CONFIG_ACPI_SLEEP)	+= wakeup/wakeup.o
 
 targets	+= $(realmode-y)
-- 
1.7.9.5

