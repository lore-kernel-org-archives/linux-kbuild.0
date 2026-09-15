Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E84A3F10
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506917; cv=none; b=kxyrSSIz9R7DIkuRxafp+oUzExjSj6vjWFHlwdM8PFMRgEyHw1YQAfRB5APlSNYiib6KJuwtVqeguAnEqynUUlb47vzx/TjF+DpXK/cslOaqmTaCjxLbheri374+CqPZ0mIcKWSts++wFbW+04ZysxwvPVSnDCX7G1P7kfVhPhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506917; c=relaxed/simple;
	bh=P4GnjYvjDdXvVLPEMZ2Mvy6/y1ufQV2xiluJDL+kMZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8c+Z+1VO31j5xF5v+pVTL3DyLcXhNmchVWAslHizwJmA6LS/e1DjYAxGYfMOY2oKGg6RoDZxdIWmuzJ/ICIljzbRx4S+5DHzxPLpamzGzUL5bgPZFFne8F3AKRwqkw4nxdhehBp0cfqej2SHcIA/1NStNu14SXqBm42fWr6vCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLFnO8DN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLFnO8DN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so1308195e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 14:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506914; x=1790111714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pp18lNSpLvIszH6E7VlmBrpqKQlpHF+L0iP+RB9/Ozo=;
        b=OLFnO8DN88YVgI/pcWelaTakmEZ7LvizgCHvnEZ7wx3Pju5TQW6f5zSP3+/iVlm65F
         1Udplu4vA9UkhaUG2Q8Bm6Km8ecanss3I5PKAGZKBlxeFl1az3b22Qw+o+PYzeiRsZK3
         5kDQSGB2bbKPri2S0TiNRMgIJMkzSVgEjinnQNP7mF2xKLu9f1C3ZhdIEIyYCbNDD9qc
         sYgYs4C7S+quced2SdX3ErW7uZNz19UAZO739ne0bNL3EHlipjzMSQ5idW2iKIrXUsQ+
         1r9PjE9vsTiZ9TM9aevkR1ghOPmpjnWhZchEMJjndzd04Z2BxUSZWEQ5waD6o5dQ5wdr
         jSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506914; x=1790111714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp18lNSpLvIszH6E7VlmBrpqKQlpHF+L0iP+RB9/Ozo=;
        b=DQtnYHmBIbgzyTX9PxhXlKhSWEWlKMaBqpwMSX4n7ge2VNv4/EIFjTk0goOMBdJ0oe
         TknrXD0yhq1bfCkZlV65C/DeOmjoeQQqa/TW5gXNw8N35F4XdIlSgovCqIMvXz8HIxqt
         6x3e2RJjgY/P+p+ehepTQ4jaWuvcO+nj8vpo47t5Paw4tiYo2z4hFUYPkzGeBoIOcA00
         7I6KNG0bafP0GI89CxI9bEpoL6NLRgcKv+vJax86NXc4JT7RJSREkrzBbrFFXQrMLFs7
         VB7UFiuLe+0hBG99mIgABVBCoD9K+uLxDqPcSmJJkq0vdAf8l+kg9IrRBUUGzJC93KY1
         JG3A==
X-Forwarded-Encrypted: i=1; AKwUvBwYHUw6woimDrY+keGjwyZGNskNg4YWhvKW0JmnBplE9FccwlgQyy3xreNNmnMb1uNSlFVYRTViMkquf/M=@vger.kernel.org
X-Gm-Message-State: AFuF++lzBwXVXEB6Wi25oSe4KZlDdVqOn0/IuPLrWMQGJ92DA5AKZDRR
	3xw2aF1ymPOHxznCtxKc3A9Yxmkw9AiSdFn1iOi9mfzgt7dUmvBqvtxm
X-Gm-Gg: AYBFou3LSERJevZiIVw+PEdnKjSi8FK9qmMrhYKvTi07wDyMsMfBd8xQ4EwEK4wFSEx
	vMhfGkri593AEYsGRNt7Diqn9jaSIrTXk+1uo8d4jlVq5DbMvS56887Msbt+M2UvtZ65gYAn/ki
	fU6ECy1Xhapa/1a/IVfAtSz5zZn8F33pj5mDoIb8TNH0r+BC3IgpRQgUhKkC3YPjeZhw+7Pfdfu
	rAxp/iBvBFmvXRfE5vcudPRfFPVeSaFNP5qR/8JseGQLCmFZih3hGutWKztai+P1n+9vZX/WKLX
	1i/kfxsJkgRlBcM6Q8UzIFO7KD1wFLzFyYDgZAn71sL+RS4z0cu3SbeJCKyVaY5EAkywK+gQyfq
	osOrUoKisI3mNqtHlhfy1RTTnpS09R9UL5pBmT6tK5i8QenykRI8dsaaNsgm+GiAF7s7zoIIX1t
	VQ6s0+qxnamEh18j+y/8heFY+FbreILOaRxN46WRxmD+Bz13tB425xwcYYGoylVOm54Utj4iB7j
	/6YsGz16/IpDhZDVVJw9VrW8vcfDB4qCBsC
