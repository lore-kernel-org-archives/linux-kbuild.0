Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:36748 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387702AbfBNVUv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Feb 2019 16:20:51 -0500
From: Robin Meijboom <robin@meijboom.info>
Subject: [PATCH] objtool: remove generated files with make clean
Message-ID: <bca6deb0-ba70-12af-9381-72ae7d94c0c5@meijboom.info>
Date: Thu, 14 Feb 2019 22:08:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>

Make clean currently does not remove the generated files for objtool:
tools/objtool/objtool, tools/objtool/fixdep, and
tools/objtool/arch/x86/lib/inat-tables.c.

Clean these files up as part of make clean.

Fixes: b9ab5ebb14ec ("objtool: Add CONFIG_STACK_VALIDATION option") and
bug report 199485 (https://bugzilla.kernel.org/show_bug.cgi?id=199485).

Signed-off-by: Robin Meijboom <robin@meijboom.info>
---
In the discussions I didn't find a reason for keeping the files, so I
assume it is an oversight. Otherwise I would have expected them to be
removed at least by make distconfig (which they are not).

Tested by compiling, cleaning, compiling again, and booting on x86_64.

diff --git a/Makefile b/Makefile
index 141653226f3c..81a8149a805f 100644
--- a/Makefile
+++ b/Makefile
@@ -1328,6 +1328,8 @@ endif # CONFIG_MODULES

  # Directories & files removed with 'make clean'
  CLEAN_DIRS  += $(MODVERDIR) include/ksym
+CLEAN_FILES += tools/objtool/objtool tools/objtool/fixdep \
+           tools/objtool/arch/$(ARCH)/lib/inat-tables.c

  # Directories & files removed with 'make mrproper'
  MRPROPER_DIRS  += include/config usr/include include/generated          \
