Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E0418361
	for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 17:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024012; cv=none; b=av+hS6zygiQlWVdHZ1MpFbukXp4T2v5OO3e9gdxW+nU03UW/oqqRzwvdY6omQZ49T/NXnIcKUsqm1iAgAzgqRuw74X9EKtfTYlvH9RfEspgxSALM+e4e0hPQqnDUnoQ26HunT8Uyqiqzr57EMLEjdQN1uAMlQnxQvEz099tBYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024012; c=relaxed/simple;
	bh=OSaq2gMX1EKiVTeTsGVjMX55IkhV3apM5CD7fszP9uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TtbBjU+Iv2O4QIidxOp30Yx60Y4MUtyx1o1LbZXVb62fEtzOZw+3HERC/ZPPOKCphST2hczIphYPKmNYM2rsr1y8Mclj+g1rSH3hafhFCG7rXoNuCqpZDbcVrP0FwYlnxvYK6Vb0YYHtBMBSqeNYnSYWJ0usyGnxVFu1kUsfRy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJNG3cb5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJNG3cb5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso26126595e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788024006; x=1788628806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7iBDHstnVbLynr3vOPHFqOHTzA9DFC/5yqJJtpMTcc=;
        b=WJNG3cb5qoBR/V5yQYm5CNkDNwPNNEXlVtzNdianob9DtxqG6xiLvW+OvnNl/+9tiS
         t2JHum7suDGPAYKHznjTtPlthODcNzxcFcdyM3tb776BJ7i+AaTvz8ChfVxX9iET95HL
         /W40wFuyMS6a/Uu5bsq+3b/mFU2aaGyZz0DJjcynOwGRXnZGY8XJgM7Ba86Q/GbyZHOb
         +UtyIbAOayuN59KKEvAqxc/L4ZkbxTWbVqVWDqXHxw3IzcL2DSQVifPC42mzvHcRQfao
         7MDGwJRUtFDzL5u/OWMcRrKNPqtjmWAueV2CDVZEZTE/xWcbUlRBnGwNKQwc8LsF0VVS
         me6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788024006; x=1788628806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7iBDHstnVbLynr3vOPHFqOHTzA9DFC/5yqJJtpMTcc=;
        b=QxIfNCY3Ok30UvRbGoK4uUnSqpVJQSZlTISZnCBq4OvtUuUcHwt/lvFelzvGRDATfy
         gYt9+bAq7vXtieeyLJX5FKBrIw9E6RdD/b4oJy0RZ0HihtDXZi8vUdeMHf9mSfvMCCbN
         nAx0CDZ1sRNUyJJ/C7hBd+5jn4Th7vXZhXJiefrirF9mNGyuPzP3YOiMkkSlImrITyWZ
         vCUCFBANpYoLJFQ5ySPgKVaWiYwJz+kIuE9AdSJZfM+d3WlMMcz3LS/WiWG02dNh+Bcn
         hf5m0gt1xp7x5X8ArcMKP016wDa7VSYVSuRI9lWpm2JtNtZ8hKEzTYiV6CzDBt9W62Rg
         /XmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYR3uBgKp8ROVpWubVok0bjWeTKipTo383c6w988PAJwg4QSm8kMiUJFkuQEzgM8xqdLgPZ1vR6TsaEBc=@vger.kernel.org
X-Gm-Message-State: AFuF++mKP1Rrq++fkfV0TFI1i+PkZ+c5q/OOaZzb1Ab6jztACy5wmFqV
	UtFfLfGj0ev3fSkkLMvfEe4QA93/JHHIb0nPiwDOiF5OVSy28Uj3lSjzbcndQ32B3Sg=
X-Gm-Gg: AR+sD10+l+zl2t1H6GtwI9B5AmxWvFCgSQvWFGGm49i8dfNoyPHYJ2c5HsMIyr2P58n
	GIBWB/DB2EY5io4tpOD3lezgJSsKKpzNaoGMyFIyQZ0nUNvzttMohCeEKSpMWsrBIzk4mhFDKjX
	9sz6+jaQSxGMo4AIOFFJPP+fVvy8eeVo+zLYARUw7cB0QDZVbf7NXwwXNltCxy5KpXV/bupY3KP
	e1yV91fZDO47RNWIRNttlf7YrJ9pJUOoL9YNmwdBYh98hxd9F9QpRTRWFPNIfC/PpHf3LhzjmM6
	fvwL2e7Xb8HDLpNuxvsPkWCnhY39CbwGRdydF9kpESx3c0aAXIpPsZkMNxCcHbtIbLy9FfsaVx/
	IEADUAslCL1BPAf100D+1v4gbogLpu5rZa6H05dXGjr79+6zDnzovjZ0a8TL/Bh8LOhgvOh6Zln
	LhmhS+0hWe5thN5qOb8heGKPzwPRJABg0vzGgzKzDiMK9OzwEluVgXdiv+8yFTitVYQIq6+Y9A/
	5dxsEsUJAOllGasNkxfHhXp9vALM8agAu6XDQkcISsft1TiHUbU
X-Received: by 2002:a05:600c:34d1:b0:49c:ced8:303a with SMTP id 5b1f17b1804b1-49cced8316cmr53471535e9.14.1788024005472;
        Sat, 29 Aug 2026 10:20:05 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm121080285e9.1.2026.08.29.10.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:20:05 -0700 (PDT)
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
Subject: [PATCH 4/4] kconfig: prevent out-of-bounds user input for numeric options
Date: Sat, 29 Aug 2026 18:19:02 +0100
Message-ID: <20260829171902.1510587-5-julianbraha@gmail.com>
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

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/confdata.c                    |  6 +++++
 scripts/kconfig/lkc_proto.h                   |  1 +
 scripts/kconfig/menu.c                        | 11 +++-----
 scripts/kconfig/symbol.c                      | 20 +++++++++++++++
 scripts/kconfig/tests/warn_num_bounds/Kconfig | 24 ++++++++++++++++++
 .../kconfig/tests/warn_num_bounds/__init__.py | 25 +++++++++++++++++++
 scripts/kconfig/tests/warn_num_bounds/config  |  7 ++++++
 .../tests/warn_num_bounds/expected_config     | 11 ++++++++
 .../warn_num_bounds/expected_config_stderr    |  3 +++
 .../warn_num_bounds/expected_frontend_config  | 11 ++++++++
 .../warn_num_bounds/expected_frontend_stderr  |  0
 11 files changed, 111 insertions(+), 8 deletions(-)
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
index 2d8b0c65ce1e..6f99216ee76d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -4,7 +4,6 @@
  */
 
 #include <ctype.h>
-#include <errno.h>
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
@@ -255,17 +254,13 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 		return 1;
 	}
 
-	errno = 0;
-	if (sym->type == S_INT) {
+	if (sym->type == S_INT)
 		type_bounds = "64-bit signed integer";
-		strtoll(sym2->name, NULL, 10);
-	} else {
+	else
 		/* hex */
 		type_bounds = "64-bit unsigned integer";
-		strtoull(sym2->name, NULL, 16);
-	}
 
-	if (errno == ERANGE) {
+	if (!sym_string_check_bounds(sym, sym2->name)) {
 		fprintf(stderr,
 			"%s:%d: error: %s constant '%s' is outside the %s bounds\n",
 			prop->filename, prop->lineno, sym_type_name(sym->type),
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 7e81b3676ee9..2d1c021fa395 100644
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

