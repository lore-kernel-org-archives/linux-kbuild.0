Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6674AA3F6
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506920; cv=none; b=En9HsaOLOxiC4kP3g/+w5u9DpV/Xq0DKua+2iGAOUJ7bIB+GYzeISZGuodUKHejlNkbQYHzWrKKlmOTGwTV3imACZyGxxiUWajytD42G3LiZuDjz9ujyNXzaI2O92K0rxiQCVReoryM+IGTXF9LgLzw+m70Z3WO0NTMeFtoCjhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506920; c=relaxed/simple;
	bh=3psxrsfWdIlR+uDQcWe+rgSTzb3QV8s1q2v5Lu0dofk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ty7h9L8tc5VqwBHQBWJ4ah0UkCHY14U8smnrUTd2nJ5wV2SpMq4+EpPP4d4X2lWNUoejNeZQDPmr7W2Jb9hT5jGgtnCuDAxhVmYxPtT4atILFmqHBgqYjjASSQv/SMqvJtAvg0q9+TIOXgMe0NCXTwV/N5L7uhxSqWQUwalYFRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkVpcoMT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkVpcoMT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so1912475e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 14:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506916; x=1790111716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emUgjgJBLOzRZSL8qI4Q3Z9mtgFScVqVYtdaLTRXLjA=;
        b=NkVpcoMT+N5HyQ6biBkQcKc+aoYIOrVs0FI6mpfG0vUVoNrVbex1ERvKFpMaGH8o22
         qxSdUUC1QenvGvCufQLqt5DTA4G4KF3JKi+XkX043NOCmBgnnUkX3UkQHec+08aeg6j4
         /Zba6bxNyLbwJwT1BHFBF7geX1l4+5+eSjFIPO5DeDtwvBwl16rV3JIYtrx1dg0JVAfX
         Qo7m//VYVXLtSwnixEMrizfMa5iulA/IujVQbyFo20aFpxGi7ePZDv2sb6kDh1T7Wyj5
         tIEh7Pk5jB4RmNjYk5jpAMJpN/8lz4zHWtYdQOETfn5Q6vpJ2rR0C5aFB60We/PprmoP
         5/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506916; x=1790111716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emUgjgJBLOzRZSL8qI4Q3Z9mtgFScVqVYtdaLTRXLjA=;
        b=1vkNUhKHKjUe8LcLv2xesWGtKB8tn5DE/jA1cvaF6L3BRGDI87+F2+Mk7SYDceS2js
         f9c8Gof84wIaHqJLyg9jk/R1GuqvWwRACabjECCML6HErXuUHb6upwQUcNHZ0XiwLhbw
         3Ipq6+Owo02f4B3G5xw4sGQqHWK7WG+0BBcveRSSDCdyVcxm6u2DviZoklRAKrz5WcGj
         kk6oHx+ClcbxB4ZSyxCz+mD0u4xNVAFnloozjuXN8vnL7VHH/wwREMCeLsDy7WTZtG1r
         m41VJU67tj7iKOPuyAL2ycfl76a9qN4qOU4Ei0yV6RMFlVoiV7OpmXr2BcdSjKW+iN3N
         6H6g==
X-Forwarded-Encrypted: i=1; AKwUvByriPkcpsrNuDjp4kYRUDS+ZZo/ldooGGIL795EImqTqstWFAqoAfZcNIqUal/o90qBSAsXZMyEEdrkwqk=@vger.kernel.org
X-Gm-Message-State: AFuF++lKqG+jhoEbI8mSnhQgqxfsAaMcywPxjWWFAts+HJFUQoFfgsH8
	QCbNS9kZ4vKAA1nenRLf5HYFdISzUd5+heoc+0aSZBYbD4dUMZZt78u5
