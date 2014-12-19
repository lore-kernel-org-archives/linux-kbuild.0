Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:40434 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751382AbaLSPUh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Dec 2014 10:20:37 -0500
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH] kconfig: improve handling EOF
Date: Fri, 19 Dec 2014 17:20:30 +0200
Message-Id: <1419002430-164635-1-git-send-email-kirill.shutemov@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr
Cc: alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

The patch fixes two EOF-related issues in kconfig lexer:

1. End of file is not valid end of string token. Currently we happily
   accept something like

	config FOO
		bool "Bar

   If there's EOF just after '"Bar' without newline.

2. Kconfig produces obscure error message if we miss newline at the end
   of file. Testcase:

	% echo -n 'if FOO\nendif' >> drivers/Kconfig
	% make allmodconfig
	...
	drivers/Kconfig:191: 'endif' in different file than 'if'
	drivers/Kconfig:191: location of the 'if'
	scripts/kconfig/Makefile:80: recipe for target 'allmodconfig' failed
	make[1]: *** [allmodconfig] Error 1
	Makefile:558: recipe for target 'allmodconfig' failed
	make: *** [allmodconfig] Error 2

   We can fix it if forbid EOF form <PARAM> context.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 kernel/Kconfig.preempt  | 2 +-
 scripts/kconfig/zconf.l | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 3f9c97419f02..037284c5f723 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -55,4 +55,4 @@ config PREEMPT
 endchoice
 
 config PREEMPT_COUNT
-       bool
\ No newline at end of file
+       bool
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 6c62d93b4ffb..001abe8df6ce 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -143,7 +143,9 @@ n	[A-Za-z0-9_]
 	\\\n	current_file->lineno++;
 	.
 	<<EOF>> {
-		BEGIN(INITIAL);
+		printf("%s:%d: no newline at end of file\n",
+				zconf_curname(), zconf_lineno());
+		exit(1);
 	}
 }
 
@@ -179,7 +181,9 @@ n	[A-Za-z0-9_]
 		return T_EOL;
 	}
 	<<EOF>>	{
-		BEGIN(INITIAL);
+		printf("%s:%d: unexpected end of file\n",
+				zconf_curname(), zconf_lineno());
+		exit(1);
 	}
 }
 
-- 
2.1.3

