Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:34573 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab3J3Vq0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Oct 2013 17:46:26 -0400
Received: by mail-we0-f178.google.com with SMTP id q59so1883264wes.37
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2013 14:46:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/7] kconfig: add short explanation to SYMBOL_WRITE
Date: Wed, 30 Oct 2013 22:46:15 +0100
Message-Id: <31bfb10820301b26debeb26465d5bff7b1f11a37.1383168460.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1383168460.git.yann.morin.1998@free.fr>
References: <cover.1383168460.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Martin Walch <walch.martin@web.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Martin Walch <walch.martin@web.de>

replace the question mark in the comment after SYMBOL_WRITE with an explanation

Signed-off-by: Martin Walch <walch.martin@web.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/expr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index df198a5..ba663e1 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -93,7 +93,7 @@ struct symbol {
 #define SYMBOL_CHOICEVAL  0x0020  /* used as a value in a choice block */
 #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
 #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
-#define SYMBOL_WRITE      0x0200  /* ? */
+#define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
 #define SYMBOL_CHANGED    0x0400  /* ? */
 #define SYMBOL_AUTO       0x1000  /* value from environment variable */
 #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
-- 
1.8.1.2

