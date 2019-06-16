Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:52511 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfFPRuB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Jun 2019 13:50:01 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] lib/raid6: remove duplicated CFLAGS_REMOVE_altivec8.o
Date: Mon, 17 Jun 2019 02:48:04 +0900
Message-Id: <20190616174805.3069-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, Joel Stanley <joel@jms.id.au>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>

No intended change in behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/raid6/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index e723eacf7868..74004037033f 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -26,7 +26,6 @@ CFLAGS_REMOVE_altivec1.o  += -msoft-float
 CFLAGS_REMOVE_altivec2.o  += -msoft-float
 CFLAGS_REMOVE_altivec4.o  += -msoft-float
 CFLAGS_REMOVE_altivec8.o  += -msoft-float
-CFLAGS_REMOVE_altivec8.o  += -msoft-float
 CFLAGS_REMOVE_vpermxor1.o += -msoft-float
 CFLAGS_REMOVE_vpermxor2.o += -msoft-float
 CFLAGS_REMOVE_vpermxor4.o += -msoft-float
-- 
2.17.1
