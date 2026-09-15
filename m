Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19754A4408
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506924; cv=none; b=ngtFTEgMTPXyOIgSY3Ynsp0ZRz0LXnHaH5+c8jqUo1ZQDfDNVI4Hpl73jkalMATvxW5oh/o5tloUBthO44STcuTrqWhN+FWcxpTipg0snR0nCj2niRW80rguZrjH6Q8WnmIgPOpEDjaf8tQdnEblImHi+L0tIRf6qShGj7PJ9ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506924; c=relaxed/simple;
	bh=Va0vYEznGgN5IvsG3Y+1s+N7u/nKGK2+xOSpnzhu8rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mx9mxllimQudIjvMtyQQ6k478envW58GqyOA/vWQFRIqpqMGNkmHvmrGRqAALTeVj3j5GUiaTjOW6Q7pGeUZ92JRwP0A2oFVez5zT86du3+J1Yr8QuduHz1VjnizVm4YdjoeWDWYZDZjWMBN/WDx5VPToFlw1DaU6NS8ZEI71wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVC0eJW2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVC0eJW2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so2931095e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 14:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506920; x=1790111720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6ZGHNtN6W4sgVfyHGRO9BipB405uodOKVOa/IqqFEc=;
        b=fVC0eJW2dPvjl6/SBl+iWCkoOQaplUfKkIeE6IKuAvHx/FWlFiihQDXlE34Ri0Xk20
         UqbBpTTNemcOnjvGFYTFaKKdQuG9FQPNOasfd1PR7P/a5RAnnPs48efOJCaNqFHdcGvR
         yFMHDSX9sLWzEmS/XjFDL/pffnf3yHAvTMgic6n/x3QJeE9hJhZ35esTHMp13WIdoPmZ
         rKiB+csuFwQlXQ6J0UJFWB9+onAh6STSgTzKPlHnhv5LW8pVcIANX456z7KWr9Yb30nC
         mYtUvoo/zwKzPuDmqgISl5HBml/PbTduYdcphxNudHfMlvXGzl0L4dRbZ9J7XJk0pL3y
         tPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506920; x=1790111720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6ZGHNtN6W4sgVfyHGRO9BipB405uodOKVOa/IqqFEc=;
        b=hReYohDMfkgzZ3mmjplz3qKUbv03VhIYpRibXF70GE0W/uXltf4eHBYx0tYpI31iN6
         kH0ag7fN4xG9i0dN3Rxgy9YQ5AFxLu6/62v8HJ1cir0SGSrPu/gQB6Y5VfTgVHHM7gCD
         hMW4ezJyjFnKyv59bMagg23aJkYYFzYyMbSaWpyQ5br0GjNwjHaEBoQMkyIkx//9N0tn
         ad7yWzeEKew2JXSdmbzUGzby9ADRKaOWZFjqnoFh+t2T5RlxVhxmu9Kl1812D0o6ppXt
         V5bno08RJHkqi+jlSS6ZwpgkeiB/R9OS1DNwy0KAtheUEjWBI+wLKJiO1ORRr/J25eFo
         DbOw==
X-Forwarded-Encrypted: i=1; AKwUvBzZlm+S4j6tALOyTUSQduDPkliuRMqoViPCue+NBCNGpH/HxYff8K1fgpTDey1+1uUsxub7Wod+jTVpufY=@vger.kernel.org
X-Gm-Message-State: AFuF++nYwp5DLnVPYVgdSY8/L0Yra5tegxMftNXOTuyGEfuHlPseW77a
	o4FQW1qBcBoHiQawhubFHKE3DSjlXrYkDWj8G7lUz+N2HJWFSdpmS57V
X-Gm-Gg: AYBFou3yOhQJmQ74MAvDCcK1UJACJtqlPNy7tbOtGUuGNDMre13eC8MzZMi6rItWF7S
	JqOMnLfs+8IQBDNI4O3RmYxSyH1PbInAMsoTwlWfsjsZZUHy3zwgAXiCaG/y3P2zybrzk+50tnX
	532OIuAFkSO1YLKYWww84Jc+NHDvUWbGR9+t/JAEVc63SegVZo1VwZUcfiHdBnDQlKBCo9ErTGv
	ehxin1Ul0fZKesl7CmX+46wSPQpH8sGZmpuOWlMX8VYhBovM5oG5hARsVyyCSySNpk0RwskvJzi
	QorWjVTm7djjJtC0zBwoFFYU5poTYnfWpD/Cd7Y6jTFWE/FA2hejrd182Tnvw5is0UTtg9vvXW9
	dYx0+kGjpoOeI1ymUXoQuAD1M+ZO3FOyB7X1H2+1sA1kPcKiG16we1j3oY0ntIpqFE+LIj3gFix
	yAvafD0Ow9b/r5W5r5rufH7t+UEYLb4qszDLN0NB5wAd09PP0r9fuPQ9T6Mg90DZIh/m5ILvZi9
	KdSIX/VRMV4aNaeErAOtIlOTPe8LF1S2Bmp
