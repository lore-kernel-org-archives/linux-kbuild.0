Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB88E38D40F
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077149; cv=none; b=jcL82MjULAqupGb+3PBMmTvVuOzgAywZB8xh6SvG7Ye8VDGnFJ/a+IdB/1pkNb4ddQFVTYEbuoHb2ykl74RL3f9aBef5p2bFCSONSabeidpMGtoddnhBR4xD7SlrO2XqUm/sg+bx7yQKdjVrFl1dEBQlRaYqcfGM3deweyPPjYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077149; c=relaxed/simple;
	bh=AiNN3WKbva/m6cTrFg55gfomjR/3Wk8NnzmO0nDZ0iI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vp0ae9pSSBqcJGVyTOfo2RUCgroWmtOSLN9fld+ZHmDWIxV5rJ+43I3mcHgoBVuFiniJzVnDCuk6IG3bPRPujqamfNA1dSgRK7u0tX9oeRPaLZASZe6Fp1X704jJhgejchhcuhrLlSLKLOaz9b+0VRSJZmVxajG+d9wMIdUuPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvS9l26G; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvS9l26G"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a58f2ce443so2127161fa.2
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Sep 2026 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077146; x=1789681946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oavHDGIbbjrAPnmUdm84AzEMwN9p4hHnQqg9+zNcCEY=;
        b=fvS9l26GtQVrVPqd0vCcrfnp32qFovRzre4JWhVX9Z5F2Q44nYXnD2qspgnfukxGmT
         /JHtEzT0hvV6S03+fP+5/+5+7wA4ghSxDqKUGz+U4KZdqN76bJ4cv+UGjLGf1asYORrA
         RuNL3vcka1dV72TkurqR4slNZrijrmVrJqBilsw9cDJWQPPhlJRZwXRjaE/V2mv75Yhl
         ME9CsnnB30dpGw1gAmje70fmoVK/P45XhxJTmYWbAxCI/mL+Sgp5R0KPCQlcl2/LsP1o
         Tc0InXnGA/pWK1I6T+hpigkcRi2KwuaTQ6HKI5B2i53lyXz+LbX0Xbg8cuiEPe7+9Gmm
         sVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077146; x=1789681946;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oavHDGIbbjrAPnmUdm84AzEMwN9p4hHnQqg9+zNcCEY=;
        b=Sdcyhz+SufClT+QE25NwZq3O5SU6kqjcY31xzanxEg68kD1Ym2Png9SNj7DJgy9vV0
         hhQ6zt5LRGYUbyXkWEH1tIBI1prgwLtJawcukwvWqlDpFm1xj5J555K2snwIBO6dW+6j
         XiuFXGQ+ia80xJrsuUeP+ljfr2dDu9Y1vydAuTFr3t3n5QNmmJPGLIc2356UmgZDbfa/
         w9NtFA3yPjKok0iywz1jsJNTgXWjFz5CTalqZ+k1Ii3tLewObRfdGZovNMzL5Iaw26xP
         5qvdwugSWK/t9zOsWE5Z0jRYk7E5OX96Spah8tEKRwaCSCzOm3wJ+S/Ipexn2T16nE12
         WWcg==
X-Forwarded-Encrypted: i=1; AKwUvBwm07Fi5h/2TFmM9yFQV8jHTmlwfYRPfsOzImdfzT8N4ObJbmjTVgcrLj68WmmxIgCq898zcgg3lRH+61g=@vger.kernel.org
X-Gm-Message-State: AFuF++nlL/g3xGjl4FHt4NAZSkZl8O1R3zxsWEwGB+1sAsG0C1zFEc/Z
	yoQcO88oXLkcocY0tyavANA7z0hv4GDAYWtjiq06Rv/9vlRizMOh/Tw=
X-Gm-Gg: AYBFou2Tc3w2DjQf9I2KPIOvQEEbHWPUvmF4T9jXb0W1k0YqXCH7PHqdI5WMGJeGHOo
	QFYqfX96wHoSPTE4uAYV7us0Y4y4nevgyYsL0EVwgpd+erx7JYgA2HPSep3AGkXyXR0XioRa8tV
	p4MyMeUjJntrNKR0deoJJoBANLmC+wHxi4vH4mPmSLp61RvmWDM0r43tqDlHeITDaLO59wldfcA
	RyINqcGcVEazbJH0TIS9LInM9HW7dUq/iOHq6/9mZs8rOgg1Cf1H3omibeW8rOV8Yy9s10MGc9g
	Wvzni+DLFL/qZwfPbMBVEW64ChLSaPgsL1U/6eaRzvm6UW6CmIKHy2wEihNR49Etiz4UeYP+dgs
	nRPcg9HuBq8kBUCuyXezsw1kQL5/QybKoceA80WphOc2cDUWoorid5NAm2BQcbjSdmzBIZpqZwm
	DofZJ8E900gJWsbluzEzzHZ6Ov/fVmoJh+gxPhtiYhgdYAhzAEPtNtTWKvvSNWoJEM+YKnkzM/4
	RNpbCHiG4ELE+6SZtSzkzrEbw4z0LhEU6B3dlXV9BV5RhR6ygMAme5vFieo3MfzejgEH5Zb3a65
	ku3/
