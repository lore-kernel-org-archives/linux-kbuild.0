Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45574 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbfLQQPz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 11:15:55 -0500
From: Thomas Hebb <tommyhebb@gmail.com>
Subject: [PATCH v2 3/3] kconfig: fix nesting of symbol help text
Date: Tue, 17 Dec 2019 08:15:45 -0800
Message-Id: <51c902d29bf8748c411f78405f9638109a5cf4c6.1576599202.git.tommyhebb@gmail.com>
In-Reply-To: <cover.1576599202.git.tommyhebb@gmail.com>
References: <cover.1576599202.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Thomas Hebb <tommyhebb@gmail.com>

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
  Defined at drivers/cpufreq/Kconfig:4
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
  Defined at drivers/cpufreq/Kconfig:4
    Prompt: CPU Frequency scaling
    Location:
      -> CPU Power Management
        -> CPU Frequency scaling
  Selects: SRCU [=n]
  Selected by [n]:
    - ARCH_SA1100 [=n] && <choice>

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

Changes in v2: None

 scripts/kconfig/menu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index dcf7f32f0bba..ef36d1cf2a76 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -838,18 +838,18 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
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
2.24.1
