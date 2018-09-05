Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:2871 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727364AbeIFDIu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 23:08:50 -0400
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: [RFC 1/2] tracing/Makefile: fix handling redefinition of CC_FLAGS_FTRACE
Date: Wed,  5 Sep 2018 15:35:59 -0700
Message-Id: <20180905223600.20994-1-paulo.r.zanoni@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Michal Marek <michal.lkml@markovi.net>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>

As a Kernel developer, I make heavy use of "make targz-pkg" in order
to locally compile and remotely install my development Kernels. The
nice feature I rely on is that after a normal "make", "make targz-pkg"
only generates the tarball without having to recompile everything.

That was true until commit f28bc3c32c05 ("tracing: Handle
CC_FLAGS_FTRACE more accurately"). After it, running "make targz-pkg"
after "make" will recompile the whole Kernel tree, making my
development workflow much slower.

The Kernel is choosing to recompile everything because it claims the
command line has changed. A diff of the .cmd files show a repeated
-mfentry in one of the files. It seems that something on make
targz-pkg triggers the double -mfentry but not the double -pg.

So this patch attempts to deal with that problem by handling -mfentry
and others just like we handle -pg: don't append them if
CC_FLAGS_FTRACE is already defined. I'm not a Makefile expert and so I
can't claim this won't break anything else, hopefully if this patch
gets applied it will have a Reviewed-by tag from some actual Makefile
expert. I can claim this patch fixes the specific regression I
reported.

Fixes: commit f28bc3c32c05 ("tracing: Handle CC_FLAGS_FTRACE more
 accurately")
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 Makefile | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 19948e556941..2c8df481b4f1 100644
--- a/Makefile
+++ b/Makefile
@@ -755,28 +755,30 @@ KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
 endif
 
 ifdef CONFIG_FUNCTION_TRACER
-ifndef CC_FLAGS_FTRACE
-CC_FLAGS_FTRACE := -pg
-endif
+cc_flags_ftrace_ := -pg
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
   # gcc 5 supports generating the mcount tables directly
   ifeq ($(call cc-option-yn,-mrecord-mcount),y)
-    CC_FLAGS_FTRACE	+= -mrecord-mcount
+    cc_flags_ftrace_	+= -mrecord-mcount
     export CC_USING_RECORD_MCOUNT := 1
   endif
   ifdef CONFIG_HAVE_NOP_MCOUNT
     ifeq ($(call cc-option-yn, -mnop-mcount),y)
-      CC_FLAGS_FTRACE	+= -mnop-mcount
+      cc_flags_ftrace_	+= -mnop-mcount
       CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
     endif
   endif
 endif
 ifdef CONFIG_HAVE_FENTRY
   ifeq ($(call cc-option-yn, -mfentry),y)
-    CC_FLAGS_FTRACE	+= -mfentry
+    cc_flags_ftrace_	+= -mfentry
     CC_FLAGS_USING	+= -DCC_USING_FENTRY
   endif
 endif
+
+ifndef CC_FLAGS_FTRACE
+  CC_FLAGS_FTRACE := $(cc_flags_ftrace_)
+endif
 export CC_FLAGS_FTRACE
 KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
 KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
-- 
2.17.1
