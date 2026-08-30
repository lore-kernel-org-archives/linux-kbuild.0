Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BB63033E1
	for <linux-kbuild@vger.kernel.org>; Sun, 30 Aug 2026 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788127963; cv=none; b=Z4t/Z71Pwjl+H/aa2W7r4dsFDdS3rtMYyl+B+ZWq3sYGz0JFs8TB7HPHcMYAw4Cgi/pHCJKGD2wrqc8jffoUMdhVCU0uBDw/Wk8+U/AZOUr2S/M4KPhxt9qVIPoKgEhD5ycprPjUTJybmikPPRv5ifpLP7/0g5UGv+MddzLgHr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788127963; c=relaxed/simple;
	bh=0k0/K1h7iJnBD1RM8PcIS6WHZ9fsGININoOuLR2B7Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+aAR3OqSdJOcIGzqF0eMok87BXWUdDAGI4mKztyl3vns6bJ48HHvTYP3CYJRddaozJfo10BAwrgGX7l4Gm70ORMPfXEGcMSHsB7HXpRiQKWKGtYo+m1Jy8/95yY3YqJO3sfyY7SxJUZi/2ObSaBzlZHImDa4Vh9trztEzm3Xz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oxc7YlJn; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oxc7YlJn"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1695912f8f.1
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Aug 2026 15:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788127959; x=1788732759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srjf7zm9MvsQ8AT5df0Jf/lQMt3Par1XDisepXhbwtM=;
        b=Oxc7YlJngzSIGKx+Zf5lloo6Ji5VoXaEUz7vGp7ZS8sQU0bbvxBZLVJXKjddQLGNlL
         jks2SZ+zQ/NUbpYmFbnPxphL1jOsvjGYhd801oDQU//08L83IP/0FhhyRJDyVSDQ4RNh
         /gIvHYY/kRwD93j/vXLUq+GMHijT3LEk4ChkGW77ja8yO723lAokOhhRv4yVcwlXWjuq
         bxYqmHtELDDfbYDyzBX8a4WJhHvembNBRPjWV5WjzgDgmNC7siH/reCUZVDE6bGngWg2
         JyYUewDqc9PDYz1kOszqq9WjQXmxxFPQrQvOFq5haxM9y0eQshS/n2Wb5CHmLZXNuP5P
         BpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788127959; x=1788732759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srjf7zm9MvsQ8AT5df0Jf/lQMt3Par1XDisepXhbwtM=;
        b=XJlGGRjsRSwvuvmU8Lakrtx67txJ50Lb+iWb162vIUT1FWT7xhHpiqpNghO94vT0ke
         qrDpxPKNQ8f9V6t+i+g4h3obHuf4WSl+Hn1mD7ZVN+OU5+L20GlBJukdWrt1GGO5Vbl5
         VDNEhd/ngLWpg9WA3Yc40O9QiydlWpBy6U27LugOb7dLZeGO39pIqqokiziNiTFZ4iA0
         ZOOTmr5o/Zm09fQL0hmit28VdPtyTCLN9f//SC5NsgGgZzfmPV5yHNh7WFE9Z5mUCCob
         JV7cFz+WQmH0kQ647SwDJummfw5qQc2tOY7EBH/dMamPJ5oJQPN3RKMccrX5NGRDSuBW
         g12g==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZdInKgxjAZMrLV3LwRypsYtmxb8ClxDoigDKcHIfZDTzsV11I6BE/1axpI0lC0P8a66QHPWgqX9WmgY=@vger.kernel.org
X-Gm-Message-State: AFuF++n+0f9309hOFcKHLJ/HHo9Oqc3nLQy43mtwQ6+fqVU/WivPCEJR
	toOfMiqsExSyg0A76z+SEaw6vCq9qR6xRSrcOEfAdVWpZ0UOLdm5UfSS
X-Gm-Gg: AYBFou0YBz9ccylKqC6F5D4d9s7/2bKtWOy7LkGqXfHClNdy8woPDtldBT7Pp6bfWMU
	+N0Vg3Ms9TD5WPBnzzHpWuJVFV868WVLBckT33ES6gU9SSkoRAJbb6TwLpIBNmpQSrt+n+o3V6w
	nWrpGi868vZcwAeS1DXIc0bH1Hyq7L5lXZetiE5oOWqy7hq/LXUL81mJauN5ZE926657uJB43D4
	czxtE9CEOy1Q7KmbOosxsVm/v1L+TpVmsrvhsTYzxvBkzFv4rMYiW/2XVm/HGqFp3HexGXct7xk
	0G5rUnGpmWUG8ILprgv9q11uM3IMuo31CfV7mMxDYrPZ4xN7LqLjWv+eqUlnGu01gGMKlapympT
	TpxXWjL6qKbD2hjIuRteaJ/2+EQpULDfX1lfJ32ovX7jVqsCI7JZSMQsq/AkL02hKKl+2VQDVeI
	jEyW5dwWckySbZ0lUzFNWzT6ZGNS6F4CSCRyaS47FdpyQrarFoBfQlOIwzKP6JApCQclhIS2M30
	R7FbkmzHkJlLUDzsQeJAe2QWZSOQd3NBCkR+OgrCtQOaGlQNcOy
