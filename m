Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:55058 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752459AbdK0Veg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:36 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 11/21] trace: Use -mcount-record for dynamic ftrace
Date: Mon, 27 Nov 2017 13:34:13 -0800
Message-Id: <20171127213423.27218-12-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, rostedt@goodmis.org

From: Andi Kleen <ak@linux.intel.com>

gcc 5 supports a new -mcount-record option to generate ftrace
tables directly. This avoids the need to run record_mcount
manually.

Use this option when available.

So far doesn't use -mcount-nop, which also exists now.

This is needed to make ftrace work with LTO because the
normal record-mcount script doesn't run over the link
time output.

It should also improve build times slightly in the general
case.

Cc: rostedt@goodmis.org
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/Makefile.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index cb8997ed0149..8179563bcd85 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -219,6 +219,11 @@ cmd_modversions_c =								\
 endif
 
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
+# gcc 5 supports generating the mcount tables directly
+ifneq ($(call cc-option,-mrecord-mcount,y),y)
+KBUILD_CFLAGS += -mrecord-mcount
+else
+# else do it all manually
 ifdef BUILD_C_RECORDMCOUNT
 ifeq ("$(origin RECORDMCOUNT_WARN)", "command line")
   RECORDMCOUNT_FLAGS = -w
@@ -264,6 +269,7 @@ objtool_args += --no-unreachable
 else
 objtool_args += $(call cc-ifversion, -lt, 0405, --no-unreachable)
 endif
+endif
 
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
-- 
2.13.6

