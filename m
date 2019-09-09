Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:54370 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729369AbfIIKxl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 06:53:41 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] export.h: remove defined(__KERNEL__)
Date: Mon,  9 Sep 2019 19:53:16 +0900
Message-Id: <20190909105317.20473-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, Nicolas Pitre <nico@fluxnic.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This line was touched by commit f235541699bc ("export.h: allow for
per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
not explain why.

CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/export.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index fd8711ed9ac4..cdd98a0d918c 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -20,7 +20,7 @@ extern struct module __this_module;
 
 #ifdef CONFIG_MODULES
 
-#if defined(__KERNEL__) && !defined(__GENKSYMS__)
+#if !defined(__GENKSYMS__)
 #ifdef CONFIG_MODVERSIONS
 /* Mark the CRC weak since genksyms apparently decides not to
  * generate a checksums for some symbols */
-- 
2.17.1
