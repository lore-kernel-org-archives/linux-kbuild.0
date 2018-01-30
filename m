Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:45996 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752112AbeA3THa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 14:07:30 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 05/10] Staging: rtl8192e: kconfig: Remove empty help text
Date: Tue, 30 Jan 2018 20:05:27 +0100
Message-Id: <20180130190555.6577-6-ulfalizer@gmail.com>
In-Reply-To: <20180130190555.6577-1-ulfalizer@gmail.com>
References: <20180130190555.6577-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mcgrof@kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

In preparation for adding a warning ("kconfig: Warn if help text is
blank"): https://lkml.org/lkml/2018/1/30/516

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/Kconfig b/drivers/staging/rtl8192e/rtl8192e/Kconfig
index 282e293da18f..7ac42a590e21 100644
--- a/drivers/staging/rtl8192e/rtl8192e/Kconfig
+++ b/drivers/staging/rtl8192e/rtl8192e/Kconfig
@@ -6,4 +6,3 @@ config RTL8192E
 	select WEXT_PRIV
 	select CRYPTO
 	select FW_LOADER
-	---help---
-- 
2.14.1