X-Gm-Gg: AYBFou0GTi0cm2DJqojEDKB4tnkwnYYhHOdnNWc/5vKcHicvBrH1wAPEEg+wsuKtstL
	eGPR7dqrmcQvdJn73MffrGXYWMGXikLipREtYbSTfTF38auebFuKfPrOdUQJS97yoPoqJFwO7qh
	7MqLw3VRWVeS7XjnkiXZGBhVWIIhdLILnF6klmob8FdRIjRr6DYxNDOWYg20+upIqqc4drQneNC
	HLrlRN9ispTnwANqJbQOIuJ7yWY6cvahlnP1jvfpRTb3fBy6fFgRecKIX59oIlV8tc+t/0waSsw
	ijo1uHik59WLoB2HDgShOPmb1KlngPIg01Q1Z25gYyAP+5saKiGa3Zy0nFd3ly+piAuQmtnifVH
	4181I693DzLhXDdJ2koKfGyGDJVsYIq7AQ5C9QvYeBui41cssXedTJ4HUZwI2IlvSJqhLHKDrZt
	0B1jNyN1pReAr1F52HPp9wGgGKMScoaixYeXqTQS/kIX8ExpFAL1WC8yEKjGSqOiJCRfBvh+ByE
	PG53jSsFu5nPV4VLXMXr98Pbe9glUpG9lkz
X-Received: by 2002:a05:600c:c4a2:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49e8224ff79mr37273785e9.14.1789506915874;
        Tue, 15 Sep 2026 14:15:15 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:15 -0700 (PDT)
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
Subject: [PATCH v2 2/5] kconfig: check for out-of-bounds numeric constants
Date: Tue, 15 Sep 2026 22:15:05 +0100
Message-ID: <20260915211508.291790-3-julianbraha@gmail.com>
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

The Kconfig interpreter internally represents constants as strings, then
attempts to parse them as 64-bit signed integers for 'int' options, and
64-bit unsigned integers for 'hex' options.

However, there is currently no check that the conversion succeeds, leading
to failures when the values are actually used. For example:

  config LARGE_INT
    int
    default 10000000000000000000

  config BUGGED_INT_COMPARISON
    bool
    default y if LARGE_INT < 2

Obviously 10000000000000000000 is larger than 2, but the Kconfig
interpreter will fallback to comparing the two values with strcmp() after
the numeric conversion fails, causing the first character, '1', to be
compared with '2', and giving the wrong result.

Since none of these out-of-bounds values are used as constants anywhere in
the tree, we can already make these error out.

Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c                        | 60 ++++++++++----
 scripts/kconfig/tests/err_num_bounds/Kconfig  | 79 +++++++++++++++++++
 .../kconfig/tests/err_num_bounds/__init__.py  | 12 +++
 .../tests/err_num_bounds/expected_stderr      | 10 +++
 .../err_num_non_numeric_ref/expected_stderr   | 30 +++----
 5 files changed, 160 insertions(+), 31 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_bounds/expected_stderr

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 99a57ce0fdc9..ede791a2fe1b 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -4,6 +4,7 @@
  */
 
 #include <ctype.h>
+#include <errno.h>
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
@@ -234,10 +235,46 @@ void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
 	menu_add_prop(type, expr_alloc_symbol(sym), dep);
 }
 
-static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
+/* Validate the sym2 value for numeric sym. */
+static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
+				const struct property *prop)
 {
-	return sym2->type == S_INT || sym2->type == S_HEX ||
-	       (sym2->type == S_UNKNOWN && sym_string_valid(sym, sym2->name));
+	const char *type_bounds;
+
+	if (sym->type != S_INT && sym->type != S_HEX)
+		return 0;
+
+	if (sym2->type == S_INT || sym2->type == S_HEX)
+		return 0;
+
+	if (sym2->type != S_UNKNOWN ||
+		!sym_string_valid(sym, sym2->name)) {
+		fprintf(stderr, "%s:%d: error: '%s' is an invalid value for '%s'\n",
+			prop->filename, prop->lineno, sym2->name,
+			sym_type_name(sym->type));
+		return 1;
+	}
+
+	errno = 0;
+	if (sym->type == S_INT) {
+		type_bounds = "64-bit signed integer";
+		strtoll(sym2->name, NULL, 10);
+	} else {
+		/* hex */
+		type_bounds = "64-bit unsigned integer";
+		strtoull(sym2->name, NULL, 16);
+	}
+
+	if (errno == ERANGE) {
+		fprintf(stderr,
+			"%s:%d: error: %s constant '%s' is outside the %s bounds\n",
+			prop->filename, prop->lineno, sym_type_name(sym->type),
+			sym2->name, type_bounds);
+
+		return 1;
+	}
+
+	return 0;
 }
 
 static int sym_check_prop(struct symbol *sym)
