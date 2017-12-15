Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:62822 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932072AbdLOPax (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Dec 2017 10:30:53 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: display recursive dependency resolution hint just once
Date: Sat, 16 Dec 2017 00:28:42 +0900
Message-Id: <1513351722-14196-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kernel@vger.kernel.org

Commit 1c199f2878f6 ("kbuild: document recursive dependency limitation
/ resolution") probably intended to show a hint along with "recursive
dependency detected!" error, but it missed to add {...} guard, and the
hint is displayed in every loop of the dep_stack traverse, annoyingly.

This error was detected by GCC's -Wmisleading-indentation when switching
to build-time generation of lexer/parser.

scripts/kconfig/symbol.c: In function ‘sym_check_print_recursive’:
scripts/kconfig/symbol.c:1150:3: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
   if (stack->sym == last_sym)
   ^~
scripts/kconfig/symbol.c:1153:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘if’
    fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
    ^~~~~~~

I could simply add {...} to surround the three fprintf(), but I rather
chose to move the hint after the loop to make the whole message readable.

Fixes: 1c199f2878f6 ("kbuild: document recursive dependency limitation / resolution"
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/symbol.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 3c8bd9b..35e0937 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1150,8 +1150,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		if (stack->sym == last_sym)
 			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
 				prop->file->name, prop->lineno);
-			fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
-			fprintf(stderr, "subsection \"Kconfig recursive dependency limitations\"\n");
+
 		if (stack->expr) {
 			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
 				prop->file->name, prop->lineno,
@@ -1181,6 +1180,11 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		}
 	}
 
+	fprintf(stderr,
+		"For a resolution refer to Documentation/kbuild/kconfig-language.txt\n"
+		"subsection \"Kconfig recursive dependency limitations\"\n"
+		"\n");
+
 	if (check_top == &cv_stack)
 		dep_stack_remove();
 }
-- 
2.7.4

