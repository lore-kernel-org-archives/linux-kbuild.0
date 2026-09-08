Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A2C3C09FB
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2026 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899789; cv=none; b=nlTs4uz68gYuAyUcvQwTTEe4saG2I2o2FYXD7hR9NPeI40tOLb9ashAYOvhP+nE+Lesxi3JDwd7sIw7BqT7omsROJMxYRDQzWe+EMg9qt9taaoQxgH/BF8opbosJ8v9rikisjU1fU8Jy1dQM58ZJiK6Erj47Nxuz08A3dUkQkrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899789; c=relaxed/simple;
	bh=zkYcwZIVtXreAtLzkiw7fa+xT/69p9zJa9Z6Jwk94yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RN+7vKerxqeqAxzLQq1DbSHWiweGAsEUgURZ6L1e6ZKaaNlTD4aZRoF2Z3XULSe16N3VUk9aJT+P8tu4IhP7sM/kJ13PD2fVZJ6ExENW31p0hufucE/wcVYXvRCbHYzN1d4M/cd7CcYn2HWI1DoUvp8MLlRBMe3oWS8t98G/0XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etFR4odL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etFR4odL"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a499a6d02cso1723361fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2026 13:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788899786; x=1789504586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvN3ThehquKHoz1hU4ZS7uw/JRxde2RYZFNT4XCd1gI=;
        b=etFR4odLYF30vy/GuUqdLTJ8EefzYH1HsRYNrbOBXeQihMXfrk+fHjCABslcXLMCEo
         ijZ/wiW17HoziH27Q9Fys6smz7077y4+9Q9DD3vRALyQHbOTgQ8jlSTL6mggin09Og3X
         hWQ/nJzKWeWYlJDUVA1+wflt0VKT3J+2BGTfcShgTA0DHQP04hfSfbS92e4Vz/nYBX2j
         zxnXaClnUk1+ZLear4gRxlpa4P0zcxcZP+W6wl8YinW5ULukcdBHqFR3l8gO//p4Fgpy
         PQ5kdLh8n/tOEltHfbU11kci/UYF8c0Q8o6GhhRvXETN3RtW8iXdVh/baQZKt2ETPZs3
         sjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899786; x=1789504586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvN3ThehquKHoz1hU4ZS7uw/JRxde2RYZFNT4XCd1gI=;
        b=oj/0UVF7lRKSV1Y8jnuxf2dVZYgYOCNAp3FsrGt1iGTsRZrhSsjWhByjhh4fbi24+z
         MHteztV8WL9Kaooi0RNYWqVmQINVNwBJIy9eDGnX6aCY42sXuQ4nsQZb+AGoKBUe6mTO
         chpWEo4fzxxW1v20qWmVq7U0jCFcT/UL1ivmeQJ5Rt4DE6NNRvYX7t5Hd+uATtOmIN/V
         HzP0VrfXAsIRyI4HCeRdi9W12qIHCBbooACPwUpBwfazeJ4mpP8791SLINVoOUoyJ4nm
         1B4UrhHnn/ruU6Z9Vm+fARYMB/wNrrarNIfhHcU9fFNM0Fs/CTq6UvZhtJOYXJKxdGLG
         xPtQ==
X-Forwarded-Encrypted: i=1; AKwUvByWcccqDu8KbWWHbN8WJl+5jou5h68GoTfdhsOKVJSfNTq/IYNVv2LHnxZbhIDT0uXdDfje+n2OSN+IS3o=@vger.kernel.org
X-Gm-Message-State: AFuF++kS6FoTETax4KxWCpxZkIgFXelzwQsHtexEENED8C2vUWPIfwZH
	diIj8UIAnuKcA4W89p+cIZ5UYkV681H7eEfqC2HtXr+pxs3vg4A1lC4=