X-Received: by 2002:a05:600c:35c2:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49e821ffef1mr44587315e9.3.1789506919880;
        Tue, 15 Sep 2026 14:15:19 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:19 -0700 (PDT)
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
Subject: [PATCH v2 4/5] kconfig: prevent out-of-bounds user input for numeric options
Date: Tue, 15 Sep 2026 22:15:07 +0100
Message-ID: <20260915211508.291790-5-julianbraha@gmail.com>
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

Currently, user input of out-of-bounds values for 'int' and 'hex' options
is possible, leading to later silent failures in Kconfig if that value is
used in a comparison, or a warning by GCC or error by Clang if used in the
C code.

Let's factor out the out-of-bounds check on constants, so that it can be
reused for checking user input.

The frontend will now reject an attempted user input of an out-of-bounds
numeric value, similarly to how a value outside the active 'range' already
does.

For migration of existing configurations, a .config file with an
out-of-bounds numeric value will be allowed for now, but will warn the
user when read in by confdata.c

Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/confdata.c                    |  6 +++++
 scripts/kconfig/lkc_proto.h                   |  1 +
 scripts/kconfig/menu.c                        | 19 +++-----------
 scripts/kconfig/symbol.c                      | 20 +++++++++++++++
 .../tests/err_num_bounds/expected_stderr      | 20 +++++++--------
 scripts/kconfig/tests/warn_num_bounds/Kconfig | 24 ++++++++++++++++++
 .../kconfig/tests/warn_num_bounds/__init__.py | 25 +++++++++++++++++++
 scripts/kconfig/tests/warn_num_bounds/config  |  7 ++++++
 .../tests/warn_num_bounds/expected_config     | 11 ++++++++
 .../warn_num_bounds/expected_config_stderr    |  3 +++
 .../warn_num_bounds/expected_frontend_config  | 11 ++++++++
 .../warn_num_bounds/expected_frontend_stderr  |  0
 12 files changed, 121 insertions(+), 26 deletions(-)
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config_stderr
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_stderr

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 4234a51d16fd..2227d89d6328 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -354,6 +354,12 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 	case S_INT:
 	case S_HEX:
 		if (sym_string_valid(sym, p)) {
+			if (def != S_DEF_AUTO &&
+			    !sym_string_check_bounds(sym, p))
+				/* hex uses 64-bit unsigned integer */
+				conf_warning("value '%s' for %s is outside the 64-bit %s integer bounds",
+					     p, sym->name,
+					     sym->type == S_INT ? "signed" : "unsigned");
 			sym->def[def].val = xstrdup(p);
 			sym->flags |= def_flags;
 		} else {
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 8914b4e8f2a8..8b436c87ba4a 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -31,6 +31,7 @@ bool sym_set_tristate_value(struct symbol *sym,tristate tri);
 void choice_set_value(struct menu *choice, struct symbol *sym);
 tristate sym_toggle_tristate_value(struct symbol *sym);
 bool sym_string_valid(struct symbol *sym, const char *newval);
+bool sym_string_check_bounds(struct symbol *sym, const char *str);
 bool sym_string_within_range(struct symbol *sym, const char *str);
 bool sym_set_string_value(struct symbol *sym, const char *newval);
 bool sym_is_changeable(const struct symbol *sym);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 2d8b0c65ce1e..6b9ef738ee71 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -4,7 +4,6 @@
  */
 
 #include <ctype.h>
-#include <errno.h>
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
@@ -239,8 +238,6 @@ void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
 static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 				const struct property *prop)
 {
-	const char *type_bounds;
-
 	if (sym->type != S_INT && sym->type != S_HEX)
 		return 0;
 
@@ -255,21 +252,11 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 		return 1;
 	}
 
