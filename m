Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:46189 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfG3Qkr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 12:40:47 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] lib/raid6: fix unnecessary rebuild of vpermxor*.c
Date: Wed, 31 Jul 2019 01:40:42 +0900
Message-Id: <20190730164042.2631-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The following four files are every time rebuilt:

  UNROLL  lib/raid6/vpermxor1.c
  UNROLL  lib/raid6/vpermxor2.c
  UNROLL  lib/raid6/vpermxor4.c
  UNROLL  lib/raid6/vpermxor8.c

I made a mistake in the Makefile refactoring.

Fixes: 72ad21075df8 ("lib/raid6: refactor unroll rules with pattern rules")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/raid6/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 42695bc8d451..0083b5cc646c 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -66,7 +66,7 @@ CFLAGS_vpermxor1.o += $(altivec_flags)
 CFLAGS_vpermxor2.o += $(altivec_flags)
 CFLAGS_vpermxor4.o += $(altivec_flags)
 CFLAGS_vpermxor8.o += $(altivec_flags)
-targets += vpermxor1.o vpermxor2.o vpermxor4.o vpermxor8.o
+targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
 $(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
-- 
2.17.1
