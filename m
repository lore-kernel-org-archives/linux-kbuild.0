Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:37783 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753719AbeAaJfl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jan 2018 04:35:41 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 04/11] Staging: rtl8192u: kconfig: Remove blank help text
Date: Wed, 31 Jan 2018 10:34:23 +0100
Message-Id: <20180131093434.20050-5-ulfalizer@gmail.com>
In-Reply-To: <20180131093434.20050-1-ulfalizer@gmail.com>
References: <20180131093434.20050-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, mcgrof@kernel.org, rdunlap@infradead.org, dan.carpenter@oracle.com, pebolle@tiscali.nl, Ulf Magnusson <ulfalizer@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org

Blank help texts are probably either a typo, a Kconfig misunderstanding,
or some kind of half-committing to adding a help text (in which case a
TODO comment would be clearer, if the help text really can't be added
right away).

Best to remove them, IMO.

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

