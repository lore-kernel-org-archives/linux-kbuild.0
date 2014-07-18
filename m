Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta08.emeryville.ca.mail.comcast.net ([76.96.30.80]:32783 "EHLO
	qmta08.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1762181AbaGRUoj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Jul 2014 16:44:39 -0400
From: Shuah Khan <shuah.kh@samsung.com>
Subject: [PATCH] kbuild: devtest - new make target for build all and run tests
Date: Fri, 18 Jul 2014 14:44:34 -0600
Message-Id: <1405716274-24420-1-git-send-email-shuah.kh@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, gregkh@linuxfoundation.org
Cc: Shuah Khan <shuah.kh@samsung.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Add a new devtest make target to enable developer testing. This
new target does full build (make all) and then runs selftests.

Signed-off-by: Shuah Khan <shuah.kh@samsung.com>
---
 Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Makefile b/Makefile
index f3c543d..1ef3128 100644
--- a/Makefile
+++ b/Makefile
@@ -1034,6 +1034,14 @@ headers_check: headers_install
 	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi/asm $(hdr-dst) HDRCHECK=1
 
 # ---------------------------------------------------------------------------
+# Kernel devtest
+
+PHONY += devtest
+devtest:
+	make all
+	make -C tools/testing/selftests run_tests
+
+# ---------------------------------------------------------------------------
 # Modules
 
 ifdef CONFIG_MODULES
@@ -1236,6 +1244,9 @@ help:
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@$(MAKE) -f $(srctree)/scripts/Makefile.help checker-help
 	@echo  ''
+	@echo  'Developer test'
+	@echo  '  devtest      - Build all and run tests'
+	@echo  ''
 	@echo  'Kernel packaging:'
 	@$(MAKE) $(build)=$(package-dir) help
 	@echo  ''
-- 
1.9.1

