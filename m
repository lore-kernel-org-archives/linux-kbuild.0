Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:40871 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759450AbdKOVfN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:35:13 -0500
Received: by mail-it0-f67.google.com with SMTP id 72so3480400itl.5
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:35:12 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 17/18] arm64: disable RANDOMIZE_MODULE_REGION_FULL with LTO_CLANG
Date: Wed, 15 Nov 2017 13:34:27 -0800
Message-Id: <20171115213428.22559-18-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

RANDOMIZE_MODULE_REGION_FULL results in "overflow in relocation type 275"
when loading a module linked with GNU gold. As a workaround, disable when
LTO_CLANG is selected.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ba6aab55d464..3a70f763e18a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1064,7 +1064,7 @@ config RANDOMIZE_BASE
 
 config RANDOMIZE_MODULE_REGION_FULL
 	bool "Randomize the module region independently from the core kernel"
-	depends on RANDOMIZE_BASE
+	depends on RANDOMIZE_BASE && !LTO_CLANG
 	default y
 	help
 	  Randomizes the location of the module region without considering the
-- 
2.15.0.448.gf294e3d99a-goog

