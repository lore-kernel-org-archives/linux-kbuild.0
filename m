Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57759 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752637AbeBPSlS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:18 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 08/23] kconfig: add 'macro' keyword to support user-defined function
Date: Sat, 17 Feb 2018 03:38:36 +0900
Message-Id: <1518806331-7101-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Now, we got a basic ability to test compiler capability in Kconfig.

config CC_HAS_STACKPROTECTOR
        bool
        default $(shell $CC -Werror -fstack-protector -c -x c /dev/null -o /dev/null)

This works, but it is ugly to repeat this long boilerplate.

We want to describe like this:

config CC_HAS_STACKPROTECTOR
        bool
        default $(cc-option -fstack-protector)

It is straight-forward to implement a new function, but I do not like
to hard-code specialized functions like this.  Hence, here is another
feature to add functions from Kconfig files.

A user-defined function can be defined as a string type symbol with
a special keyword 'macro'.  It can be referenced in the same way as
built-in functions.  This feature was also inspired by Makefile where
user-defined functions are referenced by $(call func-name, args...),
but I omitted the 'call' to makes it shorter.

The macro definition can contain $(1), $(2), ... which will be replaced
with arguments from the caller.

Example code:

  config cc-option
          string
          macro $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)

  config CC_HAS_STACKPROTECTOR
          bool
          default $(cc-option -fstack-protector)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Reminder for myself:
Update Documentation/kbuild/kconfig-language.txt

 scripts/kconfig/function.c  | 66 +++++++++++++++++++++++++++++++++++++++++----
 scripts/kconfig/kconf_id.c  |  1 +
 scripts/kconfig/lkc_proto.h |  1 +
 scripts/kconfig/zconf.y     |  8 ++++++
 4 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/function.c b/scripts/kconfig/function.c
index 60e59be..f7f154d 100644
--- a/scripts/kconfig/function.c
+++ b/scripts/kconfig/function.c
@@ -14,7 +14,8 @@ static LIST_HEAD(function_list);
 
 struct function {
 	const char *name;
-	char *(*func)(int argc, char *argv[]);
+	char *(*func)(struct function *f, int argc, char *argv[]);
+	void *priv;
 	struct list_head node;
 };
 
@@ -30,7 +31,9 @@ static struct function *func_lookup(const char *name)
 	return NULL;
 }
 
-static void func_add(const char *name, char *(*func)(int argc, char *argv[]))
+static void func_add(const char *name,
+		     char *(*func)(struct function *f, int argc, char *argv[]),
+		     void *priv)
 {
 	struct function *f;
 
@@ -43,6 +46,7 @@ static void func_add(const char *name, char *(*func)(int argc, char *argv[]))
 	f = xmalloc(sizeof(*f));
 	f->name = name;
 	f->func = func;
+	f->priv = priv;
 
 	list_add_tail(&f->node, &function_list);
 }
@@ -50,6 +54,7 @@ static void func_add(const char *name, char *(*func)(int argc, char *argv[]))
 static void func_del(struct function *f)
 {
 	list_del(&f->node);
+	free(f->priv);
 	free(f);
 }
 
@@ -63,7 +68,7 @@ static char *func_call(int argc, char *argv[])
 		return NULL;
 	}
 
-	return f->func(argc, argv);
+	return f->func(f, argc, argv);
 }
 
 static char *func_eval(const char *func)
@@ -106,8 +111,59 @@ char *func_eval_n(const char *func, size_t n)
 	return res;
 }
 
+/* run user-defined function */
+static char *do_macro(struct function *f, int argc, char *argv[])
+{
+	char *new;
+	char *src, *p, *res;
+	size_t newlen;
+	int n;
+
+	new = xmalloc(1);
+	*new = 0;
+
+	/*
+	 * This is a format string. $(1), $(2), ... must be replaced with
+	 * function arguments.
+	 */
+	src = f->priv;
+	p = src;
+
+	while ((p = strstr(p, "$("))) {
+		if (isdigit(p[2]) && p[3] == ')') {
+			n = p[2] - '0';
+			if (n < argc) {
+				newlen = strlen(new) + (p - src) +
+							strlen(argv[n]) + 1;
+				new = xrealloc(new, newlen);
+				strncat(new, src, p - src);
+				strcat(new, argv[n]);
+				src = p + 4;
+			}
+			p += 2;
+		}
+		p += 2;
+	}
+
+	newlen = strlen(new) + strlen(src) + 1;
+	new = xrealloc(new, newlen);
+	strcat(new, src);
+
+	res = expand_string_value(new);
+
+	free(new);
+
+	return res;
+}
+
+/* add user-defined function (macro) */
+void func_add_macro(const char *name, char *macro)
+{
+	func_add(name, do_macro, macro);
+}
+
 /* built-in functions */
-static char *do_shell(int argc, char *argv[])
+static char *do_shell(struct function *f, int argc, char *argv[])
 {
 	static const char *pre = "(";
 	static const char *post = ") >/dev/null 2>&1";
@@ -136,7 +192,7 @@ static char *do_shell(int argc, char *argv[])
 void func_init(void)
 {
 	/* register built-in functions */
-	func_add("shell", do_shell);
+	func_add("shell", do_shell, NULL);
 }
 
 void func_exit(void)
diff --git a/scripts/kconfig/kconf_id.c b/scripts/kconfig/kconf_id.c
index b3e0ea0..5a1357d 100644
--- a/scripts/kconfig/kconf_id.c
+++ b/scripts/kconfig/kconf_id.c
@@ -28,6 +28,7 @@ static struct kconf_id kconf_id_array[] = {
 	{ "imply",		T_IMPLY,		TF_COMMAND },
 	{ "range",		T_RANGE,		TF_COMMAND },
 	{ "visible",		T_VISIBLE,		TF_COMMAND },
+	{ "macro",		T_MACRO,		TF_COMMAND },
 	{ "option",		T_OPTION,		TF_COMMAND },
 	{ "on",			T_ON,			TF_PARAM },
 	{ "modules",		T_OPT_MODULES,		TF_OPTION },
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 09a4f53..25caca3 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -50,6 +50,7 @@ const char * prop_get_type_name(enum prop_type type);
 
 /* function.c */
 char *func_eval_n(const char *func, size_t n);
+void func_add_macro(const char *name, char *macro);
 void func_init(void);
 void func_exit(void);
 
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index d9977de..19452b6 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -65,6 +65,7 @@ static struct menu *current_menu, *current_entry;
 %token <id>T_IMPLY
 %token <id>T_RANGE
 %token <id>T_VISIBLE
+%token <id>T_MACRO
 %token <id>T_OPTION
 %token <id>T_ON
 %token <string> T_WORD
@@ -199,6 +200,7 @@ config_option_list:
 	| config_option_list config_option
 	| config_option_list symbol_option
 	| config_option_list depends
+	| config_option_list macro
 	| config_option_list help
 	| config_option_list option_error
 	| config_option_list T_EOL
@@ -246,6 +248,12 @@ config_option: T_RANGE symbol symbol if_expr T_EOL
 	printd(DEBUG_PARSE, "%s:%d:range\n", zconf_curname(), zconf_lineno());
 };
 
+macro: T_MACRO T_WORD T_EOL
+{
+	current_entry->sym->flags |= SYMBOL_AUTO;
+	func_add_macro(current_entry->sym->name, $2);
+}
+
 symbol_option: T_OPTION symbol_option_list T_EOL
 ;
 
-- 
2.7.4

