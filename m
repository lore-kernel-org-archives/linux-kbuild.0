Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:17159 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfD0Ddv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Apr 2019 23:33:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/5] samples: kobject: allow CONFIG_SAMPLE_KOBJECT to become y
Date: Sat, 27 Apr 2019 12:33:40 +0900
Message-Id: <1556336020-15634-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
References: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This sample works well as builtin.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 samples/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index b98a763..399ae53 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -20,8 +20,7 @@ config SAMPLE_TRACE_PRINTK
 	 test various trace_printk() calls from a module.
 
 config SAMPLE_KOBJECT
-	tristate "Build kobject examples -- loadable modules only"
-	depends on m
+	tristate "Build kobject examples"
 	help
 	  This config option will allow you to build a number of
 	  different kobject sample modules showing how to use kobjects,
-- 
2.7.4
