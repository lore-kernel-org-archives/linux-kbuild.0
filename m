Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:38252 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932913Ab0BYTT4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Feb 2010 14:19:56 -0500
Message-Id: <20100225191955.067104166@goodmis.org>
Date: Thu, 25 Feb 2010 14:18:00 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 5/5] kconfig: Simplify LSMOD= handling
References: <20100225191755.483925025@goodmis.org>
Content-Disposition: inline; filename=0005-kconfig-Simplify-LSMOD-handling.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

From: Michal Marek <mmarek@suse.cz>

Signed-off-by: Michal Marek <mmarek@suse.cz>
LKML-Reference: <20100203162014.GA10956@sepie.suse.cz>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/kconfig/Makefile |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 85b9065..186c466 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -32,11 +32,10 @@ silentoldconfig: $(obj)/conf
 
 # if no path is given, then use src directory to find file
 ifdef LSMOD
-LSMOD_F = $(shell if [ `basename $(LSMOD)` == $(LSMOD) ]; then \
-		echo $(objtree)/$(LSMOD);			\
-	else							\
-		echo $(LSMOD);					\
-	fi)
+LSMOD_F := $(LSMOD)
+ifeq ($(findstring /,$(LSMOD)),)
+  LSMOD_F := $(objtree)/$(LSMOD)
+endif
 endif
 
 localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
-- 
1.6.5


