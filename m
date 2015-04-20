Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:34415 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754789AbbDTMnD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2015 08:43:03 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] tools/lib/api/Makefile: Add feature check for _FORTIFY_SOURCE
Date: Mon, 20 Apr 2015 14:01:19 +0200
Message-ID: <ghlhhnf0j2.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

For example on Gentoo systems where _FORTIFY_SOURCE is set by default,
`make -C tools/perf' fails, because of the macro being redefined.

Fix that by a feature-check analogous to tools/perf/config/Makefile.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 tools/lib/api/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index d8fe29f..acf9097 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -16,7 +16,14 @@ MAKEFLAGS += --no-print-directory
 LIBFILE = $(OUTPUT)libapi.a
 
 CFLAGS := $(EXTRA_WARNINGS) $(EXTRA_CFLAGS)
-CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -D_FORTIFY_SOURCE=2 -fPIC
+CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -fPIC
+
+ifeq ($(DEBUG),0)
+  ifeq ($(feature-fortify-source), 1)
+    CFLAGS += -D_FORTIFY_SOURCE=2
+  endif
+endif
+
 CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 
 RM = rm -f
-- 
2.3.5

