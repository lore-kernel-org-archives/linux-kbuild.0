Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:27716 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753263AbbC0LoM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Mar 2015 07:44:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/4] kbuild: ia64: use $(src)/Makefile.gate rather than particular path
Date: Fri, 27 Mar 2015 20:43:38 +0900
Message-Id: <1427456618-23830-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1427456618-23830-1-git-send-email-yamada.masahiro@socionext.com>
References: <1427456618-23830-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, linux-kernel@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/ia64/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/ia64/kernel/Makefile b/arch/ia64/kernel/Makefile
index 47e8aff..d68b5cf 100644
--- a/arch/ia64/kernel/Makefile
+++ b/arch/ia64/kernel/Makefile
@@ -51,7 +51,7 @@ obj-$(CONFIG_BINFMT_ELF)	+= elfcore.o
 CFLAGS_traps.o  += -mfixed-range=f2-f5,f16-f31
 
 # The gate DSO image is built using a special linker script.
-include arch/ia64/kernel/Makefile.gate
+include $(src)/Makefile.gate
 # tell compiled for native
 CPPFLAGS_gate.lds += -D__IA64_GATE_PARAVIRTUALIZED_NATIVE
 
-- 
1.9.1

