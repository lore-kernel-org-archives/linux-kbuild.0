Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:55465 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754096AbeGCJP2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jul 2018 05:15:28 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v2] kconfig: fix comment for symbol flag SYMBOL_AUTO
Date: Tue,  3 Jul 2018 11:10:49 +0200
Message-Id: <20180703091049.7381-1-dirk@gouders.net>
In-Reply-To: <CAK7LNASQ6mJkn69BkLm40t8-dxJfdQJ+G0nBrtUCeU2hBN_b3Q@mail.gmail.com>
References: <CAK7LNASQ6mJkn69BkLm40t8-dxJfdQJ+G0nBrtUCeU2hBN_b3Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

Over time, the use of the flag changed from initially marking three
automatically generated symbols ARCH, KERNELRELEASE and UNAME_RELEASE
to protecting symbols from being written out, today.

Currently, only symbols of type CHOICE and those with option
defconf_list set have that flag set so that they are not written out.

Document the current effect of that flag.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/expr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index f63b41b0dd49..08f5e223a9e3 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -141,7 +141,7 @@ struct symbol {
 #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
 #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
 #define SYMBOL_CHANGED    0x0400  /* ? */
-#define SYMBOL_AUTO       0x1000  /* value from environment variable */
+#define SYMBOL_AUTO       0x1000  /* Symbol for internal use only; it will not be written */
 #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
 #define SYMBOL_WARNED     0x8000  /* warning has been issued */
 
-- 
2.16.1

