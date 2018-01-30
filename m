Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40448 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752112AbeA3THq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 14:07:46 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 08/10] MIPS: kconfig: Remove empty help text
Date: Tue, 30 Jan 2018 20:05:30 +0100
Message-Id: <20180130190555.6577-9-ulfalizer@gmail.com>
In-Reply-To: <20180130190555.6577-1-ulfalizer@gmail.com>
References: <20180130190555.6577-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mcgrof@kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

In preparation for adding a warning ("kconfig: Warn if help text is
blank"): https://lkml.org/lkml/2018/1/30/516

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ab98569994f0..57cd591e7b28 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2326,7 +2326,6 @@ config MIPS_VPE_LOADER_TOM
 config MIPS_VPE_APSP_API
 	bool "Enable support for AP/SP API (RTLX)"
 	depends on MIPS_VPE_LOADER
-	help
 
 config MIPS_VPE_APSP_API_CMP
 	bool
-- 
2.14.1

