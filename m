Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:58134 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932844AbcDYPhQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 11:37:16 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/5] Kbuild: change CC_OPTIMIZE_FOR_SIZE definition
Date: Mon, 25 Apr 2016 17:35:27 +0200
Message-Id: <1461598531-2190169-2-git-send-email-arnd@arndb.de>
In-Reply-To: <1461598531-2190169-1-git-send-email-arnd@arndb.de>
References: <1461598531-2190169-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

CC_OPTIMIZE_FOR_SIZE disables the often useful -Wmaybe-unused warning,
because that causes a ridiculous amount of false positives when combined
with -Os.

This means a lot of warnings don't show up in testing by the developers
that should see them with an 'allmodconfig' kernel that has
CC_OPTIMIZE_FOR_SIZE enabled, but only later in randconfig builds
that don't.

This changes the Kconfig logic around CC_OPTIMIZE_FOR_SIZE to make
it a 'choice' statement defaulting to CC_OPTIMIZE_FOR_PERFORMANCE
that gets added for this purpose. The allmodconfig and allyesconfig
kernels now default to -O2 with the maybe-unused warning enabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 init/Kconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 0c666408a8b6..d1b766bf60c1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1284,6 +1284,17 @@ source "usr/Kconfig"
 
 endif
 
+choice
+	prompt "Compiler optimization level"
+	default CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
+
+config CC_OPTIMIZE_FOR_PERFORMANCE
+	bool "Optimize for performance"
+	help
+	  This is the default optimization level for the kernel, building
+	  with the "-O2" compiler flag for best performance and most
+	  helpful compile-time warnings.
+
 config CC_OPTIMIZE_FOR_SIZE
 	bool "Optimize for size"
 	help
@@ -1292,6 +1303,8 @@ config CC_OPTIMIZE_FOR_SIZE
 
 	  If unsure, say N.
 
+endchoice
+
 config SYSCTL
 	bool
 
-- 
2.7.0

