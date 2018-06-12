Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:46186 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934816AbeFLAcy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jun 2018 20:32:54 -0400
Received: by mail-pg0-f66.google.com with SMTP id d2-v6so10568877pga.13
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jun 2018 17:32:54 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv4 3/3] x86: Add build salt to the vDSO and kernel linker scripts
Date: Mon, 11 Jun 2018 17:32:24 -0700
Message-Id: <20180612003224.3658-4-labbott@redhat.com>
In-Reply-To: <20180612003224.3658-1-labbott@redhat.com>
References: <20180612003224.3658-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Laura Abbott <labbott@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org


Both the kernel and the vDSO need to have unique build ids.
Insert the build salt section to make the build ids unique.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 3 ++-
 arch/x86/kernel/vmlinux.lds.S         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index acfd5ba7d943..a331c1d41360 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <asm/vdso.h>
-
+#include <asm-generic/vmlinux.lds.h>
 /*
  * Linker script for vDSO.  This is an ELF shared object prelinked to
  * its virtual address, and with only one read-only segment.
@@ -74,6 +74,7 @@ SECTIONS
 	.fake_shstrtab	: { *(.fake_shstrtab) }		:text
 
 
+	BUILD_SALT
 	.note		: { *(.note.*) }		:text	:note
 
 	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 5e1458f609a1..b61c33fa2617 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -172,6 +172,7 @@ SECTIONS
 		_edata = .;
 	} :data
 
+	BUILD_SALT
 	BUG_TABLE
 
 	ORC_UNWIND_TABLE
-- 
2.18.0.rc1

