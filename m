Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.fiord.ru ([62.140.247.50]:39748 "EHLO mail.fiord.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753047AbdEJN0F (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 May 2017 09:26:05 -0400
Subject: [GIT] [PATCH 1/1] kbuild: Add wrapping of long expressions at ORs
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 10 May 2017 16:06:48 +0300
From: Alexander Amelkin <alexander@amelkin.msk.ru>
Message-ID: <2b001634fc74aaabc1ab988ffb1d388b@amelkin.online>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

The following changes since commit 
a351e9b9fc24e982ec2f0e76379a49826036da12:

   Linux 4.11 (2017-04-30 19:47:48 -0700)

are available in the git repository at:

   https://github.com/AlexanderAmelkin/linux-wandboard.git 
tags/kconfig_wrapping

for you to fetch changes up to f4c95059bd2410ac96d6ef9f8848a0f0b757a17a:

   kconfig: Add wrapping of long expressions at ORs (2017-05-10 12:51:31 
+0300)

----------------------------------------------------------------
Some symbols in configuration may be selected by very-very long boolean
expressions. Reading through such long expressions, it is extremely hard
to identify what exactly selects the given option.

This commit adds a new line every time a boolean OR is encountered in
the "outer" expression. That is, it won't break apart separate
sub-expressions like OPTION_A && (OPTION_B || OPTION_C), but will add a
new line before OPTION_C in an expression like:

OPTION_A && OPTION_B || OPTION_C && OPTION_D

This commit also adds indentation of the wrapped lines to the label
position. That is, the expression on the new line will continue starting
at the same character position as it started in the first line, right
after the label such as "  Selected by:  ".

This commit also renames some variables to better reflect their purpose.

Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

----------------------------------------------------------------
Alexander Amelkin (1):
       kconfig: Add wrapping of long expressions at ORs

  scripts/kconfig/expr.c | 48 
++++++++++++++++++++++++++++++++++++++++--------
  scripts/kconfig/lkc.h  | 15 ++++++++++++---
  scripts/kconfig/menu.c | 16 +++++++++++++---
  scripts/kconfig/util.c |  1 +
  4 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index cbf4996..b0d9765 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1170,6 +1170,27 @@ void expr_fprint(struct expr *e, FILE *out)
         expr_print(e, expr_print_file_helper, out, E_NONE);
  }

+static int str_chrcount(const char *s, char c)
+{
+       int count = 0;
+       const char *p = s;
+
+       while (NULL != (p = strchr(p, c))) {
+               p++;
+               count++;
+       }
+       return count;
+}
+
+static void str_newline_indented(struct gstr *gs)
+{
+       int i;
+
+       str_append(gs, "\\\n");
+       for (i = 0; i < gs->label_len; i++)
+               str_append(gs, " ");
+}
+
  static void expr_print_gstr_helper(void *data, struct symbol *sym, 
const char *str)
  {
         struct gstr *gs = (struct gstr*)data;
@@ -1179,25 +1200,36 @@ static void expr_print_gstr_helper(void *data, 
struct symbol *sym, const char *s
                 sym_str = sym_get_string_value(sym);

         if (gs->max_width) {
-               unsigned extra_length = strlen(str);
+               unsigned int added_length = strlen(str);
                 const char *last_cr = strrchr(gs->s, '\n');
-               unsigned last_line_length;
+               unsigned int this_line_length;

                 if (sym_str)
-                       extra_length += 4 + strlen(sym_str);
+                       added_length += 4 + strlen(sym_str);

                 if (!last_cr)
-                       last_cr = gs->s;
-
-               last_line_length = strlen(gs->s) - (last_cr - gs->s);
+                       /* Account for the label not included in the 
first line */
+                       this_line_length = strlen(gs->s) + 
gs->label_len;
+               else
+                       /* Subsequent lines already contain the indent 
inside them */
+                       this_line_length = strlen(last_cr + 1);

-               if ((last_line_length + extra_length) > gs->max_width)
-                       str_append(gs, "\\\n");
+               if ((this_line_length + added_length) > gs->max_width)
+                       str_newline_indented(gs);
         }

         str_append(gs, str);
         if (sym && sym->type != S_UNKNOWN)
                 str_printf(gs, " [=%s]", sym_str);
+
+       /* Break the line on an OR for 'outer' expressions,
+          don't break inside parentheses. */
+       if (str_chrcount(gs->s, '(') == str_chrcount(gs->s, ')')) {
+               int len = strlen(str);
+
+               if (len >= 4 && !strcmp(str + len - 4, " || "))
+                       str_newline_indented(gs);
+       }
  }

  void expr_gstr_print(struct expr *e, struct gstr *gs)
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 91ca126..2bf6704 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -120,10 +120,19 @@ struct gstr {
         size_t len;
         char  *s;
         /*
-       * when max_width is not zero long lines in string s (if any) get
-       * wrapped not to exceed the max_width value
-       */
+        * when max_width is not zero long lines in string s (if any) 
get
+        * wrapped not to exceed the max_width value
+        */
         int max_width;
+       /*
+        * The label for the string. Usually the string is output to the 
right
+        * from the label in the same line. The label_len is used to 
indent
+        * lines when they are too long and wrapping is required.
+        *
+        * Set this property before calling expr_gstr_print() on a gstr 
if
+        * a long (wrappable) list of expressions is possible.
+        */
+       int label_len;
  };
  struct gstr str_new(void);
  void str_free(struct gstr *gs);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e935793..3a7d5a6 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -629,6 +629,7 @@ static void get_symbol_props_str(struct gstr *r, 
struct symbol *sym,
         for_all_properties(sym, prop, tok) {
                 if (!hit) {
                         str_append(r, prefix);
+                       r->label_len = strlen(prefix);
                         hit = true;
                 } else
                         str_printf(r, " && ");
@@ -667,7 +668,10 @@ static void get_symbol_str(struct gstr *r, struct 
symbol *sym,
                 str_printf(r, _("  Defined at %s:%d\n"), 
prop->menu->file->name,
                         prop->menu->lineno);
                 if (!expr_is_yes(prop->visible.expr)) {
-                       str_append(r, _("  Depends on: "));
+                       const char *label = _("  Depends on: ");
+
+                       r->label_len = strlen(label);
+                       str_append(r, label);
                         expr_gstr_print(prop->visible.expr, r);
                         str_append(r, "\n");
                 }
@@ -675,14 +679,20 @@ static void get_symbol_str(struct gstr *r, struct 
symbol *sym,

         get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
         if (sym->rev_dep.expr) {
-               str_append(r, _("  Selected by: "));
+               const char *label = _("  Selected by: ");
+
+               r->label_len = strlen(label);
+               str_append(r, label);
                 expr_gstr_print(sym->rev_dep.expr, r);
                 str_append(r, "\n");
         }

         get_symbol_props_str(r, sym, P_IMPLY, _("  Implies: "));
         if (sym->implied.expr) {
-               str_append(r, _("  Implied by: "));
+               const char *label = _("  Implied by: ");
+
+               r->label_len = strlen(label);
+               str_append(r, label);
                 expr_gstr_print(sym->implied.expr, r);
                 str_append(r, "\n");
         }
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 0e76042..79ddbf9 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -84,6 +84,7 @@ struct gstr str_new(void)
         gs.s = xmalloc(sizeof(char) * 64);
         gs.len = 64;
         gs.max_width = 0;
+       gs.label_len = 0;
         strcpy(gs.s, "\0");
         return gs;
  }

