Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42841 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758949AbYAXWDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:53 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 40/77] kconfig: fix whitespace and sort includes in conf.c
Date: Thu, 24 Jan 2008 23:03:21 +0100
Message-Id: <1201212238-4369-40-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ladislav Michl <ladis@linux-mips.org>, Sam Ravnborg <sam@ravnborg.org>, Roman@ravnborg.org, "Zippel <zippel"@linux-m68k.org

From: Ladislav Michl <ladis@linux-mips.org>

Sort includes and remove leading whitespace.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org
---
 scripts/kconfig/conf.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index d4737d3..a3d2d0b 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -4,11 +4,11 @@
  */
 
 #include <ctype.h>
-#include <stdlib.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
-#include <unistd.h>
 #include <time.h>
+#include <unistd.h>
 #include <sys/stat.h>
 
 #define LKC_DIRECT_LINK
@@ -160,7 +160,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		}
 	case set_random:
 		do {
-			val = (tristate)(random() % 3);
+			val = (tristate)(rand() % 3);
 		} while (!sym_tristate_within_range(sym, val));
 		switch (val) {
 		case no: line[0] = 'n'; break;
-- 
1.5.4.rc3.14.g44397

