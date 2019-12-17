Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49413 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727680AbfLQEOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:51 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/8] kconfig: drop T_WORD from the RHS of 'prompt' symbol
Date: Tue, 17 Dec 2019 13:14:18 +0900
Message-Id: <20191217041424.29285-4-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

Commit 8636a1f9677d ("treewide: surround Kconfig file paths with double
quotes") killed use-cases to reduce an unquoted string into the 'prompt'
symbol.

Kconfig still allows to use an unquoted string in the context of menu,
source, or prompt.

So, you can omit quoting if the prompt is a single word:

    bool foo

..., but I do not think this is so useful.

Let's require quoting:

    bool "foo"

All the Kconfig files in the kernel are written in this way.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 86e75ea74731..80585f04f590 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -445,9 +445,7 @@ prompt_stmt_opt:
 	menu_add_prompt(P_PROMPT, $1, $2);
 };
 
-prompt:	  T_WORD
-	| T_WORD_QUOTE
-;
+prompt:	  T_WORD_QUOTE
 
 end:	  T_ENDMENU T_EOL	{ $$ = "menu"; }
 	| T_ENDCHOICE T_EOL	{ $$ = "choice"; current_choice_menu = NULL; }
-- 
2.17.1
