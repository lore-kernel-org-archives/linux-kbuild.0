Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex13-edg-ou-002.vmware.com ([208.91.0.190]:1463 "EHLO
        EX13-EDG-OU-002.vmware.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726892AbeKOOHD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 09:07:03 -0500
From: Nadav Amit <namit@vmware.com>
Subject: [PATCH v2 2/2] x86: set a dependency on macros.S
Date: Wed, 14 Nov 2018 12:43:09 -0800
Message-ID: <20181114204309.18645-3-namit@vmware.com>
In-Reply-To: <20181114204309.18645-1-namit@vmware.com>
References: <20181114204309.18645-1-namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>

Changes in macros.S should trigger the recompilation of all C files, as
the macros might need to affect their compilation.

Acked-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Nadav Amit <namit@vmware.com>
---
 scripts/Makefile.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b8d26bdf48b0..efec77991c2b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -313,13 +313,13 @@ cmd_undef_syms = echo
 endif
 
 # Built-in and composite module parts
-$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
+$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) $(ASM_MACRO_FILE:.s=.S) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
 # Single-part modules are special since we need to mark them in $(MODVERDIR)
 
-$(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
+$(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) $(ASM_MACRO_FILE:.s=.S) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 	@{ echo $(@:.o=.ko); echo $@; \
-- 
2.17.1
