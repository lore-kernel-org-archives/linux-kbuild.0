Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:39711 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758875AbdKOVeu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:34:50 -0500
Received: by mail-io0-f196.google.com with SMTP id x63so3079620ioe.6
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:34:49 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 05/18] arm64: fix -m for GNU gold
Date: Wed, 15 Nov 2017 13:34:15 -0800
Message-Id: <20171115213428.22559-6-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

GNU gold supports different emulations than bfd. Use aarch64_elf64_*_vec
instead of aarch64linux.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index ecd5ed11c764..6059c8169513 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -70,14 +70,22 @@ KBUILD_CPPFLAGS	+= -mbig-endian
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
2.15.0.448.gf294e3d99a-goog