X-Received: by 2002:a05:6512:691:b0:5b6:183c:5c96 with SMTP id 2adb3069b0e04-5b8a031abafmr332836e87.52.1789077145540;
        Thu, 10 Sep 2026 14:52:25 -0700 (PDT)
Received: from insciwin.localdomain (224.105.88.34.bc.googleusercontent.com. [34.88.105.224])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456bb2sm150874e87.14.2026.09.10.14.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:52:25 -0700 (PDT)
From: Dmitrii Tulnov <tulnov.dl@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	jacmet@uclibc.org,
	yann.morin.1998@free.fr,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] kconfig: warn about malformed KCONFIG_PROBABILITY values
Date: Fri, 11 Sep 2026 00:52:24 +0300
Message-ID: <20260910215224.26-1-tulnov.dl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <55e18f27-0ba1-433e-b4dc-a7db70172f7a@gmail.com>
References: <55e18f27-0ba1-433e-b4dc-a7db70172f7a@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

randconfig checks the numeric range of each probability but does not
validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
accepted as 50:0:0: the '%' is parsed repeatedly as zero. For the
documented value 50, tristate y/m/n probabilities are 25%/25%/50%.
With 50%, both y/m probabilities silently become zero, reducing the
coverage of random configuration builds. Empty fields and extra fields
are also accepted.

Warn when the value does not follow the documented decimal format. For
malformed inputs whose parsed probabilities are in range, preserve the
existing interpretation unless KCONFIG_WERROR is set. In that case, exit
with an error before writing the configuration. Leading whitespace and
signs are accepted by strtol(), but also trigger the warning because they
are outside the documented format.

Keep the strtol() result as long until the range check. This rejects
out-of-range values that narrowing to int previously made valid, such as
4294967296 becoming zero on a 64-bit host, regardless of KCONFIG_WERROR.

Add regression tests for one warning per malformed input, preserved
configurations, KCONFIG_WERROR, out-of-range values, the supported
probability formats, and the documented empty-value default.

Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
Assisted-by: LLM
Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
---
Thanks, Julian. I've moved the KCONFIG_WERROR cleanup fixture to
scripts/kconfig/tests/conftest.py.

Changes since v3:
- Move the KCONFIG_WERROR cleanup fixture to the shared conftest.py,
  as requested by Julian. Explicit extra_env settings still enable WERROR.

Changes since v2:
- Move the expected tristate distribution into the problem description.
- Simplify the initial format check to !isdigit((unsigned char)*env).
- Pass probability values and seeds through conf._run_conf(extra_env=...).
  Use monkeypatch.delenv only to remove inherited variables.
- Add -0, +0, bare + and - warning cases, and the +101 range-error case.
- Honor KCONFIG_WERROR for malformed format warnings, as discussed with
  Julian. Check unset, empty, 0 and 1 flag behavior.
- Compare 50% with 50:0:0 and -0 with 0 across 20 fixed seeds and check
  that each malformed input produces exactly one warning.
- Clarify that compatibility applies to malformed in-range inputs with
  KCONFIG_WERROR unset; values previously accepted by narrowing now fail.

Changes since v1:
- Warn about malformed in-range values while retaining their previous
  interpretation by default.
- Warn about leading whitespace and signs as undocumented input.
- Clarify that 50 gives tristate y/m/n probabilities of 25%/25%/50%, and
  compare it with the equivalent input 50:25:25 across 20 fixed seeds.

Validation on kbuild-next, x86_64, GCC 13.3.0:
- make testconfig with HOSTCFLAGS=-Werror: 138 passed. The same 138 tests
  passed with KCONFIG_WERROR=1 inherited from the test runner, including
  the explicit strict-mode cases for empty, 0 and 1 flag values.
- The same two runs passed on the existing ASan/UBSan build at -O1, with
  leak detection disabled: 138 passed in each run.
