Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:44293 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753782AbeGFAt4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 20:49:56 -0400
Received: by mail-qk0-f196.google.com with SMTP id v17-v6so3040897qkb.11
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jul 2018 17:49:56 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv6 3/4] powerpc: Add build salt to the vDSO
Date: Thu,  5 Jul 2018 17:49:39 -0700
Message-Id: <20180706004940.32587-4-labbott@redhat.com>
In-Reply-To: <20180706004940.32587-1-labbott@redhat.com>
References: <20180706004940.32587-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Laura Abbott <labbott@redhat.com>, Andy Lutomirski <luto@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org

The vDSO needs to have a unique build id in a similar manner
to the kernel and modules. Use the build salt macro.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v6: Remove semi-colon
---
 arch/powerpc/kernel/vdso32/note.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/vdso32/note.S b/arch/powerpc/kernel/vdso32/note.S
index d4b5be4f3d5f..227a7327399e 100644
--- a/arch/powerpc/kernel/vdso32/note.S
+++ b/arch/powerpc/kernel/vdso32/note.S
@@ -5,6 +5,7 @@
 
 #include <linux/uts.h>
 #include <linux/version.h>
+#include <linux/build-salt.h>
 
 #define ASM_ELF_NOTE_BEGIN(name, flags, vendor, type)			      \
 	.section name, flags;						      \
@@ -23,3 +24,5 @@
 	ASM_ELF_NOTE_BEGIN(".note.kernel-version", "a", UTS_SYSNAME, 0)
 	.long LINUX_VERSION_CODE
 	ASM_ELF_NOTE_END
+
+BUILD_SALT
-- 
2.17.1

