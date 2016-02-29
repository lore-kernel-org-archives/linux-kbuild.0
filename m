Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:26877 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755970AbcB2Ds0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Feb 2016 22:48:26 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v4 7/8] kbuild: build sample modules along with the rest of the
 kernel
Date: Sun, 28 Feb 2016 22:48:10 -0500
Message-id: <1456717691-28298-8-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
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

