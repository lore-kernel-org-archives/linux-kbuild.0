Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:25465 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750722AbdJLJ46 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Oct 2017 05:56:58 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: redefine __FILE__ as relative path from $(srctree) if possible
Date: Thu, 12 Oct 2017 18:56:04 +0900
Message-Id: <1507802164-31614-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1507802164-31614-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507802164-31614-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Tom Rini <trini@konsulko.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since Kbuild runs in the objtree, __FILE__ can be a very long path
depending of $(srctree).

Commit 9da0763bdd82 ("kbuild: Use relative path when building in a
subdir of the source tree") made the situation better for cases where
objtree is a child of srctree.  ($(srctree) is "..")

For other cases of out-of-tree build, filenames in WARN_ON() etc. are
still an absolute path.  It also means the kernel image depends on
where it was built.

Here, the idea is to redefine __FILE__ as the relative path from
$(srctree), but doing so causes a compiler warning:
  warning: "__FILE__" redefined [-Wbuiltin-macro-redefined]

The option -Wno-builtin-macro-redefined can suppress it, but it is
only recognized by GCC 4.4 or newer.  Re-define __FILE__ only when
possible.

Please note __FILE__ is always an absolute path for external modules.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index 2c4a238..a3e8931 100644
--- a/Makefile
+++ b/Makefile
@@ -1091,6 +1091,15 @@ ifdef stackp-check
 endif
 	@:
 
+# If possible, redefne __FILE__ as relative path from $(srctree).
+# $$ is needed to expand the following in submake
+ifeq ($(call cc-option-yn,-Wno-builtin-macro-redefined),y)
+KBUILD_CFLAGS   += -Wno-builtin-macro-redefined \
+		   -D__FILE__=$$(call stringify,$$(src)/$$(notdir $$<))
+endif
+# CAUTION: Do not add any reference to KBUILD_CFLAGS below this line.
+# Any call of cc-option, etc. will fail.
+
 # Generate some files
 # ---------------------------------------------------------------------------
 
-- 
2.7.4

