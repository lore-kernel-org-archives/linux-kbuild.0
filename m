Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:62932 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752840Ab2LVB6s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Dec 2012 20:58:48 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] Makefile: Make checkstack work with O= builds
Date: Fri, 21 Dec 2012 17:58:45 -0800
Message-Id: <1356141525-25162-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org

The vmlinux doesn't always live in the same directory as the
source files and so 'make O=obj checkstack' fails with a missing
vmlinux file. Fix checkstack so that this is possible.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

It would also be nice if this depended on vmlinux and modules being built
already but I couldn't figure that part out.

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4fe0559..54a386b 100644
--- a/Makefile
+++ b/Makefile
@@ -1318,7 +1318,7 @@ else
 CHECKSTACK_ARCH := $(ARCH)
 endif
 checkstack:
-	$(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
+	$(OBJDUMP) -d $(objtree)/vmlinux $$(find $(objtree) -name '*.ko') | \
 	$(PERL) $(src)/scripts/checkstack.pl $(CHECKSTACK_ARCH)
 
 kernelrelease:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

