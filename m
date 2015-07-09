Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:34858 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752950AbbGIPq3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Jul 2015 11:46:29 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH 3/4] tools lib: Improve clean target
Date: Thu,  9 Jul 2015 12:45:20 -0300
Message-Id: <1436456721-9048-4-git-send-email-acme@kernel.org>
In-Reply-To: <1436456721-9048-1-git-send-email-acme@kernel.org>
References: <1436456721-9048-1-git-send-email-acme@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Riku Voipio <riku.voipio@linaro.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-kbuild@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Riku Voipio <riku.voipio@linaro.org>

The clean targets miss some .cmd and .d files.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: linux-kbuild@vger.kernel.org
Link: http://lkml.kernel.org/r/1434631938-12681-1-git-send-email-riku.voipio@linaro.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/lib/api/Makefile        | 2 +-
 tools/lib/traceevent/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index 8bd960658463..fe1b02c2c95b 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -36,7 +36,7 @@ $(LIBFILE): $(API_IN)
 
 clean:
 	$(call QUIET_CLEAN, libapi) $(RM) $(LIBFILE); \
-	find $(if $(OUTPUT),$(OUTPUT),.) -name \*.o | xargs $(RM)
+	find $(if $(OUTPUT),$(OUTPUT),.) -name \*.o -or -name \*.o.cmd -or -name \*.o.d | xargs $(RM)
 
 FORCE:
 
diff --git a/tools/lib/traceevent/Makefile b/tools/lib/traceevent/Makefile
index 6daaff652aff..7851df1490e0 100644
--- a/tools/lib/traceevent/Makefile
+++ b/tools/lib/traceevent/Makefile
@@ -268,7 +268,7 @@ install: install_lib
 
 clean:
 	$(call QUIET_CLEAN, libtraceevent) \
-		$(RM) *.o *~ $(TARGETS) *.a *.so $(VERSION_FILES) .*.d \
+		$(RM) *.o *~ $(TARGETS) *.a *.so $(VERSION_FILES) .*.d .*.cmd \
 		$(RM) TRACEEVENT-CFLAGS tags TAGS
 
 PHONY += force plugins
-- 
2.1.0