X-Received: by 2002:a5d:5f47:0:b0:482:fb9e:4e20 with SMTP id ffacd0b85a97d-482fb9e5383mr29365528f8f.6.1788127959302;
        Sun, 30 Aug 2026 15:12:39 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af3asm7860749f8f.12.2026.08.30.15.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 15:12:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: geert@linux-m68k.org,
	xiang@kernel.org,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com,
	hongbohbli@tencent.com,
	guochunhai@vivo.com,
	michael.bommarito@gmail.com,
	kees@kernel.org,
	vegard.nossum@oracle.com,
	sam@ravnborg.org,
	u.kleine-koenig@pengutronix.de,
	mmarek@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] kconfig: fix extra output from savedefconfig on out-of-range defaults
Date: Sun, 30 Aug 2026 23:11:29 +0100
Message-ID: <20260830221129.2668354-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig interpreter currently allows defaults that are outside of the
range bounds.

In these cases, the 'sym_validate_range' function will adjust the default
value to the nearest range bound. For example, see this example:

  config A
    int
    range 1 2
    default 16

Here, since the default value of 16 is greater than the bounds, the
effective default value gets adjusted down to the upper bound, 2.

However, 'savedefconfig' writes non-default values, and without being
aware of the automatic adjustment to the range bound, it would write: A=2

This limitation is also documented in a comment: "The following fails to
handle the situation where a default value is further limited by the valid
range."

To resolve this, let's factor out the default-range adjustment logic from
the existing 'sym_validate_range' function into its own
'sym_get_near_range_bound' function for 'savedefconfig' to use too, so
that it compares against the effective value.

Adds tests, accordingly.

Fixes: 7cf3d73b4360 ("kconfig: add savedefconfig")
Assisted-by: Codex:gpt-5.6-sol
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/lkml/CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com/
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/symbol.c                      | 39 ++++++++----
 .../kconfig/tests/savedefconfig_range/Kconfig | 60 +++++++++++++++++++
 .../tests/savedefconfig_range/__init__.py     |  8 +++
 .../kconfig/tests/savedefconfig_range/config  |  7 +++
 .../savedefconfig_range/expected_defconfig    |  0
 5 files changed, 102 insertions(+), 12 deletions(-)
 create mode 100644 scripts/kconfig/tests/savedefconfig_range/Kconfig
 create mode 100644 scripts/kconfig/tests/savedefconfig_range/__init__.py
 create mode 100644 scripts/kconfig/tests/savedefconfig_range/config
 create mode 100644 scripts/kconfig/tests/savedefconfig_range/expected_defconfig

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 2d1c021fa395..72aaae9da4b1 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -158,7 +158,12 @@ static long long sym_get_range_val(struct symbol *sym, int base)
 	return strtoll(sym->curr.val, NULL, base);
 }
 
-static void sym_validate_range(struct symbol *sym)
+/*
+ * Return the nearest range bound for an out-of-range default value.
+ * Return NULL if the value is valid or the symbol has no active range.
+ */
+static struct symbol *sym_get_near_range_bound(struct symbol *sym,
+					  const char *value)
 {
 	struct property *prop;
 	struct symbol *range_sym;
@@ -173,21 +178,31 @@ static void sym_validate_range(struct symbol *sym)
 		base = 16;
 		break;
 	default:
-		return;
+		return NULL;
 	}
 	prop = sym_get_range_prop(sym);
 	if (!prop)
-		return;
-	val = strtoll(sym->curr.val, NULL, base);
+		return NULL;
+	val = strtoll(value, NULL, base);
 	range_sym = prop->expr->left.sym;
 	val2 = sym_get_range_val(range_sym, base);
 	if (val >= val2) {
 		range_sym = prop->expr->right.sym;
 		val2 = sym_get_range_val(range_sym, base);
 		if (val <= val2)
-			return;
+			return NULL;
 	}
