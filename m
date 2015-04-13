Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:51019 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053AbbDMA5L (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Apr 2015 20:57:11 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] Use -mcount-record for dynamic ftrace
Date: Sun, 12 Apr 2015 17:54:27 -0700
Message-Id: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

gcc 5 supports a new -mcount-record option to generate ftrace
tables directly. This avoids the need to run record_mcount
manually.

Use this option when available.

It also has a -mcount-nop option to generate the mcount calls
as nops. So far that is not implemented, but it could be used
to optimize patching at boot up.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/Makefile.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 01df30a..f258e9b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -210,6 +210,11 @@ cmd_modversions =								\
 	fi;
 endif
 
+# gcc 5 supports generating the mcount tables directly
+ifneq ($(call cc-option,-mrecord-mcount,y),y)
+KBUILD_CFLAGS += -mrecord-mcount
+else
+# else do it all manually
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
 ifdef BUILD_C_RECORDMCOUNT
 ifeq ("$(origin RECORDMCOUNT_WARN)", "command line")
@@ -240,6 +245,7 @@ cmd_record_mcount =						\
 		$(sub_cmd_record_mcount)			\
 	fi;
 endif
+endif
 
 define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
-- 
2.3.3

