Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:34028 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753191AbdK2Xo6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 18:44:58 -0500
Received: by mail-pl0-f68.google.com with SMTP id d21so3069683pll.1
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 15:44:58 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH 4/7] arm64: fix -m for GNU gold
Date: Wed, 29 Nov 2017 15:44:39 -0800
Message-Id: <20171129234442.655-5-samitolvanen@google.com>
In-Reply-To: <20171129234442.655-1-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

GNU gold supports different emulations than bfd. Use aarch64_elf64_*_vec
instead of aarch64linux.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Yury Norov <ynorov@caviumnetworks.com>
---
 arch/arm64/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b35788c909f1..82a0df6e865e 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -64,14 +64,22 @@ KBUILD_CPPFLAGS	+= -mbig-endian
 CHECKFLAGS	+= -D__AARCH64EB__
 AS		+= -EB
 LD		+= -EB
+ifeq ($(ld-name),gold)
+LDFLAGS		+= -maarch64_elf64_be_vec
+else
 LDFLAGS		+= -maarch64linuxb
+endif
 UTS_MACHINE	:= aarch64_be
 else
 KBUILD_CPPFLAGS	+= -mlittle-endian
 CHECKFLAGS	+= -D__AARCH64EL__
 AS		+= -EL
 LD		+= -EL
+ifeq ($(ld-name),gold)
+LDFLAGS		+= -maarch64_elf64_le_vec
+else
 LDFLAGS		+= -maarch64linux
+endif
 UTS_MACHINE	:= aarch64
 endif
 
-- 
2.15.0.531.g2ccb3012c9-goog

