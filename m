Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43463 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbeIQNEQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Sep 2018 09:04:16 -0400
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] ftrace: Build with CPPFLAGS to get -Qunused-arguments
Date: Mon, 17 Sep 2018 17:07:54 +0930
Message-Id: <20180917073754.24048-1-joel@jms.id.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>

When building to record the mcount locations the kernel uses
KBUILD_CFLAGS but not KBUILD_CPPFLAGS. This means it lacks
-Qunused-arguments when building with clang, resulting in a lot of
noisy warnings.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Not sure why -Qunused-arguments is in CPP instead of KBUILD_CFLAGS. We
could instead put it in KBUILD_CFLAGS, and not need this patch.

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5a2d1c9578a0..54da4b070db3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -219,7 +219,7 @@ else
 sub_cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
 	"$(if $(CONFIG_64BIT),64,32)" \
-	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CFLAGS)" \
+	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS)" \
 	"$(LD) $(KBUILD_LDFLAGS)" "$(NM)" "$(RM)" "$(MV)" \
 	"$(if $(part-of-module),1,0)" "$(@)";
 recordmcount_source := $(srctree)/scripts/recordmcount.pl
-- 
2.17.1
