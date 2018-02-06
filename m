Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39985 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752337AbeBFAiB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:38:01 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 02/14] kconfig: do not write choice values when their dependency becomes n
Date: Tue,  6 Feb 2018 09:34:42 +0900
Message-Id: <1517877294-4826-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>

"# CONFIG_... is not set" for choice values are wrongly written into
the .config file if they are once visible, then become invisible later.

  Test case
  ---------

---------------------------(Kconfig)----------------------------
config A
	bool "A"

choice
	prompt "Choice ?"
	depends on A

config CHOICE_B
	bool "Choice B"

config CHOICE_C
	bool "Choice C"

endchoice
----------------------------------------------------------------

---------------------------(.config)----------------------------
CONFIG_A=y
----------------------------------------------------------------

With the Kconfig and .config above,

  $ make config
  scripts/kconfig/conf  --oldaskconfig Kconfig
  *
  * Linux Kernel Configuration
  *
  A (A) [Y/n] n
  #
  # configuration written to .config
  #
  $ cat .config
  #
  # Automatically generated file; DO NOT EDIT.
  # Linux Kernel Configuration
  #
  # CONFIG_A is not set
  # CONFIG_CHOICE_B is not set
  # CONFIG_CHOICE_C is not set

Here,

  # CONFIG_CHOICE_B is not set
  # CONFIG_CHOICE_C is not set

should not be written into the .config file because their dependency
"depends on A" is unmet.

Currently, there is no code that clears SYMBOL_WRITE of choice values.

Clear SYMBOL_WRITE for all symbols in sym_calc_value(), then set it
again after calculating visibility.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/symbol.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index c9123ed..5d6f6b1 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -371,8 +371,7 @@ void sym_calc_value(struct symbol *sym)
 		sym->curr.tri = no;
 		return;
 	}
-	if (!sym_is_choice_value(sym))
-		sym->flags &= ~SYMBOL_WRITE;
+	sym->flags &= ~SYMBOL_WRITE;
 
 	sym_calc_visibility(sym);
 
@@ -385,6 +384,7 @@ void sym_calc_value(struct symbol *sym)
 		if (sym_is_choice_value(sym) && sym->visible == yes) {
 			prop = sym_get_choice_prop(sym);
 			newval.tri = (prop_get_symbol(prop)->curr.val == sym) ? yes : no;
+			sym->flags |= SYMBOL_WRITE;
 		} else {
 			if (sym->visible != no) {
 				/* if the symbol is visible use the user value
-- 
2.7.4

