Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt13.smtp-out.videotron.ca ([135.19.0.26]:16426 "EHLO
	alt12.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754553AbcCNCnF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Mar 2016 22:43:05 -0400
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v6 7/8] kbuild: build sample modules along with the rest of the kernel
Date: Sun, 13 Mar 2016 22:42:15 -0400
Message-Id: <1457923336-2732-8-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
References: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
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
index bb865095ca..f5daa4bbf3 100644
--- a/Makefile
+++ b/Makefile
@@ -928,9 +928,6 @@ endif
 ifdef CONFIG_HEADERS_CHECK
 	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
 endif
-ifdef CONFIG_SAMPLES
-	$(Q)$(MAKE) $(build)=samples
-endif
 ifdef CONFIG_BUILD_DOCSRC
 	$(Q)$(MAKE) $(build)=Documentation
 endif
@@ -948,6 +945,11 @@ PHONY += autoksyms_recursive
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
2.5.0

