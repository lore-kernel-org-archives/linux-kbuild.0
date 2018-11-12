Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43380 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730481AbeKLONI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 09:13:08 -0500
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 2/2] powerpc/boot: Set target when cross-compiling for clang
Date: Mon, 12 Nov 2018 14:51:16 +1030
Message-Id: <20181112042116.5271-3-joel@jms.id.au>
In-Reply-To: <20181112042116.5271-1-joel@jms.id.au>
References: <20181112042116.5271-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Marek <michal.lkml@markovi.net>, Daniel Axtens <dja@axtens.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Clang needs to be told which target it is building for when cross
compiling.

Link: https://github.com/ClangBuiltLinux/linux/issues/259
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/boot/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 39354365f54a..111f97b1ccec 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -55,6 +55,11 @@ BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -traditional -nostdinc
 
 BOOTARFLAGS	:= -cr$(KBUILD_ARFLAGS)
 
+ifdef CONFIG_CC_IS_CLANG
+BOOTCFLAGS += $(CLANG_FLAGS)
+BOOTAFLAGS += $(CLANG_FLAGS)
+endif
+
 ifdef CONFIG_DEBUG_INFO
 BOOTCFLAGS	+= -g
 endif
-- 
2.19.1