- C code, test inputs and assertions are unchanged from the submitted v3.
  Its earlier checks remain applicable: 74 regression failures on the
  original; 1,635 comparisons with v2 and 380 documented-input comparisons
  with the original per build; 120 strict error file-preservation checks
  per build, including ALLCONFIG and OVERWRITECONFIG. These broader C
  checks were not rerun for the fixture move.
- No vmlinux build or boot test; this changes the host configuration tool.
  32-bit hosts and other libc implementations were not tested.

 scripts/kconfig/conf.c                        |  16 ++-
 scripts/kconfig/tests/conftest.py             |   6 +
 .../tests/randconfig_probability/Kconfig      |  12 ++
 .../tests/randconfig_probability/__init__.py  | 131 ++++++++++++++++++
 4 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
 create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fe8ba09b0..ca6d9d735 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -186,12 +186,23 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
 
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
+			if (!isdigit((unsigned char)*env) ||
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
@@ -227,6 +238,9 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
 			perror("KCONFIG_PROBABILITY");
 			exit(1);
 		}
+
+		if (warned && getenv("KCONFIG_WERROR"))
+			exit(1);
 	}
 
 	menu_for_each_entry(menu) {
diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index 66f95e4ed..2263bd2a3 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -312,6 +312,12 @@ class Conf:
         return self._matches('stderr', expected)
 
 
+@pytest.fixture(autouse=True)
+def clear_werror(monkeypatch):
+    # extra_env can set strict mode, but cannot remove an inherited flag.
+    monkeypatch.delenv('KCONFIG_WERROR', raising=False)
+
+
 @pytest.fixture(scope="module")
 def conf(request):
     """Create a Conf instance and provide it to test functions."""
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
index 000000000..78d367a9c
--- /dev/null
+++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
@@ -0,0 +1,131 @@
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
+    '-0', '+0', '+', '-', '+100:0', ' \t100:0', '0: \t100:0',
+])
+def test_malformed_warns(conf, probability):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': '0',
+    }) == 0
+    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
+    assert conf.stderr.count('warning:') == 1
+    assert conf.config is not None
+
+
+@pytest.mark.parametrize('probability, equivalent', [
+    ('50%', '50:0:0'),
+    ('-0', '0'),
+])
+@pytest.mark.parametrize('seed', range(20))
+def test_malformed_preserves_config(conf, probability, equivalent, seed):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': hex(seed),
+    }) == 0
+    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
+    assert conf.stderr.count('warning:') == 1
+    malformed = conf.config
+
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': equivalent,
+        'KCONFIG_SEED': hex(seed),
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    assert conf.config == malformed
+
+
+@pytest.mark.parametrize('werror', ['', '0', '1'])
+@pytest.mark.parametrize('probability, status', [
+    ('', 0), ('50', 0), ('50%', 1), ('-0', 1), ('10:20:30:40', 1),
+])
+def test_werror(conf, probability, status, werror):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': '0',
+        'KCONFIG_WERROR': werror,
+    }) == status
+    if status:
+        assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
+        assert conf.stderr.count('warning:') == 1
+    else:
+        assert 'warning:' not in conf.stderr
+
+
+@pytest.mark.parametrize('probability', [
+    '-1', '101', '+101', '0:101', '0:0:101', '60:41', '0:60:41',
+    '4294967296', '-4294967296',
+    '999999999999999999999999', '-999999999999999999999999',
+])
+def test_out_of_range(conf, probability):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': '0',
+    }) == 1
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
+def test_valid(conf, probability, boolean, tristate):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': probability,
+        'KCONFIG_SEED': '0',
+    }) == 0
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
+def test_single_probability_matches_tristate_split(conf, seed):
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': '50',
+        'KCONFIG_SEED': hex(seed),
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    single = conf.config
+
+    # 50% boolean y; 25% tristate y, 25% m, and 50% n.
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': '50:25:25',
+        'KCONFIG_SEED': hex(seed),
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    assert conf.config == single
+
+
+def test_empty(conf, monkeypatch):
+    # extra_env overrides inherited variables, but cannot remove them.
+    monkeypatch.delenv('KCONFIG_PROBABILITY', raising=False)
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_SEED': '0',
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    default_config = conf.config
+
+    assert conf._run_conf('--randconfig', extra_env={
+        'KCONFIG_PROBABILITY': '',
+        'KCONFIG_SEED': '0',
+    }) == 0
+    assert 'warning:' not in conf.stderr
+    assert conf.config == default_config

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
