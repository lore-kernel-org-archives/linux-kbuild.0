Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37436 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758842AbYAXWDu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:50 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 14/77] kbuild: declare the modpost error functions as printf like
Date: Thu, 24 Jan 2008 23:02:55 +0100
Message-Id: <1201212238-4369-14-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <ak@suse.de>, Sam Ravnborg <sam@ravnborg.org>

From: Andi Kleen <ak@suse.de>

This way gcc can warn for wrong format strings
Signed-off-by: Andi Kleen <ak@suse.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mod/modpost.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 93ac52a..3a12c22 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -33,7 +33,9 @@ enum export {
 	export_unused_gpl, export_gpl_future, export_unknown
 };
 
-void fatal(const char *fmt, ...)
+#define PRINTF __attribute__ ((format (printf, 1, 2)))
+
+PRINTF void fatal(const char *fmt, ...)
 {
 	va_list arglist;
 
@@ -46,7 +48,7 @@ void fatal(const char *fmt, ...)
 	exit(1);
 }
 
-void warn(const char *fmt, ...)
+PRINTF void warn(const char *fmt, ...)
 {
 	va_list arglist;
 
@@ -57,7 +59,7 @@ void warn(const char *fmt, ...)
 	va_end(arglist);
 }
 
-void merror(const char *fmt, ...)
+PRINTF void merror(const char *fmt, ...)
 {
 	va_list arglist;
 
-- 
1.5.4.rc3.14.g44397

