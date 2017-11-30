Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:42625 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750890AbdK3XjN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:39:13 -0500
Received: by mail-it0-f67.google.com with SMTP id p139so522505itb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:39:13 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 2/7] arm64: keep .altinstructions and .altinstr_replacement
Date: Thu, 30 Nov 2017 15:39:00 -0800
Message-Id: <20171130233905.130602-3-samitolvanen@google.com>
In-Reply-To: <20171130233905.130602-1-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
 <20171130233905.130602-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
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
2.15.0.531.g2ccb3012c9-goog

