Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from stumail.xidian.edu.cn ([202.117.112.40]:49830 "HELO
        stu.xidian.edu.cn" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with SMTP id S1754321AbeFQLZZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jun 2018 07:25:25 -0400
From: Xi Ruoyao <ryxi@stu.xidian.edu.cn>
Date: Sun, 17 Jun 2018 18:16:07 +0800
Subject: [PATCH] Kbuild: fix mismatched if/endif pairs
Message-Id: <180617191612798b1a5d7a74c59e7905c31fd3f36f5d@stu.xidian.edu.cn>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Xi Ruoyao <ryxi@stu.xidian.edu.cn>

In scripts/Makefile.build, there are two mismatched if/endif pairs.
They stop the generation of orc unwind table if CONFIG_FTRACE_MCOUNT_RECORD
is not set.  dmesg complains:

WARNING: WARNING: Bad or missing .orc_unwind table.  Disabling unwinder.

This comment moves an endif to match the if/endif pairs.

Signed-off-by: Xi Ruoyao <ryxi@stu.xidian.edu.cn>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 34d9e9ce97c2..16509a038d77 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -239,6 +239,7 @@ cmd_record_mcount =						\
 	     "$(CC_FLAGS_FTRACE)" ]; then			\
 		$(sub_cmd_record_mcount)			\
 	fi;
+endif # cc-option(-mrecord-mcount)
 endif # CONFIG_FTRACE_MCOUNT_RECORD
 
 ifdef CONFIG_STACK_VALIDATION
@@ -263,7 +264,6 @@ ifneq ($(RETPOLINE_CFLAGS),)
   objtool_args += --retpoline
 endif
 endif
-endif
 
 
 ifdef CONFIG_MODVERSIONS
-- 
2.16.2

