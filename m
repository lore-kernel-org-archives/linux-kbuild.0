Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:29183 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdJ0ENS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Oct 2017 00:13:18 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] x86/build: beautify build log of syscall headers
Date: Fri, 27 Oct 2017 13:11:10 +0900
Message-Id: <1509077470-2735-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org

This makes the build log look nicer.

Before:
  SYSTBL  arch/x86/entry/syscalls/../../include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/entry/syscalls/../../include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/entry/syscalls/../../include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/entry/syscalls/../../include/generated/asm/syscalls_64.h
  SYSHDR  arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_x32.h

After:
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/x86/entry/syscalls/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index 57aa59f..e34c7a9 100644
--- a/arch/x86/entry/syscalls/Makefile
+++ b/arch/x86/entry/syscalls/Makefile
@@ -1,5 +1,5 @@
-out := $(obj)/../../include/generated/asm
-uapi := $(obj)/../../include/generated/uapi/asm
+out := arch/$(SRCARCH)/include/generated/asm
+uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 
 # Create output directory if not already present
 _dummy := $(shell [ -d '$(out)' ] || mkdir -p '$(out)') \
-- 
2.7.4