X-Received: by 2002:a05:600c:34c1:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e7a67e4d5mr228611075e9.9.1789506914033;
        Tue, 15 Sep 2026 14:15:14 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	kees@kernel.org,
	pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 1/5] kconfig: promote invalid numeric reference from warning to error
Date: Tue, 15 Sep 2026 22:15:04 +0100
Message-ID: <20260915211508.291790-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915211508.291790-1-julianbraha@gmail.com>
References: <20260915211508.291790-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig interpreter already warns if a numeric option attempts to use
a non-numeric option (bool, tristate, or string) to set its value (for
example, with a 'default' or 'range').

Since there is nowhere in the tree that attempts this, we can safely
promote this check from warning to error.

Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/lkc.h                         |  2 +-
 scripts/kconfig/menu.c                        | 39 ++++++----
 scripts/kconfig/parser.y                      |  2 +-
 .../tests/err_num_non_numeric_ref/Kconfig     | 75 +++++++++++++++++++
 .../tests/err_num_non_numeric_ref/__init__.py |  9 +++
 .../err_num_non_numeric_ref/expected_stderr   | 14 ++++
 6 files changed, 126 insertions(+), 15 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 7e6f6ca299cf..bbc99f75b416 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -89,7 +89,7 @@ struct property *menu_add_prompt(enum prop_type type, const char *prompt,
 				 struct expr *dep);
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
-void menu_finalize(void);
+int menu_finalize(void);
 void menu_set_type(int type);
 
 extern struct menu rootmenu;
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 9c079e92a9ed..99a57ce0fdc9 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -240,11 +240,12 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
 	       (sym2->type == S_UNKNOWN && sym_string_valid(sym, sym2->name));
 }
 
-static void sym_check_prop(struct symbol *sym)
+static int sym_check_prop(struct symbol *sym)
 {
 	struct property *prop;
 	struct symbol *sym2;
 	char *use;
+	int errors = 0;
 
 	for (prop = sym->prop; prop; prop = prop->next) {
 		switch (prop->type) {
@@ -258,10 +259,13 @@ static void sym_check_prop(struct symbol *sym)
 				break;
 			sym2 = prop_get_symbol(prop);
 			if (sym->type == S_HEX || sym->type == S_INT) {
-				if (!menu_validate_number(sym, sym2))
-					prop_warn(prop,
-					    "'%s': number is invalid",
-					    sym->name);
+				if (!menu_validate_number(sym, sym2)) {
+					fprintf(stderr,
+						"%s:%d: error: '%s': number is invalid\n",
+						prop->filename, prop->lineno,
+						sym->name);
+					errors++;
+				}
 			}
 			if (sym_is_choice(sym)) {
 				struct menu *choice = sym_get_choice_menu(sym2);
@@ -293,21 +297,28 @@ static void sym_check_prop(struct symbol *sym)
 				prop_warn(prop, "range is only allowed "
 						"for int or hex symbols");
 			if (!menu_validate_number(sym, prop->expr->left.sym) ||
-			    !menu_validate_number(sym, prop->expr->right.sym))
-				prop_warn(prop, "range is invalid");
+			    !menu_validate_number(sym, prop->expr->right.sym)) {
+				fprintf(stderr,
+					"%s:%d: error: range is invalid\n",
+					prop->filename, prop->lineno);
+				errors++;
+			}
 			break;
 		default:
 			;
 		}
 	}
+
+	return errors;
 }
 
