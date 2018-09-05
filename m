Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:2871 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727621AbeIFDIv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 23:08:51 -0400
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: [RFC 2/2] tracing/Makefile: reindent the CONFIG_FUNCTION_TRACER chunk
Date: Wed,  5 Sep 2018 15:36:00 -0700
Message-Id: <20180905223600.20994-2-paulo.r.zanoni@intel.com>
In-Reply-To: <20180905223600.20994-1-paulo.r.zanoni@intel.com>
References: <20180905223600.20994-1-paulo.r.zanoni@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>, Steven Rostedt <rostedt@goodmis.org>

The whole block was lacking an indent level for the
CONFIG_FUNCTION_TRACER ifdef, which made the code a little harder to
read. Add the missing indent level and also document the endif for
easier reading.

At the very end some tabs were replaced with spaces. My small
understanding of Makefiles suggests that spaces are the appropriate
characters here.

Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 Makefile | 60 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/Makefile b/Makefile
index 2c8df481b4f1..dce0f7330038 100644
--- a/Makefile
+++ b/Makefile
@@ -755,40 +755,40 @@ KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
 endif
 
 ifdef CONFIG_FUNCTION_TRACER
-cc_flags_ftrace_ := -pg
-ifdef CONFIG_FTRACE_MCOUNT_RECORD
-  # gcc 5 supports generating the mcount tables directly
-  ifeq ($(call cc-option-yn,-mrecord-mcount),y)
-    cc_flags_ftrace_	+= -mrecord-mcount
-    export CC_USING_RECORD_MCOUNT := 1
-  endif
-  ifdef CONFIG_HAVE_NOP_MCOUNT
-    ifeq ($(call cc-option-yn, -mnop-mcount),y)
-      cc_flags_ftrace_	+= -mnop-mcount
-      CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
+  cc_flags_ftrace_ := -pg
+  ifdef CONFIG_FTRACE_MCOUNT_RECORD
+    # gcc 5 supports generating the mcount tables directly
+    ifeq ($(call cc-option-yn,-mrecord-mcount),y)
+      cc_flags_ftrace_	+= -mrecord-mcount
+      export CC_USING_RECORD_MCOUNT := 1
+    endif
+    ifdef CONFIG_HAVE_NOP_MCOUNT
+      ifeq ($(call cc-option-yn, -mnop-mcount),y)
+        cc_flags_ftrace_	+= -mnop-mcount
+        CC_FLAGS_USING		+= -DCC_USING_NOP_MCOUNT
+      endif
     endif
   endif
-endif
-ifdef CONFIG_HAVE_FENTRY
-  ifeq ($(call cc-option-yn, -mfentry),y)
-    cc_flags_ftrace_	+= -mfentry
-    CC_FLAGS_USING	+= -DCC_USING_FENTRY
+  ifdef CONFIG_HAVE_FENTRY
+    ifeq ($(call cc-option-yn, -mfentry),y)
+      cc_flags_ftrace_	+= -mfentry
+      CC_FLAGS_USING	+= -DCC_USING_FENTRY
+    endif
   endif
-endif
 
-ifndef CC_FLAGS_FTRACE
-  CC_FLAGS_FTRACE := $(cc_flags_ftrace_)
-endif
-export CC_FLAGS_FTRACE
-KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
-KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
-ifdef CONFIG_DYNAMIC_FTRACE
-	ifdef CONFIG_HAVE_C_RECORDMCOUNT
-		BUILD_C_RECORDMCOUNT := y
-		export BUILD_C_RECORDMCOUNT
-	endif
-endif
-endif
+  ifndef CC_FLAGS_FTRACE
+    CC_FLAGS_FTRACE := $(cc_flags_ftrace_)
+  endif
+  export CC_FLAGS_FTRACE
+  KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
+  KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
+  ifdef CONFIG_DYNAMIC_FTRACE
+    ifdef CONFIG_HAVE_C_RECORDMCOUNT
+      BUILD_C_RECORDMCOUNT := y
+      export BUILD_C_RECORDMCOUNT
+    endif
+  endif
+endif # CONFIG_FUNCTION_TRACER
 
 # We trigger additional mismatches with less inlining
 ifdef CONFIG_DEBUG_SECTION_MISMATCH
-- 
2.17.1
