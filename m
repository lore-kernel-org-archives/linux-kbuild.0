Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:44099 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759456AbdKOVfO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:35:14 -0500
Received: by mail-it0-f67.google.com with SMTP id b5so3450639itc.3
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:35:14 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Date: Wed, 15 Nov 2017 13:34:28 -0800
Message-Id: <20171115213428.22559-19-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

Allow CONFIG_LTO_CLANG to be enabled for the architecture.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3a70f763e18a..58504327b9f6 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -40,6 +40,7 @@ config ARM64
 	select ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE if !PREEMPT
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.15.0.448.gf294e3d99a-goog

