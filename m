Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:33079 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751182AbeC2Pmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Mar 2018 11:42:37 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: use -fmacro-prefix-map to make __FILE__ a relative path
Date: Fri, 30 Mar 2018 00:40:47 +0900
Message-Id: <1522338047-7128-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Tom Rini <trini@konsulko.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The __FILE__ macro is used everywhere in the kernel to locate the file
path printing the log message.  The biggest users of this macro are
WARN_ON() and friends.  If the kernel is built out of tree, this could
be a long absolute path, like this:

  WARNING: CPU: 1 PID: 1 at /path/to/build/directory/arch/arm64/kernel/foo.c:...

This is because Kbuild runs in the objtree instead of the srctree.

Commit 9da0763bdd82 ("kbuild: Use relative path when building in a
subdir of the source tree") mitigated the pain to some extent;
$(srctree) becomes ".." if the objtree is a child of the srctree.

For other cases of out-of-tree build, __FILE__ is still the absolute
path.  It also means the kernel image depends on where it was built.

A brand-new option from GCC solves this problem.

-fmacro-prefix-map=<old>=<new>
  When preprocessing files residing in directory <old>, expand the
  __FILE__ and __BASE_FILE__ macros as if the files resided in
  directory <new> instead.  This can be used to change an absolute
  path to a relative path by using . for <new> which can result in
  more reproducible builds that are location independent.  This
  option also affects __builtin_FILE() during compilation.

If your compiler supports this option, __FILE__ is the relative path
from the root of srctree regardless of O= option.

Please note __FILE__ is always an absolute path for external modules.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I tested this on GCC 8.
(not released yet, but you can get the source code from the trunk.)


Changes in v2:
  - Comment-in the ifeq

 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 7ba478a..5acee54 100644
--- a/Makefile
+++ b/Makefile
@@ -813,6 +813,11 @@ KBUILD_CFLAGS	+= $(call cc-option,-ffunction-sections,)
 KBUILD_CFLAGS	+= $(call cc-option,-fdata-sections,)
 endif
 
+# Change __FILE__ to a relative path from the srctree
+ifneq ($(KBUILD_SRC),)
+KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(call shell-cached,$(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
-- 
2.7.4

