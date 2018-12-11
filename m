Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36701 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbeLKLBn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:43 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 10/27] kconfig: remove grammatically ambiguous option_error
Date: Tue, 11 Dec 2018 20:00:53 +0900
Message-Id: <1544526070-16690-11-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

This commit decreases 6 shift/reduce conflicts, and finally achieves
conflict-free parser.

Since Kconfig has no terminator for a config block, detecting the end
of config_stmt is not easy.

For example, there are two ways for handling the error in the following
code:

  1 config FOO
  2         =

 [A] Print "unknown option" error, assuming the line 2 is a part of
     config_option_list

 [B] Print "invalid statement", assuming the line 1 is reduced into
     a config_stmt by itself

Bison actually chooses [A] because it performs the shift rather than
the reduction where both are possible.

However, there is no reason to choose one over the other since the
code above can be written as follows:

 1 config FOO
 2
 3 =

Remove the option_error, and let it fall back to [B].

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index cef6123..a92f167 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -31,7 +31,6 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 static struct menu *current_menu, *current_entry;
 
 %}
-%expect 6
 
 %union
 {
@@ -138,12 +137,6 @@ common_stmt:
 	| assignment_stmt
 ;
 
-option_error:
-	  T_WORD error T_EOL		{ zconf_error("unknown option \"%s\"", $1); }
-	| error T_EOL			{ zconf_error("invalid option"); }
-;
-
-
 /* config/menuconfig entry */
 
 config_entry_start: T_CONFIG nonconst_symbol T_EOL
@@ -180,7 +173,6 @@ config_option_list:
 	| config_option_list symbol_option
 	| config_option_list depends
 	| config_option_list help
-	| config_option_list option_error
 ;
 
 config_option: T_TYPE prompt_stmt_opt T_EOL
@@ -280,7 +272,6 @@ choice_option_list:
 	| choice_option_list choice_option
 	| choice_option_list depends
 	| choice_option_list help
-	| choice_option_list option_error
 ;
 
 choice_option: T_PROMPT prompt if_expr T_EOL
@@ -429,7 +420,6 @@ help: help_start T_HELPTEXT
 depends_list:
 	  /* empty */
 	| depends_list depends
-	| depends_list option_error
 ;
 
 depends: T_DEPENDS T_ON expr T_EOL
-- 
2.7.4
