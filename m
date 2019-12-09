Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45278 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfLIITb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Dec 2019 03:19:31 -0500
From: Thomas Hebb <tommyhebb@gmail.com>
Subject: [PATCH 4/4] kconfig: fix nesting of symbol help text
Date: Mon,  9 Dec 2019 00:19:19 -0800
Message-Id: <4bbeef61f292caaeae4b555edf42820d113a4d4d.1575879069.git.tommyhebb@gmail.com>
In-Reply-To: <cover.1575879069.git.tommyhebb@gmail.com>
References: <cover.1575879069.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Thomas Hebb <tommyhebb@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

When we generate the help text of a symbol (e.g. when a user presses '?'
in menuconfig), we do two things:

 1. We iterate through every prompt that belongs to that symbol,
    printing its text and its location in the menu tree.
 2. We print symbol-wide information that's not linked to a particular
    prompt, such as what it selects/is selected by and what it
    implies/is implied by.

Each prompt we print for 1 starts with a line that's not indented
indicating where the prompt is defined, then continues with indented
lines that describe properties of that particular definition.

Once we get to 2, however, we print all the global data indented as
well! Visually, this makes it look like the symbol-wide data is
associated with the last prompt we happened to print rather than
the symbol as a whole.

Fix this by removing the indentation for symbol-wide information.

Before:

  Symbol: CPU_FREQ [=n]
  Type  : bool
  Defined with prompt at drivers/cpufreq/Kconfig:4
    Prompt: CPU Frequency scaling
    Location:
      -> CPU Power Management
        -> CPU Frequency scaling
    Selects: SRCU [=n]
    Selected by [n]:
    - ARCH_SA1100 [=n] && <choice>

After:

  Symbol: CPU_FREQ [=n]
  Type  : bool
  Defined with prompt at drivers/cpufreq/Kconfig:4
    Prompt: CPU Frequency scaling
    Location:
      -> CPU Power Management
        -> CPU Frequency scaling
  Selects: SRCU [=n]
  Selected by [n]:
    - ARCH_SA1100 [=n] && <choice>

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---
 scripts/kconfig/menu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4d0542875d70..25d836aa60fc 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -831,18 +831,18 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 		}
 	}
 
-	get_symbol_props_str(r, sym, P_SELECT, "  Selects: ");
+	get_symbol_props_str(r, sym, P_SELECT, "Selects: ");
 	if (sym->rev_dep.expr) {
-		expr_gstr_print_revdep(sym->rev_dep.expr, r, yes, "  Selected by [y]:\n");
-		expr_gstr_print_revdep(sym->rev_dep.expr, r, mod, "  Selected by [m]:\n");
-		expr_gstr_print_revdep(sym->rev_dep.expr, r, no, "  Selected by [n]:\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, yes, "Selected by [y]:\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, mod, "Selected by [m]:\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, no, "Selected by [n]:\n");
 	}
 
-	get_symbol_props_str(r, sym, P_IMPLY, "  Implies: ");
+	get_symbol_props_str(r, sym, P_IMPLY, "Implies: ");
 	if (sym->implied.expr) {
-		expr_gstr_print_revdep(sym->implied.expr, r, yes, "  Implied by [y]:\n");
-		expr_gstr_print_revdep(sym->implied.expr, r, mod, "  Implied by [m]:\n");
-		expr_gstr_print_revdep(sym->implied.expr, r, no, "  Implied by [n]:\n");
+		expr_gstr_print_revdep(sym->implied.expr, r, yes, "Implied by [y]:\n");
+		expr_gstr_print_revdep(sym->implied.expr, r, mod, "Implied by [m]:\n");
+		expr_gstr_print_revdep(sym->implied.expr, r, no, "Implied by [n]:\n");
 	}
 
 	str_append(r, "\n\n");
-- 
2.24.0
