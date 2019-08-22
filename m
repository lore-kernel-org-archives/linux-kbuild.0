Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:29724 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730896AbfHVEq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/6] kbuild: clarify where to run make mrproper when out-of-tree fails
Date: Thu, 22 Aug 2019 13:46:10 +0900
Message-Id: <20190822044613.5349-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190822044613.5349-1-yamada.masahiro@socionext.com>
References: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

If you try out-of-tree build with an unclean source tree, Kbuild
suggests to run make mrproper. The path to the source tree may be
shown with a relative path, for example, "make O=foo" emits the
following:

  .. is not clean, please run 'make mrproper'
  in the '..' directory.

This is somewhat confusing if you ran "make O=foo" in the source tree.
Using the absolute path will be clearer.

This commit changes the error message like follows:

***
*** The source tree is not clean, please run 'make mrproper'
*** in /absolute/path/to/linux
***

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d9cbbc27d4ba..901fcb8fffbe 100644
--- a/Makefile
+++ b/Makefile
@@ -1121,8 +1121,10 @@ ifdef building_out_of_srctree
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
 		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
-		echo >&2 "  $(srctree) is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
-		echo >&2 "  in the '$(srctree)' directory.";\
+		echo >&2 "***"; \
+		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
+		echo >&2 "*** in $(abs_srctree)";\
+		echo >&2 "***"; \
 		/bin/false; \
 	fi;
 endif
-- 
2.17.1