X-Gm-Gg: AYBFou0q7spl3svp16A8/X7bKRUFMHAcvnx9PrJA6IRdM0SIthNRh91cuNQzvRotCF0
	Sv3v2H9lL/IF0WbBK3NZ3Hkoxs9xJ4NXjcZgbufBkYSXga+QtSGgT0C9L0X6gE2hnHQUYN7uGEV
	Qw1ukwpdEMQrHnB05L1yI6sgzEyusTfUSCW6zQQfDTQcLKJLYLo3YJqmkNz89TLSGs1ZIOHNqpg
	KJXwLpbwFEUOTz3lkAxWmfKXN53+7Hg4G5r6qeV1IAdVMYT8NgtZm+HC332c5jaH2anxP1nA8ZR
	gQ33+dp0pLUX4xCXCPyNzbpw8rCIDIG6iszfdEq50OB8wgWdRHTodUnWBiqS59KaoUE4eV1FF72
	UcmBHBNDqFxO2AyCgnAErh548VvhrNYybPzsfBtDsG1udUctcXtvU+1ToO7tplgykVRE3egV8tH
	AI29GZkVpWLXa2wzpUJIHYBtAAlBPlnhSSOstZh+uUbfdN5XDT0ICAHYVIcTSFQlBVE0OWUPY9c
	XLVqPqrA3d4oJDBHXJQ6FOW0qDifSpIfjoELSgt0cuK0inA+wfHP8XDXS8ljPWcwDNfpQ==
X-Received: by 2002:a05:651c:b10:b0:3a2:feaf:6f9b with SMTP id 38308e7fff4ca-3a371b3b124mr36486921fa.7.1788899785413;
        Tue, 08 Sep 2026 13:36:25 -0700 (PDT)
Received: from insciwin.localdomain (224.105.88.34.bc.googleusercontent.com. [34.88.105.224])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a372e9efadsm35465301fa.39.2026.09.08.13.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:36:23 -0700 (PDT)
From: Dmitrii Tulnov <tulnov.dl@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Peter Korsgaard <jacmet@uclibc.org>,
	"Yann E. MORIN" <yann.morin.1998@free.fr>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: warn about malformed KCONFIG_PROBABILITY values
Date: Tue,  8 Sep 2026 23:36:21 +0300
Message-ID: <20260908203621.4-1-tulnov.dl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ce0786a7-e48d-4d7b-b601-86a598bb03d1@gmail.com>
References: <ce0786a7-e48d-4d7b-b601-86a598bb03d1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

randconfig checks the numeric range of each probability but does not
validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
accepted as 50:0:0: the '%' is parsed repeatedly as zero. This silently
sets both tristate y/m probabilities to zero, reducing the coverage of
random configuration builds. Empty fields and extra fields are also
accepted.

Warn when the value does not follow the documented decimal format. Keep
the existing parsing behavior for now so that users depending on these
inputs are not broken; the warning can be promoted to an error later.
The documented one-field value 50 gives tristate y/m/n probabilities of
25%/25%/50%. Leading whitespace and signs are accepted by strtol(), but are
also warned about because they are outside the documented format.
Keep the strtol() result as long until the range check so that narrowing
to int cannot turn an out-of-range value into a valid probability.

Add regression tests for malformed warnings and out-of-range values, the
supported probability formats, and the documented empty-value default.

Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
Assisted-by: LLM
Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
---
Changes since v1:
- Warn about malformed values while retaining their previous parsing behavior.
- Treat leading whitespace and signs as warning-only undocumented input.
- Clarify that 50 gives tristate y/m/n probabilities of 25%/25%/50%, and
  compare it with the equivalent input 50:25:25 across 20 fixed seeds.

Validation on kbuild-next, x86_64, GCC 13.3.0:
- make testconfig with HOSTCFLAGS=-Werror: 78 passed. Malformed values now
  produce warnings while preserving the previous parsing behavior; numeric
  range errors remain fatal.
- ASan/UBSan at -O1, with leak detection disabled: the same 78 tests passed.
- The fixed build accepted 916 of 1,635 generated inputs (including
  warning-only malformed values) and rejected 719 numeric range errors.
  It matched the original on 380 documented-input comparisons with fixed
  seeds. Range errors preserved an existing .config, including with
  KCONFIG_ALLCONFIG set.
- make defconfig, allnoconfig, allmodconfig and valid randconfig passed.
  KCONFIG_PROBABILITY=50% now produces a warning and remains compatible.
