Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt13.smtp-out.videotron.ca ([135.19.0.26]:36546 "EHLO
	alt12.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751557AbcCDFz6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Mar 2016 00:55:58 -0500
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v5 7/8] kbuild: build sample modules along with the rest of the kernel
Date: Fri,  4 Mar 2016 00:40:49 -0500
Message-Id: <1457070050-1564-8-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1457070050-1564-1-git-send-email-nicolas.pitre@linaro.org>
References: <1457070050-1564-1-git-send-email-nicolas.pitre@linaro.org>
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

