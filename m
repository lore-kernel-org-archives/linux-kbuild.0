Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:33366 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755153AbbFRMwY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Jun 2015 08:52:24 -0400
Received: by lbbvz5 with SMTP id vz5so3492405lbb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2015 05:52:22 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH] tools/lib: improve clean target
Date: Thu, 18 Jun 2015 15:52:18 +0300
Message-Id: <1434631938-12681-1-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: acme@kernel.org, mingo@redhat.com, a.p.zijlstra@chello.nl, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

The clean targets miss some .cmd and .d files.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 tools/lib/api/Makefile        | 2 +-
 tools/lib/traceevent/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index 8bd9606..fe1b02c 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -36,7 +36,7 @@ $(LIBFILE): $(API_IN)
 
 clean:
 	$(call QUIET_CLEAN, libapi) $(RM) $(LIBFILE); \
-	find $(if $(OUTPUT),$(OUTPUT),.) -name \*.o | xargs $(RM)
+	find $(if $(OUTPUT),$(OUTPUT),.) -name \*.o -or -name \*.o.cmd -or -name \*.o.d | xargs $(RM)
 
 FORCE:
 
diff --git a/tools/lib/traceevent/Makefile b/tools/lib/traceevent/Makefile
index 6daaff6..7851df1 100644
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
2.1.4

