Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:45503 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHYR2n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Aug 2019 13:28:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kconfig: split util.c out of parser.y
Date: Mon, 26 Aug 2019 02:28:33 +0900
Message-Id: <20190825172833.5708-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190825172833.5708-1-yamada.masahiro@socionext.com>
References: <20190825172833.5708-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

util.c exists both in scripts/kconfig/ and scripts/kconfig/lxdialog.

Previously, Kbuild could not pass different flags to source files with
the same basename. Now that this issue was solved, you can split util.c
out of parser.y and compile them independently of each other.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 2 +-
 scripts/kconfig/parser.y | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ef2f2336c469..1ce83269a5dc 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -144,7 +144,7 @@ help:
 # ===========================================================================
 # object files used by all kconfig flavours
 common-objs	:= confdata.o expr.o lexer.lex.o parser.tab.o preprocess.o \
-		   symbol.o
+		   symbol.o util.o
 
 $(obj)/lexer.lex.o: $(obj)/parser.tab.h
 HOSTCFLAGS_lexer.lex.o	:= -I $(srctree)/$(src)
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 60936c76865b..b3eff9613cf8 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -727,5 +727,4 @@ void zconfdump(FILE *out)
 	}
 }
 
-#include "util.c"
 #include "menu.c"
-- 
2.17.1
