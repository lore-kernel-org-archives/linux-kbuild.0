Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:23459 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752562Ab0HTJgw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Aug 2010 05:36:52 -0400
Date: Fri, 20 Aug 2010 05:36:06 -0400
From: Amerigo Wang <amwang@redhat.com>
Message-Id: <20100820094028.6321.95741.sendpatchset@localhost.localdomain>
Subject: [Patch] makefile: not need to regenerate kernel.release file when make kernelrelease
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Brice Goglin <Brice.Goglin@inria.fr>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, Amerigo Wang <amwang@redhat.com>, Michal Marek <mmarek@suse.cz>


Brice reported that 'kernelrelease' has a dependence on include/config/kernel.release,
causes this file to be regenerated every time when invoke it. It doesn't have to.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Tested-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: WANG Cong <amwang@redhat.com>

---
diff --git a/Makefile b/Makefile
index f3bdff8..25da252 100644
--- a/Makefile
+++ b/Makefile
@@ -1408,8 +1408,8 @@ checkstack:
 	$(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
 	$(PERL) $(src)/scripts/checkstack.pl $(CHECKSTACK_ARCH)
 
-kernelrelease: include/config/kernel.release
-	@echo $(KERNELRELEASE)
+kernelrelease:
+	@echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
 
 kernelversion:
 	@echo $(KERNELVERSION)
