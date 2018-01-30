Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36677 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752112AbeA3THW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 14:07:22 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 04/10] Staging: rtl8192u: kconfig: Remove empty help text
Date: Tue, 30 Jan 2018 20:05:26 +0100
Message-Id: <20180130190555.6577-5-ulfalizer@gmail.com>
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
 drivers/staging/rtl8192u/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/Kconfig b/drivers/staging/rtl8192u/Kconfig
index 3ee9d0d00fb6..97df6507a485 100644
--- a/drivers/staging/rtl8192u/Kconfig
+++ b/drivers/staging/rtl8192u/Kconfig
@@ -5,4 +5,3 @@ config RTL8192U
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	select CRYPTO
-	---help---
-- 
2.14.1

