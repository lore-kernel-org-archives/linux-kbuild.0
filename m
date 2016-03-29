Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt32.smtp-out.videotron.ca ([24.53.0.21]:22337 "EHLO
	alt32.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754566AbcC2UpM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Mar 2016 16:45:12 -0400
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v7 8/8] kconfig option for TRIM_UNUSED_KSYMS
Date: Tue, 29 Mar 2016 16:44:42 -0400
Message-Id: <1459284282-6676-9-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1459284282-6676-1-git-send-email-nicolas.pitre@linaro.org>
References: <1459284282-6676-1-git-send-email-nicolas.pitre@linaro.org>
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
index e0d2616243..29d74d3f80 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2012,6 +2012,22 @@ config MODULE_COMPRESS_XZ
 
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
2.5.5

