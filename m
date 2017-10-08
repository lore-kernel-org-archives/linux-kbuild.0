Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:47314 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751228AbdJHRgT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:36:19 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 2/3] kconfig: Fix expr_free() E_NOT leak
Date: Sun,  8 Oct 2017 19:35:45 +0200
Message-Id: <1507484146-23617-3-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
References: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Only the E_NOT operand and not the E_NOT node itself was freed, due to
accidentally returning too early in expr_free(). Outline of leak:

	switch (e->type) {
	...
	case E_NOT:
		expr_free(e->left.expr);
		return;
	...
	}
	*Never reached, 'e' leaked*
	free(e);

Fix by changing the 'return' to a 'break'.

Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:

	LEAK SUMMARY:
	   definitely lost: 44,448 bytes in 1,852 blocks
	   ...

Summary after the fix:

	LEAK SUMMARY:
	   definitely lost: 1,608 bytes in 67 blocks
	   ...

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/expr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index cbf4996..ed29bad 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -113,7 +113,7 @@ void expr_free(struct expr *e)
 		break;
 	case E_NOT:
 		expr_free(e->left.expr);
-		return;
+		break;
 	case E_EQUAL:
 	case E_GEQ:
 	case E_GTH:
-- 
2.7.4