-	sym->curr.val = range_sym->curr.val;
+
+	return range_sym;
+}
+
+static void sym_validate_range(struct symbol *sym)
+{
+	struct symbol *range_sym;
+
+	range_sym = sym_get_near_range_bound(sym, sym->curr.val);
+	if (range_sym)
+		sym->curr.val = range_sym->curr.val;
 }
 
 static void sym_set_changed(struct symbol *sym)
@@ -832,7 +847,7 @@ bool sym_set_string_value(struct symbol *sym, const char *newval)
 const char *sym_get_string_default(struct symbol *sym)
 {
 	struct property *prop;
-	struct symbol *ds;
+	struct symbol *ds, *range_sym;
 	const char *str = "";
 	tristate val;
 
@@ -850,11 +865,6 @@ const char *sym_get_string_default(struct symbol *sym)
 			val = EXPR_AND(expr_calc_value(prop->expr), prop->visible.tri);
 			break;
 		default:
-			/*
-			 * The following fails to handle the situation
-			 * where a default value is further limited by
-			 * the valid range.
-			 */
 			ds = prop_get_symbol(prop);
 			if (ds != NULL) {
 				sym_calc_value(ds);
@@ -898,6 +908,11 @@ const char *sym_get_string_default(struct symbol *sym)
 	default:
 		break;
 	}
+
+	range_sym = sym_get_near_range_bound(sym, str);
+	if (range_sym)
+		str = range_sym->curr.val;
+
 	return str;
 }
 
diff --git a/scripts/kconfig/tests/savedefconfig_range/Kconfig b/scripts/kconfig/tests/savedefconfig_range/Kconfig
new file mode 100644
index 000000000000..fd59d9082ed5
--- /dev/null
+++ b/scripts/kconfig/tests/savedefconfig_range/Kconfig
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# Static default and range values
+
+config INT_DEFAULT_ABOVE_RANGE
+	int
+	range 1 1
+	default 16
+
+config INT_DEFAULT_BELOW_RANGE
+	int
+	range 4 8
+	default 2
+
+# Default and range values determined by other options
+
+config RANGE_UPPER_BOUND
+	int
+	default 3
+
+config INT_DYNAMIC_RANGE
+	int
+	range 0 RANGE_UPPER_BOUND
+	default 4
+
+# Hex
+
+config HEX_DEFAULT_ABOVE_RANGE
+	hex
+	range 0x10 0x20
+	default 0x40
+
+# Implicit default value of 0
+
+config INT_IMPLICIT_DEFAULT_ZERO
+	int
+	range 1 4
+
+# Conditional range
+
+config USE_FIRST_RANGE
+	bool
+	default y
+
+config INT_CONDITIONAL_RANGE
+	int
+	range 1 2 if USE_FIRST_RANGE
+	range 3 4 if !USE_FIRST_RANGE
+	default 3
+
+# Conditional default
+
+config USE_DEFAULT
+	bool
+	default y
+
+config INT_CONDITIONAL_DEFAULT
+	int
+	range 1 2
+	default 3 if USE_DEFAULT
diff --git a/scripts/kconfig/tests/savedefconfig_range/__init__.py b/scripts/kconfig/tests/savedefconfig_range/__init__.py
new file mode 100644
index 000000000000..961454be732c
--- /dev/null
+++ b/scripts/kconfig/tests/savedefconfig_range/__init__.py
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+"""Test savedefconfig with numerical defaults outside of ranges."""
+
+
+def test(conf):
+    assert conf._run_conf('--savedefconfig=defconfig', dot_config='config',
+                          out_file='defconfig') == 0
+    assert conf.config_matches('expected_defconfig')
diff --git a/scripts/kconfig/tests/savedefconfig_range/config b/scripts/kconfig/tests/savedefconfig_range/config
new file mode 100644
index 000000000000..d939cfe5fd34
--- /dev/null
+++ b/scripts/kconfig/tests/savedefconfig_range/config
@@ -0,0 +1,7 @@
+CONFIG_INT_DEFAULT_ABOVE_RANGE=1
+CONFIG_INT_DEFAULT_BELOW_RANGE=4
+CONFIG_INT_DYNAMIC_RANGE=3
+CONFIG_HEX_DEFAULT_ABOVE_RANGE=0x20
+CONFIG_INT_IMPLICIT_DEFAULT_ZERO=1
+CONFIG_INT_CONDITIONAL_RANGE=2
+CONFIG_INT_CONDITIONAL_DEFAULT=2
diff --git a/scripts/kconfig/tests/savedefconfig_range/expected_defconfig b/scripts/kconfig/tests/savedefconfig_range/expected_defconfig
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.55.0

