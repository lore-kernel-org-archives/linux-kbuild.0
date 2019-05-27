Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:43269 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbfE0OjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 10:39:19 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/5] unicore32: rename unicore32_defconfig to defconfig
Date: Mon, 27 May 2019 23:37:25 +0900
Message-Id: <20190527143725.12542-5-yamada.masahiro@socionext.com>
In-Reply-To: <20190527143725.12542-1-yamada.masahiro@socionext.com>
References: <20190527143725.12542-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>, Paul Burton <paul.burton@mips.com>, Krzysztof Kozlowski <krzk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>

Since the initial support of unicore32, it has always had a single
defconfig. Rename it to 'defconfig', which is now the standard name
when arch has just a single defconfig file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/unicore32/Makefile                                   | 3 +--
 arch/unicore32/configs/{unicore32_defconfig => defconfig} | 0
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename arch/unicore32/configs/{unicore32_defconfig => defconfig} (100%)

diff --git a/arch/unicore32/Makefile b/arch/unicore32/Makefile
index 98a5ca43ae87..390819947c37 100644
--- a/arch/unicore32/Makefile
+++ b/arch/unicore32/Makefile
@@ -41,8 +41,7 @@ libs-y			+= arch/unicore32/lib/
 
 boot			:= arch/unicore32/boot
 
-# Default defconfig and target when executing plain make
-KBUILD_DEFCONFIG	:= $(ARCH)_defconfig
+# Default target when executing plain make
 KBUILD_IMAGE		:= $(boot)/zImage
 
 all:	zImage
diff --git a/arch/unicore32/configs/unicore32_defconfig b/arch/unicore32/configs/defconfig
similarity index 100%
rename from arch/unicore32/configs/unicore32_defconfig
rename to arch/unicore32/configs/defconfig
-- 
2.17.1
