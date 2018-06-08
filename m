Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f202.google.com ([209.85.223.202]:38836 "EHLO
        mail-io0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753224AbeFHVrw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 17:47:52 -0400
Received: by mail-io0-f202.google.com with SMTP id g22-v6so11065083ioh.5
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Jun 2018 14:47:52 -0700 (PDT)
MIME-Version: 1.0
Date: Fri,  8 Jun 2018 14:47:46 -0700
Message-Id: <20180608214746.136554-1-gthelen@google.com>
Subject: [PATCH] trace: fix SKIP_STACK_VALIDATION=1 build
From: Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Greg Thelen <gthelen@google.com>

Non gcc-5 builds with CONFIG_STACK_VALIDATION=y and
SKIP_STACK_VALIDATION=1 fail.
Example output:
  /bin/sh: init/.tmp_main.o: Permission denied

commit 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace"),
added a mismatched endif.  This causes cmd_objtool to get mistakenly
set.

Relocate endif to balance the newly added -record-mcount check.

Fixes: 96f60dfa5819 ("trace: Use -mcount-record for dynamic ftrace")
Signed-off-by: Greg Thelen <gthelen@google.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 34d9e9ce97c2..e7889f486ca1 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -239,6 +239,7 @@ cmd_record_mcount =						\
 	     "$(CC_FLAGS_FTRACE)" ]; then			\
 		$(sub_cmd_record_mcount)			\
 	fi;
+endif # -record-mcount
 endif # CONFIG_FTRACE_MCOUNT_RECORD
 
 ifdef CONFIG_STACK_VALIDATION
@@ -263,7 +264,6 @@ ifneq ($(RETPOLINE_CFLAGS),)
   objtool_args += --retpoline
 endif
 endif
-endif
 
 
 ifdef CONFIG_MODVERSIONS
-- 
2.18.0.rc1.242.g61856ae69a-goog

