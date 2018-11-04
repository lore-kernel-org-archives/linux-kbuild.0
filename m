Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36638 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730484AbeKEI2o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 03:28:44 -0500
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/2] Makefile: Export clang toolchain variables
Date: Mon,  5 Nov 2018 09:41:32 +1030
Message-Id: <20181104231133.30848-2-joel@jms.id.au>
In-Reply-To: <20181104231133.30848-1-joel@jms.id.au>
References: <20181104231133.30848-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

The powerpc makefile will use these in it's boot wrapper.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 9aa352b38815..a2db3c885b38 100644
--- a/Makefile
+++ b/Makefile
@@ -495,6 +495,9 @@ endif
 ifneq ($(GCC_TOOLCHAIN),)
 CLANG_GCC_TC	:= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
+export CLANG_TARGET
+export CLANG_GCC_TC
+export CLANG_PREFIX
 KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
 KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
 KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
-- 
2.19.1
