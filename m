Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:49668 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfGIN0o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 09:26:44 -0400
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] kbuild: Inform user to pass ARCH= for make mrproper
Date: Tue,  9 Jul 2019 15:26:39 +0200
Message-Id: <20190709132639.26802-1-geert@linux-m68k.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

When cross-compiling an out-of-tree build with an unclean source tree
directory, the build fails with:

  /path/to/kernel/source/tree is not clean, please run 'make mrproper'
  in the '/path/to/kernel/source/tree' directory.

However, doing so does not fix the problem, as "make mrproper" now
requires passing the target architecture to the make command, else it
won't remove $(srctree)/arch/$(SRCARCH)/include/generated.
"git ls-files -o" doesn't give a clue, as it doesn't list (empty)
directories, only files.

Improve usability by including the ARCH= option in the error output.

Fixes: a788b2ed81abeb94 ("kbuild: check arch/$(SRCARCH)/include/generated before out-of-tree build")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3e4868a6498b2224..704e193c16472be1 100644
--- a/Makefile
+++ b/Makefile
@@ -1101,7 +1101,7 @@ ifneq ($(srctree),.)
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
 		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
-		echo >&2 "  $(srctree) is not clean, please run 'make mrproper'"; \
+		echo >&2 "  $(srctree) is not clean, please run 'make ARCH=$(ARCH) mrproper'"; \
 		echo >&2 "  in the '$(srctree)' directory.";\
 		/bin/false; \
 	fi;
-- 
2.17.1
