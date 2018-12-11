Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36639 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbeLKLBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:42 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 09/27] kconfig: remove grammatically ambiguous "unexpected option" diagnostic
Date: Tue, 11 Dec 2018 20:00:52 +0900
Message-Id: <1544526070-16690-10-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

This commit decreases 15 shift/reduce conflicts.

The location of this error recovery is ambiguous.

For example, there are two ways to interpret the following code:

  1 config FOO
  2         bool "foo"

 [A] Both lines are reduced together into a config_stmt.

 [B] The only line 1 is reduced into a config_stmt, and the line 2
     matches to "option_name error T_EOL"

Of course, we expect [A], but [B] could be grammatically possible.

Kconfig has no terminator for a config block. So, we cannot detect its
end until we see non-property keywords. People often insert a blank
line between two config blocks, but it is just a coding convention.
Blank lines are actually allowed anywhere in Kconfig files.

The real error is when a property keyword appears right after "endif",
"endchoice", "endmenu",  "source", "comment", or variable assignments.

Instead of fixing the grammatical ambiguity, I chose to simply remove
this error recovery.

The difference is

  unexpected option "bool"

... is turned into a more generic message:

  invalid statement

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 02bfc62..cef6123 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 static struct menu *current_menu, *current_entry;
 
 %}
-%expect 21
+%expect 6
 
 %union
 {
@@ -94,7 +94,6 @@ static struct menu *current_menu, *current_entry;
 %type <expr> expr
 %type <expr> if_expr
 %type <id> end
-%type <id> option_name
 %type <menu> if_entry menu_entry choice_entry
 %type <string> symbol_option_arg word_opt assign_val
 
@@ -127,17 +126,9 @@ stmt_list:
 	| stmt_list menu_stmt
 	| stmt_list end			{ zconf_error("unexpected end statement"); }
 	| stmt_list T_WORD error T_EOL	{ zconf_error("unknown statement \"%s\"", $2); }
-	| stmt_list option_name error T_EOL
-{
-	zconf_error("unexpected option \"%s\"", $2->name);
-}
 	| stmt_list error T_EOL		{ zconf_error("invalid statement"); }
 ;
 
-option_name:
-	T_DEPENDS | T_PROMPT | T_TYPE | T_SELECT | T_IMPLY | T_OPTIONAL | T_RANGE | T_DEFAULT | T_VISIBLE
-;
-
 common_stmt:
 	  if_stmt
 	| comment_stmt
-- 
2.7.4
