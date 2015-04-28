Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33707 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030267AbbD1Nbq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 09:31:46 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH 06/64] tools build: Fix Makefile(s) to properly invoke tools build
Date: Tue, 28 Apr 2015 10:29:58 -0300
Message-Id: <1430227856-25825-7-git-send-email-acme@kernel.org>
In-Reply-To: <1430227856-25825-1-git-send-email-acme@kernel.org>
References: <1430227856-25825-1-git-send-email-acme@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Jiri Olsa <jolsa@kernel.org>

Several fixes were needed to allow following builds:
  $ make tools/tmon
  $ make -C <kernelsrc> tools/perf
  $ make -C <kernelsrc>/tools perf

 - some of the tools (perf) use same make variables as in
   kernel build, unsetting srctree and objtree
 - using original $(O) for O variable
 - perf build does not follow the descend function setup
   invoking it via it's own make rule

I tried the rest of the tools/Makefile targets and they
seem to work now.

Reported-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Ahern <dsahern@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org
Link: http://lkml.kernel.org/r/1429389280-18720-3-git-send-email-jolsa@kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 Makefile       |  5 ++---
 tools/Makefile | 12 +++++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index da36a3be7969..b1ca0607ed2e 100644
--- a/Makefile
+++ b/Makefile
@@ -214,7 +214,6 @@ VPATH		:= $(srctree)$(if $(KBUILD_EXTMOD),:$(KBUILD_EXTMOD))
 
 export srctree objtree VPATH
 
-
 # SUBARCH tells the usermode build what the underlying arch is.  That is set
 # first, and if a usermode build is happening, the "ARCH=um" on the command
 # line overrides the setting of ARCH below.  If a native build is happening,
@@ -1504,11 +1503,11 @@ image_name:
 # Clear a bunch of variables before executing the submake
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(objtree) subdir=tools -C $(src)/tools/
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(O) subdir=tools -C $(src)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(objtree) subdir=tools -C $(src)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(O) subdir=tools -C $(src)/tools/ $*
 
 # Single targets
 # ---------------------------------------------------------------------------
diff --git a/tools/Makefile b/tools/Makefile
index 01995cc8ac44..b35102721cbb 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -1,3 +1,8 @@
+# Some of the tools (perf) use same make variables
+# as in kernel build.
+export srctree=
+export objtree=
+
 include scripts/Makefile.include
 
 help:
@@ -50,8 +55,13 @@ liblockdep: FORCE
 libapi: FORCE
 	$(call descend,lib/api)
 
+# The perf build does not follow the descend function setup,
+# invoking it via it's own make rule.
+PERF_O   = $(if $(O),$(O)/tools/perf,)
+
 perf: FORCE
-	$(call descend,$@)
+	$(Q)mkdir -p $(PERF_O) .
+	$(Q)$(MAKE) --no-print-directory -C perf O=$(PERF_O) subdir=
 
 selftests: FORCE
 	$(call descend,testing/$@)
-- 
1.9.3