@@ -259,13 +296,7 @@ static int sym_check_prop(struct symbol *sym)
 				break;
 			sym2 = prop_get_symbol(prop);
 			if (sym->type == S_HEX || sym->type == S_INT) {
-				if (!menu_validate_number(sym, sym2)) {
-					fprintf(stderr,
-						"%s:%d: error: '%s': number is invalid\n",
-						prop->filename, prop->lineno,
-						sym->name);
-					errors++;
-				}
+				errors += menu_validate_number(sym, sym2, prop);
 			}
 			if (sym_is_choice(sym)) {
 				struct menu *choice = sym_get_choice_menu(sym2);
@@ -296,13 +327,8 @@ static int sym_check_prop(struct symbol *sym)
 			if (sym->type != S_INT && sym->type != S_HEX)
 				prop_warn(prop, "range is only allowed "
 						"for int or hex symbols");
-			if (!menu_validate_number(sym, prop->expr->left.sym) ||
-			    !menu_validate_number(sym, prop->expr->right.sym)) {
-				fprintf(stderr,
-					"%s:%d: error: range is invalid\n",
-					prop->filename, prop->lineno);
-				errors++;
-			}
+			errors += menu_validate_number(sym, prop->expr->left.sym, prop);
+			errors += menu_validate_number(sym, prop->expr->right.sym, prop);
 			break;
 		default:
 			;
diff --git a/scripts/kconfig/tests/err_num_bounds/Kconfig b/scripts/kconfig/tests/err_num_bounds/Kconfig
new file mode 100644
index 000000000000..c439366c03b6
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_bounds/Kconfig
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+# Test bounds checks for 'int' and 'hex' constants
+
+config INT_SOURCE
+	int
+
+config HEX_SOURCE
+	hex
+
+config BOOL_SOURCE
+	bool
+
+# Valid values at the limits of the type
+
+config INT_MIN
+	int
+	default -9223372036854775808
+
+config INT_MAX
+	int
+	default 9223372036854775807
+
+config HEX_MIN
+	hex
+	default 0x0
+
+config HEX_MAX
+	hex
+	default 0xffffffffffffffff
+
+config INT_RANGE_LIMITS
+	int
+	range -9223372036854775808 9223372036854775807
+
+config HEX_RANGE_LIMITS
+	hex
+	range 0 0xffffffffffffffff
+
+config INT_FROM_INT
+	int
+	default INT_SOURCE
+
+config HEX_FROM_HEX
+	hex
+	default HEX_SOURCE
+
+# Constants outside the bounds
+
+config INT_DEFAULT_TOO_HIGH
+	int
+	default 10000000000000000000
+
+config INT_DEFAULT_TOO_LOW
+	int
+	default -9223372036854775809
+
+config INT_RANGE_TOO_HIGH
+	int
+	range 0 10000000000000000000
+
+config INT_RANGE_TOO_LOW
+	int
+	range -10000000000000000000 0
+
+config INT_RANGE_BOTH_OUTSIDE
+	int
+	range -9223372036854775809 10000000000000000000
+
+config HEX_DEFAULT_TOO_HIGH
+	hex
+	default 0x10000000000000000
+
+config HEX_RANGE_TOO_HIGH
+	hex
+	range 0 0x10000000000000000
+
+config HEX_RANGE_BOTH_TOO_HIGH
+	hex
+	range 0x10000000000000000 0x20000000000000000
diff --git a/scripts/kconfig/tests/err_num_bounds/__init__.py b/scripts/kconfig/tests/err_num_bounds/__init__.py
new file mode 100644
index 000000000000..72ac6aa24491
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_bounds/__init__.py
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Detect constants outside the 'int' and 'hex' bounds.
+
+An int constant must fit in a signed 64-bit integer, and a hex constant must
+fit in an unsigned 64-bit integer.
+"""
+
+
+def test(conf):
+    assert conf.olddefconfig() == 1
+    assert conf.stderr_matches('expected_stderr')
diff --git a/scripts/kconfig/tests/err_num_bounds/expected_stderr b/scripts/kconfig/tests/err_num_bounds/expected_stderr
new file mode 100644
index 000000000000..3f06e13359ef
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_bounds/expected_stderr
@@ -0,0 +1,10 @@
+Kconfig:51: error: integer constant '10000000000000000000' is outside the 64-bit signed integer bounds
+Kconfig:55: error: integer constant '-9223372036854775809' is outside the 64-bit signed integer bounds
+Kconfig:59: error: integer constant '10000000000000000000' is outside the 64-bit signed integer bounds
+Kconfig:63: error: integer constant '-10000000000000000000' is outside the 64-bit signed integer bounds
+Kconfig:67: error: integer constant '-9223372036854775809' is outside the 64-bit signed integer bounds
+Kconfig:67: error: integer constant '10000000000000000000' is outside the 64-bit signed integer bounds
+Kconfig:71: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned integer bounds
+Kconfig:75: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned integer bounds
+Kconfig:79: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned integer bounds
+Kconfig:79: error: hex constant '0x20000000000000000' is outside the 64-bit unsigned integer bounds
diff --git a/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr b/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
index 4974ba2fcd9c..005f855ecbdd 100644
--- a/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
+++ b/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
@@ -1,14 +1,16 @@
-Kconfig:17: error: 'INT_DEFAULT_BOOL': number is invalid
-Kconfig:21: error: 'INT_DEFAULT_TRISTATE': number is invalid
-Kconfig:25: error: 'INT_DEFAULT_STRING': number is invalid
-Kconfig:31: error: 'HEX_DEFAULT_BOOL': number is invalid
-Kconfig:35: error: 'HEX_DEFAULT_TRISTATE': number is invalid
-Kconfig:39: error: 'HEX_DEFAULT_STRING': number is invalid
-Kconfig:45: error: range is invalid
-Kconfig:49: error: range is invalid
-Kconfig:53: error: range is invalid
-Kconfig:57: error: range is invalid
-Kconfig:63: error: range is invalid
-Kconfig:67: error: range is invalid
-Kconfig:71: error: range is invalid
-Kconfig:75: error: range is invalid
+Kconfig:17: error: 'BOOL_SOURCE' is an invalid value for 'integer'
+Kconfig:21: error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
+Kconfig:25: error: 'STRING_SOURCE' is an invalid value for 'integer'
+Kconfig:31: error: 'BOOL_SOURCE' is an invalid value for 'hex'
+Kconfig:35: error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
+Kconfig:39: error: 'STRING_SOURCE' is an invalid value for 'hex'
+Kconfig:45: error: 'BOOL_SOURCE' is an invalid value for 'integer'
+Kconfig:49: error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
+Kconfig:53: error: 'STRING_SOURCE' is an invalid value for 'integer'
+Kconfig:57: error: 'BOOL_SOURCE' is an invalid value for 'integer'
+Kconfig:57: error: 'TRISTATE_SOURCE' is an invalid value for 'integer'
+Kconfig:63: error: 'BOOL_SOURCE' is an invalid value for 'hex'
+Kconfig:67: error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
+Kconfig:71: error: 'STRING_SOURCE' is an invalid value for 'hex'
+Kconfig:75: error: 'BOOL_SOURCE' is an invalid value for 'hex'
+Kconfig:75: error: 'TRISTATE_SOURCE' is an invalid value for 'hex'
-- 
2.55.0

