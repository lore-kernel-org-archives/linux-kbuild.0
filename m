Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt13.smtp-out.videotron.ca ([135.19.0.26]:48439 "EHLO
	alt12.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754526AbcCNCnE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Mar 2016 22:43:04 -0400
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v6 8/8] kconfig option for TRIM_UNUSED_KSYMS
Date: Sun, 13 Mar 2016 22:42:16 -0400
Message-Id: <1457923336-2732-9-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
References: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The config option to enable it all.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Acked-by: Rusty Russell <rusty@rustcorp.com.au>
---
 init/Kconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 22320804fb..e6f666331b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1990,6 +1990,22 @@ config MODULE_COMPRESS_XZ
 
 endchoice
 
+config TRIM_UNUSED_KSYMS
+	bool "Trim unused exported kernel symbols"
+	depends on MODULES && !UNUSED_SYMBOLS
+	help
+	  The kernel and some modules make many symbols available for
+	  other modules to use via EXPORT_SYMBOL() and variants. Depending
+	  on the set of modules being selected in your kernel configuration,
+	  many of those exported symbols might never be used.
+
+	  This option allows for unused exported symbols to be dropped from
+	  the build. In turn, this provides the compiler more opportunities
+	  (especially when using LTO) for optimizing the code and reducing
+	  binary size.  This might have some security advantages as well.
+
+	  If unsure say N.
+
 endif # MODULES
 
 config MODULES_TREE_LOOKUP
-- 
2.5.0

