Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36188 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751980AbdK3XjP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:39:15 -0500
Received: by mail-it0-f67.google.com with SMTP id d16so527943itj.1
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:39:14 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 3/7] kbuild: add ld-name macro
Date: Thu, 30 Nov 2017 15:39:01 -0800
Message-Id: <20171130233905.130602-4-samitolvanen@google.com>
In-Reply-To: <20171130233905.130602-1-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
 <20171130233905.130602-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

GNU gold may require different flags than GNU ld. Add a macro for
detecting the linker.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/Kbuild.include | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index eb2cf2780f6e..899863e4cd05 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -273,6 +273,10 @@ ld-option = $(call try-run-cached,\
 # Important: no spaces around options
 ar-option = $(call try-run-cached, $(AR) rc$(1) "$$TMP",$(1),$(2))
 
+# ld-name
+# Expands to either bfd or gold
+ld-name = $(shell $(LD) -v 2>&1 | grep -q "GNU gold" && echo gold || echo bfd)
+
 # ld-version
 # Note this is mainly for HJ Lu's 3 number binutil versions
 ld-version = $(call shell-cached,$(LD) --version | $(srctree)/scripts/ld-version.sh)
-- 
2.15.0.531.g2ccb3012c9-goog

