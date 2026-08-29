Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF1277CAD
	for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 17:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024008; cv=none; b=edI1xBz3JzrizxTZdEF6+l7yQmfgGXttZcV+IfIdgd/Lo8AbIUTWyLoeWbYTtDOx/afLOJwL8ovmAN0rSAccdlxvAtPNo7jkyrT8pn9gQiJBVPN1RRrTEYNqqvZjM+pQfYnVGmDycTp+tMliiVXGp0A+WpjGxn7J3WH4xipL2Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024008; c=relaxed/simple;
	bh=FRGBjrUglqZRDJsdGH+697rjJyOvMHd9FF6O2v2HbLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFXN1hjRf00kNVbEGDvTG6dOF7iyKEeGni3sfSYAQ8Gt5uxG4OosJDUAzNdnypYBqiaNTk9MjKMr0ijHRWXx3WU5YRi6TG8P39K0njLiRr2CggNQ/KaML/mzBZidu9HDKRg9XCJ2/KSbi2OKoY/3KpDbgHA5bYJFcKrnMds68Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUk8rxzA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUk8rxzA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4957eefd361so16311765e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788024002; x=1788628802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KT7lwoy3ywWQB29hoYCTALB62E661QzMt/79coS01X0=;
        b=YUk8rxzAabqniagECQ0npFHr9i1rECMqvalm3LLmEiqSU6ACZNF77yN7+xsdiR1dj4
         ayr4b4bupSw0nntTNDsNWTuVKptk0karW4sL++E36edDz2KFzQSci/etfsGdgE9x+q2u
         LtJk1Qvnxi9AmcD2ht5+M5D4Yp5OZTMXwdSymCRBZV1INw3nxwdPJZuCsKw29RW1cwNg
         Cxsc+rZ25HhrWmAjjpkEzhgSeeTjwVrAz12KkftJdChDXPOXXtiaWRmM3xsGSDKzVZtx
         HsjA+Rs7tMlPc/Tx0WFI2qqXS3j9/2Y+dgYCUbqPnknhFx9E+f2mlL261orgHBMeQx21
         qIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788024002; x=1788628802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KT7lwoy3ywWQB29hoYCTALB62E661QzMt/79coS01X0=;
        b=Xa+QcrEYRs9519meGoA85gRmf38P5x4lxtfqQJpF4D9NRltc+z4XMPWsRnuknhD+cx
         Dx3X6A6rqDb5LEnsCs59I4kZJ9LnJo2tQ8XO5U3o2PWfzIsfiU7QlG7BkyYEQc0Sy1gH
         J6yVnOMq7QLu6Fv2LzsevvpqRfyMXPD7GJBNnvZsiJkiq3TgfHY5Ak8OCeSGR60U7vSr
         yGIilwnhQxolYtyxavCV4apWIQzp2HPT5B7g3fMzcU/R7wKufnSJngUJ3XtjtviSovGz
         M5VUOS93ONtJyjqmn6BF3DMRYxwe9ntBZcrkqRy2ZEcFM7cy88ryYcd1O17sTuq/kfEA
         INNw==
X-Forwarded-Encrypted: i=1; AHgh+RqiKxMWXyse8FxL3s54j2flcrQ0Jp/D6K4mmOmIBollgReMcF8sPUZvXK0AgKy/nAFH33PS0DIEc2w7bjY=@vger.kernel.org
X-Gm-Message-State: AFuF++n/ftCwJRMhdmakld2Dsmop/B8+GyaPQs/3KZ0L9hW06D/bjMjs
	UA9e3s6lQgdHhqlyOmI8VeiOlx14oZbCazV87kLMFLJNttgP1o0E/ers
X-Gm-Gg: AR+sD10w4MrTeiBiv3BJKqRhHc0oNL6T6wniRiyAuiw5j21qRLvvvnM3UeWpYg71UcY
	frsyApKsRlPbRnYU+4VnVfpmzWsK+2Ds18QgJHTQ5cGnWrCw8ZBlWxCfcUCc8KMILONs6uX4p3H
	Yk0ZR/FjBrW/StGfC0u3Ry7l6Y4oemnMc7bIsQm9BrMVNjjdoCUEBIIq3UaxfHirD5XA090XxdO
	B0K0zBoGxuVXN+qxQQU/1QMfosWH2M/UANz29p8Vt2GXs5DZAVjaUmIBpkOEzx7DBogulXbypiF
	kd41t0LUKaL6Lx7eyse8kR8o4zHpYAUUBvzKDhLiQYxTHluI9Okk+qwik+xuoxdsYDe8vqX9ST7
	+89E3fY2xZrDAbMYOtKlWGUFiNPvsra9ACLrxUC7BoyNxNS5T2Eow4iGoVsj2W6UFoXWHa2XFUB
	mCYCb8TQJsa3WE3Y+uP1B8zv+9Tm8hyNtpV9WLmyhxfxIiCkigj5w+wDDmCQyVdExG4XHOM2pWN
	OYPHR9Ilbr3x/ZZ30AdMrctb+AQc7EtPO2LyAjw9coAjkM6Wnwj
X-Received: by 2002:a05:600c:1549:b0:49c:d294:41e5 with SMTP id 5b1f17b1804b1-49cd294439fmr5324165e9.8.1788024001667;
        Sat, 29 Aug 2026 10:20:01 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm121080285e9.1.2026.08.29.10.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:20:01 -0700 (PDT)
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
Subject: [PATCH 2/4] kconfig: check for out-of-bounds numeric constants
Date: Sat, 29 Aug 2026 18:19:00 +0100
Message-ID: <20260829171902.1510587-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829171902.1510587-1-julianbraha@gmail.com>
References: <20260829171902.1510587-1-julianbraha@gmail.com>
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

Assisted-by: Codex:gpt-5.6-sol
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

