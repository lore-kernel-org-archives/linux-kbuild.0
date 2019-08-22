Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:29725 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728870AbfHVEq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/6] kbuild: Inform user to pass ARCH= for make mrproper only when necessary
Date: Thu, 22 Aug 2019 13:46:09 +0900
Message-Id: <20190822044613.5349-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190822044613.5349-1-yamada.masahiro@socionext.com>
References: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since commit 3a475b2166fd ("kbuild: Inform user to pass ARCH= for make
mrproper"), if you try out-of-tree build with an unclean source tree,
it suggests to run 'make ARCH=<ARCH> mrproper'.

This looks odd when you are not cross-compiling the kernel. Show the
'ARCH=<ARCH>' part only when ARCH= was given from the command line.
If ARCH is the default (native build) or came from the environment,
it should simply suggest 'make mrproper' as before.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a77102e4ee90..d9cbbc27d4ba 100644
--- a/Makefile
+++ b/Makefile
@@ -1121,7 +1121,7 @@ ifdef building_out_of_srctree
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
 		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
-		echo >&2 "  $(srctree) is not clean, please run 'make ARCH=$(ARCH) mrproper'"; \
+		echo >&2 "  $(srctree) is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
 		echo >&2 "  in the '$(srctree)' directory.";\
 		/bin/false; \
 	fi;
-- 
2.17.1