-static void _menu_finalize(struct menu *parent, bool inside_choice)
+static int _menu_finalize(struct menu *parent, bool inside_choice)
 {
 	struct menu *menu, *last_menu;
 	struct symbol *sym;
 	struct property *prop;
 	struct expr *basedep, *dep, *dep2;
+	int errors = 0;
 
 	sym = parent->sym;
 	if (parent->list) {
@@ -393,7 +404,7 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 		 * moving on
 		 */
 		for (menu = parent->list; menu; menu = menu->next)
-			_menu_finalize(menu, sym && sym_is_choice(sym));
+			errors += _menu_finalize(menu, sym && sym_is_choice(sym));
 	} else if (!inside_choice && sym) {
 		/*
 		 * Automatic submenu creation. If sym is a symbol and A, B, C,
@@ -461,7 +472,7 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 			}
 			/* Superset, put in submenu */
 		next:
-			_menu_finalize(menu, false);
+			errors += _menu_finalize(menu, false);
 			menu->parent = parent;
 			last_menu = menu;
 		}
@@ -519,14 +530,16 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 			menu_warn(parent, "config symbol defined without type");
 
 		/* Check properties connected to this symbol */
-		sym_check_prop(sym);
+		errors += sym_check_prop(sym);
 		sym->flags |= SYMBOL_WARNED;
 	}
+
+	return errors;
 }
 
-void menu_finalize(void)
+int menu_finalize(void)
 {
-	_menu_finalize(&rootmenu, false);
+	return _menu_finalize(&rootmenu, false);
 }
 
 bool menu_has_prompt(const struct menu *menu)
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 5fb6f07b6ad2..40ceb9908c6f 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -587,7 +587,7 @@ void conf_parse(const char *name)
 		menu_add_prompt(P_MENU, "Main menu", NULL);
 	}
 
-	menu_finalize();
+	yynerrs += menu_finalize();
 
 	menu_for_each_entry(menu) {
 		struct menu *child;
diff --git a/scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig b/scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
new file mode 100644
index 000000000000..0ca7a4a460f6
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+# Test non-numeric symbol references from numeric symbols
+
+config BOOL_SOURCE
+	bool
+
+config TRISTATE_SOURCE
+	tristate
+
+config STRING_SOURCE
+	string
+
+# Invalid int defaults
+
+config INT_DEFAULT_BOOL
+	int
+	default BOOL_SOURCE
+
+config INT_DEFAULT_TRISTATE
+	int
+	default TRISTATE_SOURCE
+
+config INT_DEFAULT_STRING
+	int
+	default STRING_SOURCE
+
+# Invalid hex defaults
+
+config HEX_DEFAULT_BOOL
+	hex
+	default BOOL_SOURCE
+
+config HEX_DEFAULT_TRISTATE
+	hex
+	default TRISTATE_SOURCE
+
+config HEX_DEFAULT_STRING
+	hex
+	default STRING_SOURCE
+
+# Invalid int ranges
+
+config INT_RANGE_BOOL
+	int
+	range BOOL_SOURCE 1
+
+config INT_RANGE_TRISTATE
+	int
+	range TRISTATE_SOURCE 1
+
+config INT_RANGE_STRING
+	int
+	range STRING_SOURCE 1
+
+config INT_RANGE_MULTIPLE
+	int
+	range BOOL_SOURCE TRISTATE_SOURCE
+
+# Invalid hex ranges
+
+config HEX_RANGE_BOOL
+	hex
+	range BOOL_SOURCE 0x1
+
+config HEX_RANGE_TRISTATE
+	hex
+	range TRISTATE_SOURCE 0x1
+
+config HEX_RANGE_STRING
+	hex
+	range STRING_SOURCE 0x1
+
+config HEX_RANGE_MULTIPLE
+	hex
+	range BOOL_SOURCE TRISTATE_SOURCE
diff --git a/scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py b/scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
new file mode 100644
index 000000000000..9632907abead
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Reject nonnumeric symbol references from int and hex properties.
+"""
+
+
+def test(conf):
+    assert conf.olddefconfig() == 1
+    assert conf.stderr_matches('expected_stderr')
diff --git a/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr b/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
new file mode 100644
index 000000000000..4974ba2fcd9c
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
@@ -0,0 +1,14 @@
+Kconfig:17: error: 'INT_DEFAULT_BOOL': number is invalid
+Kconfig:21: error: 'INT_DEFAULT_TRISTATE': number is invalid
+Kconfig:25: error: 'INT_DEFAULT_STRING': number is invalid
+Kconfig:31: error: 'HEX_DEFAULT_BOOL': number is invalid
+Kconfig:35: error: 'HEX_DEFAULT_TRISTATE': number is invalid
+Kconfig:39: error: 'HEX_DEFAULT_STRING': number is invalid
+Kconfig:45: error: range is invalid
+Kconfig:49: error: range is invalid
+Kconfig:53: error: range is invalid
+Kconfig:57: error: range is invalid
+Kconfig:63: error: range is invalid
+Kconfig:67: error: range is invalid
+Kconfig:71: error: range is invalid
+Kconfig:75: error: range is invalid
-- 
2.55.0

