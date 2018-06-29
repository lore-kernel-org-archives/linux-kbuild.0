Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:37424 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751740AbeF2JR6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jun 2018 05:17:58 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 2/2] kconfig: fix comment for symbol flag SYMBOL_AUTO
Date: Fri, 29 Jun 2018 11:12:37 +0200
Message-Id: <20180629091237.16620-3-dirk@gouders.net>
In-Reply-To: <20180629091237.16620-1-dirk@gouders.net>
References: <ghd0wc58z6.fsf@lena.gouders.net>
 <20180629091237.16620-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

I could not verify the comment for that symbol flag.

I could only find that flag set for choices and the defconfig_list
symbol in a dump of all symbols, which corresponds to the only two
locations in the code where that flag is being set explicitely.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/expr.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 94a383b21df6..0f53e44f14d6 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -141,7 +141,9 @@ struct symbol {
 #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
 #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
 #define SYMBOL_CHANGED    0x0400  /* ? */
-#define SYMBOL_AUTO       0x1000  /* value from environment variable */
+#define SYMBOL_AUTO       0x1000  /* Symbols of type choice and the
+				   * symbol with option defconfig_list
+				   * have this flag set */
 #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
 #define SYMBOL_WARNED     0x8000  /* warning has been issued */
 
-- 
2.16.1

