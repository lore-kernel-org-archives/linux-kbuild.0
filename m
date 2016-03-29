Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt22.smtp-out.videotron.ca ([70.80.0.73]:35463 "EHLO
	alt22.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754384AbcC2UpM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Mar 2016 16:45:12 -0400
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v7 7/8] kbuild: build sample modules along with the rest of the kernel
Date: Tue, 29 Mar 2016 16:44:41 -0400
Message-Id: <1459284282-6676-8-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1459284282-6676-1-git-send-email-nicolas.pitre@linaro.org>
References: <1459284282-6676-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Make sample modules in parallel with the rest of the kernel rather
than having them built from the vmlinux target. This makes the build
slightly faster, and those modules are properly considered when
adjust_autoksyms.sh is executed.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9f93d2595d..cec9539d30 100644
--- a/Makefile
+++ b/Makefile
@@ -940,9 +940,6 @@ endif
 ifdef CONFIG_HEADERS_CHECK
 	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
 endif
-ifdef CONFIG_SAMPLES
-	$(Q)$(MAKE) $(build)=samples
-endif
 ifdef CONFIG_BUILD_DOCSRC
 	$(Q)$(MAKE) $(build)=Documentation
 endif
@@ -960,6 +957,11 @@ PHONY += autoksyms_recursive
 include/generated/autoksyms.h: FORCE
 	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh true
 
+# Build samples along the rest of the kernel
+ifdef CONFIG_SAMPLES
+vmlinux-dirs += samples
+endif
+
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
 $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
-- 
2.5.5

