Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:56799 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751072AbeC1CmU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 22:42:20 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: move <linux/compiler_types.h> out of <linux/kconfig.h>
Date: Wed, 28 Mar 2018 11:40:48 +0900
Message-Id: <1522204848-11803-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>, Michal Marek <michal.lkml@markovi.net>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Since commit 28128c61e08e ("kconfig.h: Include compiler types to avoid
missed struct attributes"), <linux/kconfig.h> pulls in kernel-space
headers to unrelated file.

Commit 0f9da844d877 ("MIPS: boot: Define __ASSEMBLY__ for its.S build")
suppressed the build error by defining __ASSEMBLY__, but ITS (i.e. DTS)
is not assembly, and should not include <linux/compiler_types.h> in the
first place.

Looking at arch/s390/tools/Makefile, host programs gen_facilities and
gen_opcode_table now pull in <linux/compiler_types.h> as well.

The motivation for that commit was to define necessary attributes
before any struct is defined.  Obviously, this happens only in C.

It is enough to include <linux/compiler_types.h> only when compiling
C files, and only when compiling kernel space.

Move the <linux/compiler_types.h> inclusion to c_flags.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I will also send a correct fix-up for MIPS Makefile later.



 include/linux/kconfig.h | 3 ---
 scripts/Makefile.lib    | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index dcde947..cc8fa10 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -70,7 +70,4 @@
  */
 #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
 
-/* Make sure we always have all types and struct attributes defined. */
-#include <linux/compiler_types.h>
-
 #endif /* __LINUX_KCONFIG_H */
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index c114ce5..07d0740 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -152,6 +152,7 @@ __cpp_flags     = $(call flags,_cpp_flags)
 endif
 
 c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
+		 -include $(srctree)/include/linux/compiler_types.h       \
 		 $(__c_flags) $(modkern_cflags)                           \
 		 $(basename_flags) $(modname_flags)
 
-- 
2.7.4

