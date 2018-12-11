Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:37031 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbeLKLBw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:52 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 20/27] microblaze: surround string default in Kconfig with double quotes
Date: Tue, 11 Dec 2018 20:01:03 +0900
Message-Id: <1544526070-16690-21-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Simek <monstr@monstr.eu>

I guess this is a constant value instead of a symbol.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I will apply this to my Kbuild tree
because it is necessary for Kconfig clean-ups.


 arch/microblaze/Kconfig.platform | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/Kconfig.platform b/arch/microblaze/Kconfig.platform
index f7f1739..7361974 100644
--- a/arch/microblaze/Kconfig.platform
+++ b/arch/microblaze/Kconfig.platform
@@ -65,6 +65,6 @@ config XILINX_MICROBLAZE0_USE_FPU
 
 config XILINX_MICROBLAZE0_HW_VER
 	string "Core version number"
-	default 7.10.d
+	default "7.10.d"
 
 endmenu
-- 
2.7.4
