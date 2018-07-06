Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:39520 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753845AbeGFAuA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 20:50:00 -0400
Received: by mail-qk0-f195.google.com with SMTP id b5-v6so3501387qkg.6
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jul 2018 17:50:00 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv6 4/4] arm64: Add build salt to the vDSO
Date: Thu,  5 Jul 2018 17:49:40 -0700
Message-Id: <20180706004940.32587-5-labbott@redhat.com>
In-Reply-To: <20180706004940.32587-1-labbott@redhat.com>
References: <20180706004940.32587-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Laura Abbott <labbott@redhat.com>, Andy Lutomirski <luto@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, linux-arm-kernel@lists.infradead.org

The vDSO needs to have a unique build id in a similar manner
to the kernel and modules. Use the build salt macro.

Acked-by: Will Deacon <will.deacon@arm.com>
Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v6: Remove the semi-colon, Ack from Will
---
 arch/arm64/kernel/vdso/note.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/vdso/note.S b/arch/arm64/kernel/vdso/note.S
index b82c85e5d972..e20483b104d9 100644
--- a/arch/arm64/kernel/vdso/note.S
+++ b/arch/arm64/kernel/vdso/note.S
@@ -22,7 +22,10 @@
 #include <linux/uts.h>
 #include <linux/version.h>
 #include <linux/elfnote.h>
+#include <linux/build-salt.h>
 
 ELFNOTE_START(Linux, 0, "a")
 	.long LINUX_VERSION_CODE
 ELFNOTE_END
+
+BUILD_SALT
-- 
2.17.1

