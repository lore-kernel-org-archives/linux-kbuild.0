Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:54699 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936249AbdJQPS4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 11:18:56 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] Makefile: add targets for config-help and pkg-help
Date: Tue, 17 Oct 2017 09:18:48 -0600
Message-Id: <20171017151848.3087-1-shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, rdunlap@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Change to enable config help and package help from the main make level
to make it easier to use. It has become difficult to find config help
and pkg help specific output from the "help" information.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 46bfb0ed2257..1d6f86df1b6c 100644
--- a/Makefile
+++ b/Makefile
@@ -1441,6 +1441,13 @@ help:
 	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
 	@echo  'For further info see the ./README file'
 
+PHONY += config-help
+config-help:
+	@$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
+
+PHONY += pkg-help
+pkg-help:
+	@$(MAKE) $(build)=$(package-dir) help
 
 help-board-dirs := $(addprefix help-,$(board-dirs))
 
-- 
2.11.0

