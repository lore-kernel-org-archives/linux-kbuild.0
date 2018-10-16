Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:57743 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbeJPRBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Oct 2018 13:01:42 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kbuild: check the presence of lzo and lz4 tools when necessary
Date: Tue, 16 Oct 2018 18:10:53 +0900
Message-Id: <1539681053-24388-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1539681053-24388-1-git-send-email-yamada.masahiro@socionext.com>
References: <1539681053-24388-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

If CONFIG_KERNEL_LZ4 is enabled without lz4 tool installed on the
system, the build fails at the very last stage (reported by
Borislav Petkov [1]).

  LZO     arch/x86/boot/compressed/vmlinux.bin.lzo
/bin/sh: 1: lzop: not found
arch/x86/boot/compressed/Makefile:141: recipe for target 'arch/x86/boot/compressed/vmlinux.bin.lzo' failed
make[2]: *** [arch/x86/boot/compressed/vmlinux.bin.lzo] Error 1
arch/x86/boot/Makefile:112: recipe for target 'arch/x86/boot/compressed/vmlinux' failed
make[1]: *** [arch/x86/boot/compressed/vmlinux] Error 2
arch/x86/Makefile:284: recipe for target 'bzImage' failed
make: *** [bzImage] Error 2

Check the tools in scripts/Makefile.toolcheck to fail the build
earlier with a more readable message.

[1] https://patchwork.kernel.org/patch/10635381/

Suggested-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.toolcheck | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/Makefile.toolcheck b/scripts/Makefile.toolcheck
index bc26fc0..5e336e4 100644
--- a/scripts/Makefile.toolcheck
+++ b/scripts/Makefile.toolcheck
@@ -17,6 +17,14 @@ msg_stack_validation = "libelf is necessary for building the objtool." \
 		       "Please install libelf-dev, libelf-devel or elfutils-libelf-devel."
 toolcheck-$(CONFIG_STACK_VALIDATION) += stack_validation
 
+chk_lzo = command -v lzop
+msg_lzo = "lzo tool not found. Please install it."
+toolcheck-$(CONFIG_KERNEL_LZO) += lzo
+
+chk_lz4 = command -v lz4c
+msg_lz4 = "lz4 tool not found. Please install it."
+toolcheck-$(CONFIG_KERNEL_LZ4) += lz4
+
 PHONY += $(toolcheck-y)
 __toolcheck: $(toolcheck-y)
 
-- 
2.7.4