-	errno = 0;
-	if (sym->type == S_INT) {
-		type_bounds = "64-bit signed integer";
-		strtoll(sym2->name, NULL, 10);
-	} else {
-		/* hex */
-		type_bounds = "64-bit unsigned integer";
-		strtoull(sym2->name, NULL, 16);
-	}
-
-	if (errno == ERANGE) {
+	if (!sym_string_check_bounds(sym, sym2->name)) {
 		fprintf(stderr,
-			"%s:%d: error: %s constant '%s' is outside the %s bounds\n",
+			"%s:%d: error: %s constant '%s' is outside the 64-bit %s bounds\n",
 			prop->filename, prop->lineno, sym_type_name(sym->type),
-			sym2->name, type_bounds);
+			sym2->name, sym->type == S_INT ? "signed" : "unsigned");
 
 		return 1;
 	}
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index e82f330fb8ee..0b3d19af269f 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -5,6 +5,7 @@
 
 #include <sys/types.h>
 #include <ctype.h>
+#include <errno.h>
 #include <stdlib.h>
 #include <string.h>
 #include <regex.h>
@@ -711,6 +712,21 @@ bool sym_string_valid(struct symbol *sym, const char *str)
 	}
 }
 
+bool sym_string_check_bounds(struct symbol *sym, const char *str)
+{
+	errno = 0;
+
+	if (sym->type == S_INT)
+		strtoll(str, NULL, 10);
+	else if (sym->type == S_HEX)
+		strtoull(str, NULL, 16);
+	else
+		/* string */
+		return true;
+
+	return errno != ERANGE;
+}
+
 bool sym_string_within_range(struct symbol *sym, const char *str)
 {
 	struct property *prop;
@@ -722,6 +738,8 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
 	case S_INT:
 		if (!sym_string_valid(sym, str))
 			return false;
+		if (!sym_string_check_bounds(sym, str))
+			return false;
 		prop = sym_get_range_prop(sym);
 		if (!prop)
 			return true;
@@ -731,6 +749,8 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
 	case S_HEX:
 		if (!sym_string_valid(sym, str))
 			return false;
+		if (!sym_string_check_bounds(sym, str))
+			return false;
 		prop = sym_get_range_prop(sym);
 		if (!prop)
 			return true;
diff --git a/scripts/kconfig/tests/err_num_bounds/expected_stderr b/scripts/kconfig/tests/err_num_bounds/expected_stderr
index 3f06e13359ef..5f89cf4afff8 100644
--- a/scripts/kconfig/tests/err_num_bounds/expected_stderr
+++ b/scripts/kconfig/tests/err_num_bounds/expected_stderr
@@ -1,10 +1,10 @@
-Kconfig:51: error: integer constant '10000000000000000000' is outside the 64-bit signed integer bounds
-Kconfig:55: error: integer constant '-9223372036854775809' is outside the 64-bit signed integer bounds
-Kconfig:59: error: integer constant '10000000000000000000' is outside the 64-bit signed integer bounds
-Kconfig:63: error: integer constant '-10000000000000000000' is outside the 64-bit signed integer bounds
-Kconfig:67: error: integer constant '-9223372036854775809' is outside the 64-bit signed integer bounds
-Kconfig:67: error: integer constant '10000000000000000000' is outside the 64-bit signed integer bounds
-Kconfig:71: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned integer bounds
-Kconfig:75: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned integer bounds
-Kconfig:79: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned integer bounds
-Kconfig:79: error: hex constant '0x20000000000000000' is outside the 64-bit unsigned integer bounds
+Kconfig:51: error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
+Kconfig:55: error: integer constant '-9223372036854775809' is outside the 64-bit signed bounds
+Kconfig:59: error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
+Kconfig:63: error: integer constant '-10000000000000000000' is outside the 64-bit signed bounds
+Kconfig:67: error: integer constant '-9223372036854775809' is outside the 64-bit signed bounds
+Kconfig:67: error: integer constant '10000000000000000000' is outside the 64-bit signed bounds
+Kconfig:71: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
+Kconfig:75: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
+Kconfig:79: error: hex constant '0x10000000000000000' is outside the 64-bit unsigned bounds
+Kconfig:79: error: hex constant '0x20000000000000000' is outside the 64-bit unsigned bounds
diff --git a/scripts/kconfig/tests/warn_num_bounds/Kconfig b/scripts/kconfig/tests/warn_num_bounds/Kconfig
new file mode 100644
index 000000000000..a810225a58a3
--- /dev/null
+++ b/scripts/kconfig/tests/warn_num_bounds/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+
+mainmenu "Numeric bounds test"
+
+config INT_TOO_LOW
+	int "Integer below its type bounds"
+
+config INT_TOO_HIGH
+	int "Integer above its type bounds"
+
+config HEX_TOO_HIGH
+	hex "Hex value above its type bounds"
+
+config INT_MIN
+	int "Minimum valid integer"
+
+config INT_MAX
+	int "Maximum valid integer"
+
+config HEX_MIN
+	hex "Minimum valid hex value"
+
+config HEX_MAX
+	hex "Maximum valid hex value"
diff --git a/scripts/kconfig/tests/warn_num_bounds/__init__.py b/scripts/kconfig/tests/warn_num_bounds/__init__.py
new file mode 100644
index 000000000000..db7518258217
--- /dev/null
+++ b/scripts/kconfig/tests/warn_num_bounds/__init__.py
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+"""Test user values outside the numeric type bounds."""
+
+
+def test(conf):
+    in_keys = (
+        '-9223372036854775809\n'
+        '-1\n'
+        '9223372036854775808\n'
+        '1\n'
+        '0x10000000000000000\n'
+        '0x1\n'
+        '-9223372036854775808\n'
+        '9223372036854775807\n'
+        '0x0\n'
+        '0xffffffffffffffff\n'
+    )
+
+    assert conf.oldaskconfig(in_keys=in_keys) == 0
+    assert conf.stderr_matches('expected_frontend_stderr')
+    assert conf.config_matches('expected_frontend_config')
+
+    assert conf.olddefconfig('config') == 0
+    assert conf.stderr_matches('expected_config_stderr')
+    assert conf.config_matches('expected_config')
diff --git a/scripts/kconfig/tests/warn_num_bounds/config b/scripts/kconfig/tests/warn_num_bounds/config
new file mode 100644
index 000000000000..74bf263f99bf
--- /dev/null
+++ b/scripts/kconfig/tests/warn_num_bounds/config
@@ -0,0 +1,7 @@
+CONFIG_INT_TOO_LOW=-9223372036854775809
+CONFIG_INT_TOO_HIGH=9223372036854775808
+CONFIG_HEX_TOO_HIGH=0x10000000000000000
+CONFIG_INT_MIN=-9223372036854775808
+CONFIG_INT_MAX=9223372036854775807
+CONFIG_HEX_MIN=0x0
+CONFIG_HEX_MAX=0xffffffffffffffff
diff --git a/scripts/kconfig/tests/warn_num_bounds/expected_config b/scripts/kconfig/tests/warn_num_bounds/expected_config
new file mode 100644
index 000000000000..8b1aef612bc6
--- /dev/null
+++ b/scripts/kconfig/tests/warn_num_bounds/expected_config
@@ -0,0 +1,11 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Numeric bounds test
+#
+CONFIG_INT_TOO_LOW=-9223372036854775809
+CONFIG_INT_TOO_HIGH=9223372036854775808
+CONFIG_HEX_TOO_HIGH=0x10000000000000000
+CONFIG_INT_MIN=-9223372036854775808
+CONFIG_INT_MAX=9223372036854775807
+CONFIG_HEX_MIN=0x0
+CONFIG_HEX_MAX=0xffffffffffffffff
diff --git a/scripts/kconfig/tests/warn_num_bounds/expected_config_stderr b/scripts/kconfig/tests/warn_num_bounds/expected_config_stderr
new file mode 100644
index 000000000000..be2ed7fbf648
--- /dev/null
+++ b/scripts/kconfig/tests/warn_num_bounds/expected_config_stderr
@@ -0,0 +1,3 @@
+.config:1:warning: value '-9223372036854775809' for INT_TOO_LOW is outside the 64-bit signed integer bounds
+.config:2:warning: value '9223372036854775808' for INT_TOO_HIGH is outside the 64-bit signed integer bounds
+.config:3:warning: value '0x10000000000000000' for HEX_TOO_HIGH is outside the 64-bit unsigned integer bounds
diff --git a/scripts/kconfig/tests/warn_num_bounds/expected_frontend_config b/scripts/kconfig/tests/warn_num_bounds/expected_frontend_config
new file mode 100644
index 000000000000..a7e842517026
--- /dev/null
+++ b/scripts/kconfig/tests/warn_num_bounds/expected_frontend_config
@@ -0,0 +1,11 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Numeric bounds test
+#
+CONFIG_INT_TOO_LOW=-1
+CONFIG_INT_TOO_HIGH=1
+CONFIG_HEX_TOO_HIGH=0x1
+CONFIG_INT_MIN=-9223372036854775808
+CONFIG_INT_MAX=9223372036854775807
+CONFIG_HEX_MIN=0x0
+CONFIG_HEX_MAX=0xffffffffffffffff
diff --git a/scripts/kconfig/tests/warn_num_bounds/expected_frontend_stderr b/scripts/kconfig/tests/warn_num_bounds/expected_frontend_stderr
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.55.0

