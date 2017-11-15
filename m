Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:43762 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759102AbdKOVex (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:34:53 -0500
Received: by mail-io0-f195.google.com with SMTP id 189so3074869iow.10
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:34:53 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 07/18] arm64: keep .altinstructions and .altinstr_replacement
Date: Wed, 15 Nov 2017 13:34:17 -0800
Message-Id: <20171115213428.22559-8-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

Make sure the linker doesn't remove .altinstructions or
.altinstr_replacement when CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is
enabled.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/kernel/vmlinux.lds.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 7da3e5c366a0..15479995869c 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -138,11 +138,11 @@ SECTIONS
 	. = ALIGN(4);
 	.altinstructions : {
 		__alt_instructions = .;
-		*(.altinstructions)
+		KEEP(*(.altinstructions))
 		__alt_instructions_end = .;
 	}
 	.altinstr_replacement : {
-		*(.altinstr_replacement)
+		KEEP(*(.altinstr_replacement))
 	}
 
 	. = ALIGN(PAGE_SIZE);
-- 
2.15.0.448.gf294e3d99a-goog