- No vmlinux build or boot test; this changes the host configuration tool.
  A 32-bit host build was unavailable because multilib headers were missing.

 scripts/kconfig/conf.c                        | 14 +++-
 .../tests/randconfig_probability/Kconfig      | 12 +++
 .../tests/randconfig_probability/__init__.py  | 79 +++++++++++++++++++
 3 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
 create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fe8ba09b0..33e8baf8d 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -186,12 +186,24 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	if (mode == def_random) {
 		int n, p[3];
+		bool warned = false;
 		char *env = getenv("KCONFIG_PROBABILITY");
 
 		n = 0;
 		while (env && *env) {
 			char *endp;
-			int tmp = strtol(env, &endp, 10);
+			long tmp = strtol(env, &endp, 10);
+
+			if (endp == env || isspace((unsigned char)*env) ||
+			    *env == '+' || *env == '-' ||
+			    (*endp && *endp != ':') ||
+			    (*endp == ':' && (!endp[1] || n == 2))) {
+				if (!warned) {
+					fprintf(stderr,
+						"warning: KCONFIG_PROBABILITY has malformed format\n");
+					warned = true;
+				}
+			}
 
 			if (tmp >= 0 && tmp <= 100) {
 				p[n++] = tmp;
diff --git a/scripts/kconfig/tests/randconfig_probability/Kconfig b/scripts/kconfig/tests/randconfig_probability/Kconfig
new file mode 100644
index 000000000..84f4e5fcc
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_probability/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config MODULES
+	bool
+	default y
+	modules
+
+config BOOL
+	bool "Bool"
+
+config TRI
+	tristate "Tristate"
diff --git a/scripts/kconfig/tests/randconfig_probability/__init__.py b/scripts/kconfig/tests/randconfig_probability/__init__.py
new file mode 100644
index 000000000..ff1770608
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only
+"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
+
+import pytest
+
+
+@pytest.mark.parametrize('probability', [
+    'invalid', ' ', '50%', '50 ', '0x32', '10 20', '10:20x',
+    '10:20:invalid', '10:20:30x',
+    ':50', '50:', '10::20', '10:20:', '10:20:30:', '10:20:30:40',
+    '+100:0', ' \t100:0', '0: \t100:0',
+])
+def test_malformed_warns(conf, monkeypatch, probability):
+    monkeypatch.setenv('KCONFIG_PROBABILITY', probability)
+
+    assert conf.randconfig(seed=0) == 0
+    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
+    assert conf.config is not None
+
+
+@pytest.mark.parametrize('probability', [
+    '-1', '101', '0:101', '0:0:101', '60:41', '0:60:41',
+    '4294967296', '-4294967296',
+    '999999999999999999999999', '-999999999999999999999999',
+])
+def test_out_of_range(conf, monkeypatch, probability):
+    monkeypatch.setenv('KCONFIG_PROBABILITY', probability)
+
+    assert conf.randconfig(seed=0) == 1
+    assert 'KCONFIG_PROBABILITY:' in conf.stderr
+
+
+@pytest.mark.parametrize('probability, boolean, tristate', [
+    ('0', 'n', 'n'),
+    ('0:0', 'n', 'n'),
+    ('100:0', 'y', 'y'),
+    ('0:100', 'y', 'm'),
+    ('100:0:0', 'y', 'n'),
+    ('0:100:0', 'n', 'y'),
+    ('0:0:100', 'n', 'm'),
+    ('000:000:100', 'n', 'm'),
+])
+def test_valid(conf, monkeypatch, probability, boolean, tristate):
+    monkeypatch.setenv('KCONFIG_PROBABILITY', probability)
+
+    assert conf.randconfig(seed=0) == 0
+    assert 'warning:' not in conf.stderr
+    for symbol, value in [('BOOL', boolean), ('TRI', tristate)]:
+        if value == 'n':
+            expected = '# CONFIG_{} is not set'.format(symbol)
+        else:
+            expected = 'CONFIG_{}={}'.format(symbol, value)
+        assert expected in conf.config.splitlines()
+
+
+@pytest.mark.parametrize('seed', range(20))
+def test_single_probability_matches_tristate_split(conf, monkeypatch, seed):
+    monkeypatch.setenv('KCONFIG_PROBABILITY', '50')
+    assert conf.randconfig(seed=seed) == 0
+    assert 'warning:' not in conf.stderr
+    single = conf.config
+
+    # 50% boolean y; 25% tristate y, 25% m, and 50% n.
+    monkeypatch.setenv('KCONFIG_PROBABILITY', '50:25:25')
+    assert conf.randconfig(seed=seed) == 0
+    assert 'warning:' not in conf.stderr
+    assert conf.config == single
+
+
+def test_empty(conf, monkeypatch):
+    monkeypatch.delenv('KCONFIG_PROBABILITY', raising=False)
+    assert conf.randconfig(seed=0) == 0
+    assert 'warning:' not in conf.stderr
+    default_config = conf.config
+
+    monkeypatch.setenv('KCONFIG_PROBABILITY', '')
+    assert conf.randconfig(seed=0) == 0
+    assert 'warning:' not in conf.stderr
+    assert conf.config == default_config

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
