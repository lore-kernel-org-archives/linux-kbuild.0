Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33418 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdFVMjq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 08:39:46 -0400
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 1/3] sh: thin archives fix linking
Date: Thu, 22 Jun 2017 22:39:27 +1000
Message-Id: <20170622123929.15054-2-npiggin@gmail.com>
In-Reply-To: <20170622123929.15054-1-npiggin@gmail.com>
References: <20170622123929.15054-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org

The VDSO symbols can't be linked into built-in.o when building with
thin archives, so change this to linking a new object file that is
included into the built-in.o.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/sh/kernel/vsyscall/Makefile | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/kernel/vsyscall/Makefile b/arch/sh/kernel/vsyscall/Makefile
index 8f0ea5fc835c..efc7a6837ef6 100644
--- a/arch/sh/kernel/vsyscall/Makefile
+++ b/arch/sh/kernel/vsyscall/Makefile
@@ -1,4 +1,4 @@
-obj-y += vsyscall.o vsyscall-syscall.o
+obj-y += vsyscall.o vsyscall-syscall.o vsyscall-syms.o
 
 $(obj)/vsyscall-syscall.o: \
 	$(foreach F,trapa,$(obj)/vsyscall-$F.so)
@@ -26,11 +26,13 @@ $(obj)/vsyscall-%.so: $(src)/vsyscall.lds $(obj)/vsyscall-%.o FORCE
 # We also create a special relocatable object that should mirror the symbol
 # table and layout of the linked DSO.  With ld -R we can then refer to
 # these symbols in the kernel code rather than hand-coded addresses.
-extra-y += vsyscall-syms.o
-$(obj)/built-in.o: $(obj)/vsyscall-syms.o
-$(obj)/built-in.o: ld_flags += -R $(obj)/vsyscall-syms.o
-
-SYSCFLAGS_vsyscall-syms.o = -r
-$(obj)/vsyscall-syms.o: $(src)/vsyscall.lds \
+SYSCFLAGS_vsyscall-dummy.o = -r
+$(obj)/vsyscall-dummy.o: $(src)/vsyscall.lds \
 			$(obj)/vsyscall-trapa.o $(obj)/vsyscall-note.o FORCE
 	$(call if_changed,syscall)
+
+quiet_cmd_syscall_syms = SYSCALL $@
+      cmd_syscall_syms = $(LD) -r -R $(obj)/vsyscall-dummy.o -o $@
+
+$(obj)/vsyscall-syms.o: $(obj)/vsyscall-dummy.o
+	$(call if_changed,syscall_syms)
-- 
2.11.0

