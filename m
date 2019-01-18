Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:24941 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbfARD7D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 22:59:03 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove meaningless prepare2 target
Date: Fri, 18 Jan 2019 12:58:30 +0900
Message-Id: <1547783910-31653-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

There is no build order among the following:
  prepare3
  outputmakefile
  asm-generic
  $(version_h)
  $(autoksyms_h)
  include/generated/utsrelease.h

It is meaningless to insert the prepare2 target between the first
three and the last three.

The comment says, "prepare2 creates a makefile if using a separate
output directory." Let me explain it more precisely. The prepare
targets cannot be executed without the .config file. Because the
configuration targets depend on the outputmakefile target, the
generated makefile is already there before the parepare2 is run.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 9851a44..cddcdb8 100644
--- a/Makefile
+++ b/Makefile
@@ -1062,7 +1062,7 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare1 prepare2 prepare3
+PHONY += prepare archprepare prepare1 prepare3
 
 # prepare3 is used to check if we are building in a separate output directory,
 # and if so do:
@@ -1077,12 +1077,8 @@ ifneq ($(KBUILD_SRC),)
 	fi;
 endif
 
-# prepare2 creates a makefile if using a separate output directory.
-# From this point forward, .config has been reprocessed, so any rules
-# that need to depend on updated CONFIG_* values can be checked here.
-prepare2: prepare3 outputmakefile asm-generic
-
-prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h
+prepare1: prepare3 outputmakefile asm-generic $(version_h) $(autoksyms_h) \
+						include/generated/utsrelease.h
 	$(cmd_crmodverdir)
 
 archprepare: archheaders archscripts prepare1 scripts
-- 
2.7.4
