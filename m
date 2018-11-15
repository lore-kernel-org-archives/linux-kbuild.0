Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:50696 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728757AbeKOSfY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 13:35:24 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/8] kbuild: remove redundant 'set -e' from sub_cmd_record_mcount
Date: Thu, 15 Nov 2018 17:27:09 +0900
Message-Id: <1542270435-11181-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This is run inside the if_changed_rule, which already sets 'set -e'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a8e7ba9..7af21a8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -204,7 +204,7 @@ sub_cmd_record_mcount =					\
 recordmcount_source := $(srctree)/scripts/recordmcount.c \
 		    $(srctree)/scripts/recordmcount.h
 else
-sub_cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
+sub_cmd_record_mcount = perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
 	"$(if $(CONFIG_64BIT),64,32)" \
 	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS)" \
-- 
2.7.4
