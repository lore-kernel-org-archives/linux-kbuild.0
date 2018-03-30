Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:24910 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751129AbeC3ERb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Mar 2018 00:17:31 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3] kbuild: use -fmacro-prefix-map to make __FILE__ a relative path
Date: Fri, 30 Mar 2018 13:15:26 +0900
Message-Id: <1522383326-3880-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Tom Rini <trini@konsulko.com>, Joe Perches <joe@perches.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The __FILE__ macro is used everywhere in the kernel to locate the file
printing the log message, such as WARN_ON(), etc.  If the kernel is
built out of tree, this can be a long absolute path, like this:

  WARNING: CPU: 1 PID: 1 at /path/to/build/directory/arch/arm64/kernel/foo.c:...

This is because Kbuild runs in the objtree instead of the srctree,
then __FILE__ is expanded to a file path prefixed with $(srctree)/.

Commit 9da0763bdd82 ("kbuild: Use relative path when building in a
subdir of the source tree") improved this to some extent; $(srctree)
becomes ".." if the objtree is a child of the srctree.

For other cases of out-of-tree build, __FILE__ is still the absolute
path.  It also means the kernel image depends on where it was built.

A brand-new option from GCC, -fmacro-prefix-map, solves this problem.
If your compiler supports it, __FILE__ is the relative path from the
srctree regardless of O= option.  This provides more readable log and
more reproducible builds.

Please note __FILE__ is always an absolute path for external modules.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I tested this on GCC 8.
(not released yet, but you can get the source code from the trunk.)


Changes in v3:
 - It is harmless to always set this option.
   Remove ifneq ifneq ($(KBUILD_SRC),)

Changes in v2:
 - Comment-in the ifeq

 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 7ba478a..83d25c9 100644
--- a/Makefile
+++ b/Makefile
@@ -856,6 +856,9 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 # Require designated initializers for all marked structures
 KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
 
+# change __FILE__ to the relative path from the srctree
+KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+
 # use the deterministic mode of AR if available
 KBUILD_ARFLAGS := $(call ar-option,D)
 
-- 
2.7.4

